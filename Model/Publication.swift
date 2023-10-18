//
//  Publication.swift
//  ProyectoApp
//
//  Created by Alumno on 05/10/23.
//

import Foundation
import Alamofire
import SwiftUI
import SwiftyJSON
import PhotosUI
import FirebaseStorage

@Observable
class PublicationModel {
    var publications = [Publication]()
    var comments = [Comment]()
    
    init (){}
    let storage = Storage.storage()
    let headers = [ "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2OTY5NzMyNTYsImV4cCI6MTY5NzgzNzI1NiwidXNlcm5hbWUiOiJqY3NnIiwiZW1haWwiOiJlbWFpbCJ9.z9yU_sAdwzEkkg1XQfYrkUCAhYkDbbuEHoWlJZgdcAA", "Accept": "application/json", "Content-Type": "application/json" ]
    
    func fetchPublications(id_user: String) async{
        publications.removeAll()
        let url = "http://127.0.0.1:5000/publication/\(id_user)"
        AF.request(url, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            let json = try! JSON(data: data.data!)
            for pub in json {
                let publication = Publication(title: pub.1["title"].stringValue, media: pub.1["media_url"].stringValue, likes: pub.1["likes"].intValue, descption: pub.1["description"].stringValue, _id_mongo: pub.1["_id"]["$oid"].stringValue,
                                              id_user: pub.1["user_id"].stringValue, comments: pub.1["comments"].intValue, img_org: pub.1["img_org"].stringValue, media_type: pub.1["media_type"].stringValue
                )
                self.publications.append(publication)
            }
        }
    }

    
    func fetchPublicationsUser(id_user: String){
        publications.removeAll()
        let url = "http://127.0.0.1:5000/publication/user/\(id_user)"

        AF.request(url, method: .get ,encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            let json = try! JSON(data: data.data!)
            for pub in json {
                let publication = Publication(title: pub.1["title"].stringValue, media: pub.1["media_url"].stringValue, likes: pub.1["likes"].intValue, descption: pub.1["description"].stringValue, _id_mongo: pub.1["_id"]["$oid"].stringValue, id_user: pub.1["user_id"].stringValue, comments: pub.1["comments"].intValue, img_org: pub.1["img_org"].stringValue, media_type: pub.1["media_type"].stringValue)
                self.publications.append(publication)
            }
        }
    }
    
    func fetchPublicationsOrg(id: String) async{
        publications.removeAll()
        let url = "http://127.0.0.1:5000/publication/org/\(id)"
        AF.request(url, method: .get ,encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            let json = try! JSON(data: data.data!)
            for pub in json {
                let publication = Publication(title: pub.1["title"].stringValue, media: pub.1["media_url"].stringValue, likes: pub.1["likes"].intValue, descption: pub.1["description"].stringValue, _id_mongo: pub.1["_id"]["$oid"].stringValue, id_user: pub.1["user_id"].stringValue, comments: pub.1["comments"].intValue, img_org: pub.1["img_org"].stringValue, media_type: pub.1["media_type"].stringValue)
                self.publications.append(publication)
            }
        }
    }
    
    func uploadToFirestore(mediaURL: URL, name: String, completion: @escaping (URL?) -> Void) {
        let storageRef = storage.reference().child("publications/\(name)")

        // Prepare the metadata for the file based on its type (photo or video)
        let metaData = StorageMetadata()
        if getMediaType(from: mediaURL) == .photo {
            metaData.contentType = "image/jpeg"
        } else if getMediaType(from: mediaURL) == .video {
            metaData.contentType = "video/mp4"
        }

        storageRef.putFile(from: mediaURL, metadata: metaData) { metadata, error in
            if let error = error {
                print("Error uploading file: ", error)
                completion(nil)
                return
            }

            // Fetch the download URL
            storageRef.downloadURL { url, error in
                if let error = error {
                    print("Error getting downloadURL: ", error)
                    completion(nil)
                    return
                }

                if let downloadURL = url {
                    print("Media uploaded and download URL is: ", downloadURL)
                    completion(downloadURL)
                }
            }
        }
    }

    func postPublication(title: String, description: String, mediaURL: URL, org_id: String) async {
        let imageName = UUID().uuidString // Generating a unique name for the media
        uploadToFirestore(mediaURL: mediaURL, name: imageName) { [weak self] downloadURL in
            guard let self = self, let mediaURLdownload = downloadURL else {
                print("Error getting download URL.")
                return
            }

            let url = "http://127.0.0.1:5000/publication/add"
            let parameters: [String: Any] = [
                "title": title,
                "description": description,
                "user_id": "651f3c24f7fc02789f00d1f9",
                "org_id": org_id,
                "media_url": mediaURLdownload.absoluteString,
                "media_type": mediaURL.pathExtension
            ]
            print(parameters)
            
            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: HTTPHeaders(self.headers)).response { res in
                switch res.result {
                case .success(let data):
                    print("Success! \(String(describing: data))")
                case .failure(let error):
                    print("Error with the message: \(error.localizedDescription)")
                }
            }
        }
    }

    func getMediaType(from mediaURL: URL) -> MediaType? {
        // Determine the media type based on the file extension or other criteria
        let pathExtension = mediaURL.pathExtension.lowercased()
        
        if pathExtension == "jpg" || pathExtension == "jpeg" || pathExtension == "png" {
            return .photo
        } else if pathExtension == "mp4" {
            return .video
        }
        
        // Add more media type checks if needed
        
        return nil
    }

    enum MediaType {
        case photo
        case video
    }

    
    func fetchCommentsPub(id: String) async {
        comments.removeAll()
        let url = "http://127.0.0.1:5000/comment/\(id)"
        AF.request(url, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            let json = try! JSON(data: data.data!)
            for comm in json {
                let comment = Comment(id: comm.1["_id"]["$oid"].stringValue, comment: comm.1["comment"].stringValue, likes: comm.1["likes"].intValue, name: comm.1["name"].stringValue, img: comm.1["img_url"].stringValue)
                self.comments.append(comment)
            }
        }
    }
    
    func postComment(id_pub: String, id_user: String, comment: String) async {
        let url = "http://127.0.0.1:5000/comment/add/\(id_pub)"
        let parameters: [String:Any] = [
            "comment": comment,
            "user_id": id_user,
        ]
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: HTTPHeaders(self.headers)).response { res in
            switch res.result{
            case .success(let data): print("Success! \(String(describing: data))")
            case .failure(let error): print("Error with the message: \(error.localizedDescription)")
            }
        }
    }
    func likePub(id_pub: String, id_user: String){
        let url = "http://127.0.0.1:5000/publication/like/\(id_pub)"
        let params: [String: Any] = [
            "user_id": id_user
        ]
        AF.request(url, method: .put, parameters: params, encoding: JSONEncoding.default,
                   headers: HTTPHeaders(self.headers)).response{ res in
            switch res.result{
            case .success(let data): print("Success! \(String(describing: data))")
            case .failure(let error): print("Error with the message: \(error.localizedDescription)")
            }
        }
    }
    func dislikePub(id_pub: String, id_user: String){
        let url = "http://127.0.0.1:5000/publication/dislike/\(id_pub)"
        let params: [String: Any] = [
            "user_id": id_user
        ]
        AF.request(url, method: .patch, parameters: params, encoding: JSONEncoding.default, headers: HTTPHeaders(self.headers)).response{ res in
            switch res.result{
            case .success(let data): print("Success! \(String(describing: data))")
            case .failure(let error): print("Error with the message: \(error.localizedDescription)")
            }
        }
    }
    
    func likeComm(id_comm: String){
        let url = "http://127.0.0.1:5000/comment/like/\(id_comm)"
        AF.request(url, method: .patch, encoding: JSONEncoding.default,
                   headers: HTTPHeaders(self.headers)).response{ res in
            switch res.result{
            case .success(let data): print("Success! \(String(describing: data))")
            case .failure(let error): print("Error with the message: \(error.localizedDescription)")
            }
        }
    }
        
    func dislikeComm(id_comm: String){
        let url = "http://127.0.0.1:5000/comment/dislike/\(id_comm)"
        AF.request(url, method: .patch, encoding: JSONEncoding.default, headers: HTTPHeaders(self.headers)).response{ res in
            switch res.result{
            case .success(let data): print("Success! \(String(describing: data))")
            case .failure(let error): print("Error with the message: \(error.localizedDescription)")
            }
        }
    }
}
