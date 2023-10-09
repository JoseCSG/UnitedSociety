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


@Observable
class PublicationModel {
    var publications = [Publication]()
    init (){}
    let headers = [ "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2OTY1NDY4NTQsImV4cCI6MTY5NjYzMzI1NCwidXNlcm5hbWUiOiJqY3NnIiwiZW1haWwiOiJlbWFpbCJ9.10Gvjt5_OnRpjQEeCdnuWMrir6k4dlYjzapwcwL3lA0", "Accept": "application/json", "Content-Type": "application/json" ]

    func fetchPublications(){
        publications.removeAll()
        let url = "http://127.0.0.1:5000/publication/"
        AF.request(url, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            let json = try! JSON(data: data.data!)
            for pub in json {
                print(pub.1["title"].stringValue)
                let publication = Publication(title: pub.1["title"].stringValue, img: pub.1["img_url"].stringValue, likes: pub.1["likes"].intValue, descption: pub.1["description"].stringValue)
                self.publications.append(publication)
            }
        }
    }
}
