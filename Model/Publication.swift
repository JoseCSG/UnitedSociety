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
    init (){}
    let storage = Storage.storage()
    let headers = [ "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2OTY4ODcxNDEsImV4cCI6MTY5Nzc1MTE0MSwidXNlcm5hbWUiOiJqY3NnIiwiZW1haWwiOiJlbWFpbCJ9.iL6twQRJDJiH-6JZWWBxd6tmVSwEklnqr-Fv_f32wXA", "Accept": "application/json", "Content-Type": "application/json" ]

    func fetchPublications(){
        publications.removeAll()
        let url = "http://127.0.0.1:5000/publication/"
        AF.request(url, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            let json = try! JSON(data: data.data!)
            for pub in json {
                let publication = Publication(title: pub.1["title"].stringValue, img: pub.1["img_url"].stringValue, likes: pub.1["likes"].intValue, descption: pub.1["description"].stringValue)
                self.publications.append(publication)
            }
        }
    }
    
    func uploadToFirestore(img: UIImage, name: String, completion: @escaping (URL?) -> Void) {
        let storageRef = storage.reference().child("publications/\(name)")
        // Compress the image
        let data = img.jpegData(compressionQuality: 0.2)
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        if let data = data {
            storageRef.putData(data, metadata: metaData) { (metadata, error) in
                if let error = error {
                    print("Error uploading file: ", error)
                    completion(nil)
                    return
                }
                
                // Fetch the download URL
                storageRef.downloadURL { (url, error) in
                    if let error = error {
                        print("Error getting downloadURL: ", error)
                        completion(nil)
                        return
                    }
                    
                    if let downloadURL = url {
                        print("Image uploaded and download URL is: ", downloadURL)
                        completion(downloadURL)
                    }
                }
            }
        } else {
            print("Error converting image to data.")
            completion(nil)
        }
    }

    func postPublication(title: String, description: String, img: UIImage){
        let imageName = UUID().uuidString // Generating a unique name for the image
        uploadToFirestore(img: img, name: imageName) { [weak self] downloadURL in
            guard let self = self, let imageUrl = downloadURL?.absoluteString else {
                print("Error getting download URL.")
                return
            }

            let url = "http://127.0.0.1:5000/publication/add"
            let parameters: [String: Any] = [
                "title": title,
                "description": description,
                "img_url": imageUrl,
                "user_id": "651f3c24f7fc02789f00d1f9",
                "org_id": "65245b7a73aaf5a7e19f2904",
            ]

            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: HTTPHeaders(self.headers)).response { res in
                switch res.result {
                case .success(let data): print("Success! \(String(describing: data))")
                case .failure(let error): print("Error with the message: \(error.localizedDescription)")
                }
            }
        }
    }

    
}
