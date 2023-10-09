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
    let headers = [ "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2OTY4ODAzNTEsImV4cCI6MTY5Njk2Njc1MSwidXNlcm5hbWUiOiJqY3NnIiwiZW1haWwiOiJlbWFpbCJ9.9JR8MuzrUysY4iZ0o91IbcMo_1tG9w73AX1ZDb72cF8", "Accept": "application/json", "Content-Type": "application/json" ]

    func fetchOrganizations(){
        organizations.removeAll()
        let url = "http://127.0.0.1:5000/org/"
        AF.request(url, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            let json = try! JSON(data: data.data!)
            for org in json {
                print(org.1["name"].stringValue)
                let org = Organization(id: org.1["_id"].intValue,
                                       title: org.1["name"].stringValue, img: org.1["img_url"].stringValue)
                self.organizations.append(org)
            }
        }
    }
    
}

