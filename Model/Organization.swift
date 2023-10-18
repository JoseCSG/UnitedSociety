//
//  Organization.swift
//  ProyectoApp
//
//  Created by Alumno on 09/10/23.
//

import Foundation
import Alamofire
import SwiftUI
import SwiftyJSON

@Observable
class OrganizationModel {
    var organizations = [Organization]()
    init (){}
    let headers = [ "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2OTY5NzMyNTYsImV4cCI6MTY5NzgzNzI1NiwidXNlcm5hbWUiOiJqY3NnIiwiZW1haWwiOiJlbWFpbCJ9.z9yU_sAdwzEkkg1XQfYrkUCAhYkDbbuEHoWlJZgdcAA", "Accept": "application/json", "Content-Type": "application/json" ]

    func fetchOrganizations(id_user: String) async {
        organizations.removeAll()
        let url = "http://127.0.0.1:5000/org/\(id_user)"
        AF.request(url, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            let json = try! JSON(data: data.data!)
            for org in json {
                var pubs = [Publication]()
                for pub in org.1["pubs"]{
                    let publication = Publication(title: pub.1["title"].stringValue, media: pub.1["media_url"].stringValue, likes: pub.1["likes"].intValue, descption: pub.1["description"].stringValue, _id_mongo: pub.1["_id"]["$oid"].stringValue, id_user: pub.1["user_id"].stringValue, comments: pub.1["comments"].intValue, img_org: pub.1["img_org"].stringValue, media_type: pub.1["media_type"].stringValue)
                    pubs.append(publication)
                }
                let tagsArray = org.1["org"]["tags"].arrayValue.map{$0.stringValue}
                let orga = Organization(id: org.1["org"]["_id"]["$oid"].stringValue, name: org.1["org"]["name"].stringValue, img: org.1["org"]["img_src"].stringValue, latitud: org.1["org"]["latitud"].doubleValue, longitud: org.1["org"]["longitud"].doubleValue, tags: tagsArray, mostLikedPubs: pubs, direccion: org.1["org"]["direction"].stringValue, colonia: org.1["org"]["colonia"].stringValue, municipio: org.1["org"]["municipio"].stringValue, numero: org.1["org"]["telefono"].stringValue, atention_hours: org.1["org"]["atention_hours"].stringValue, email: org.1["org"]["email"].stringValue, codigoPostal: org.1["org"]["postal_code"].stringValue, followers: org.1["org"]["followers"].intValue)
                self.organizations.append(orga)
            }
        }
    }
    
    func fetchOrganizationsName(name: String) async {
        organizations.removeAll()
        let url = "http://127.0.0.1:5000/org/name/\(name)"
        AF.request(url, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            let json = try! JSON(data: data.data!)
            for org in json {
                var pubs = [Publication]()
                for pub in org.1["pubs"]{
                    let publication = Publication(title: pub.1["title"].stringValue, media: pub.1["media_url"].stringValue, likes: pub.1["likes"].intValue, descption: pub.1["description"].stringValue, _id_mongo: pub.1["_id"]["$oid"].stringValue, id_user: pub.1["user_id"].stringValue, comments: pub.1["comments"].intValue, img_org: pub.1["img_org"].stringValue, media_type: pub.1["media_type"].stringValue)
                    pubs.append(publication)
                }
                let tagsArray = org.1["org"]["tags"].arrayValue.map{$0.stringValue}
                let orga = Organization(id: org.1["org"]["_id"]["$oid"].stringValue, name: org.1["org"]["name"].stringValue, img: org.1["org"]["img_src"].stringValue, latitud: org.1["org"]["latitud"].doubleValue, longitud: org.1["org"]["longitud"].doubleValue, tags: tagsArray, mostLikedPubs: pubs, direccion: org.1["org"]["direction"].stringValue, colonia: org.1["org"]["colonia"].stringValue, municipio: org.1["org"]["municipio"].stringValue, numero: org.1["org"]["telefono"].stringValue, atention_hours: org.1["org"]["atention_hours"].stringValue, email: org.1["org"]["email"].stringValue, codigoPostal: org.1["org"]["postal_code"].stringValue, followers: org.1["org"]["followers"].intValue)
                self.organizations.append(orga)
            }
        }
    }
    func followOrg(id_usuario: String, id_org: String){
        let url = "http://127.0.0.1:5000/org/follow/\(id_org)/\(id_usuario)"
        AF.request(url, method: .patch, headers: HTTPHeaders(headers)).responseData { res in
            print(res.response)
        }
    }
}

