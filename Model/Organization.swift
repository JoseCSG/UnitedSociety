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

    func fetchOrganizations(){
        organizations.removeAll()
        let url = "http://127.0.0.1:5000/org/"
        AF.request(url, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            let json = try! JSON(data: data.data!)
            for org in json {
                let orga = Organization(id: org.1["_id"]["$oid"].stringValue, name: org.1["name"].stringValue, img: org.1["img_src"].stringValue, latitud: org.1["latitud"].doubleValue, longitud: org.1["longitud"].doubleValue
                )
                self.organizations.append(orga)
            }
        }
    }
}

