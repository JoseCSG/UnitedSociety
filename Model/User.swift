//
//  User.swift
//  ProyectoApp
//
//  Created by Alumno on 16/10/23.
//

import Foundation
import SwiftyJSON
import Alamofire

@Observable
class UserModel{
    var orgsFollowed = [OrganizationSmall]()
    init (){}
    
    let headers = [ "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2OTY5NzMyNTYsImV4cCI6MTY5NzgzNzI1NiwidXNlcm5hbWUiOiJqY3NnIiwiZW1haWwiOiJlbWFpbCJ9.z9yU_sAdwzEkkg1XQfYrkUCAhYkDbbuEHoWlJZgdcAA", "Accept": "application/json", "Content-Type": "application/json" ]
    
    func fetchOrgsFollowed(id_user: String){
        orgsFollowed.removeAll()
        let url = "http://127.0.0.1:5000/user/following/\(id_user)"
        AF.request(url, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            let json = try! JSON(data: data.data!)
            for org in json {
                print(org)
                let orgSmall = OrganizationSmall(id: org.1["id"].stringValue, name: org.1["name"].stringValue, img: org.1["img_src"].stringValue)
                self.orgsFollowed.append(orgSmall)
            }
        }
    }
    
    func unfollowOrg(id_user: String, id_org: String){
        let url = "http://127.0.0.1:5000/user/unfollow/\(id_org)/\(id_user)"
        AF.request(url, method: .patch, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData{ data in
            print(data.description)
        }
    }
    
    func followOrg(id_user: String, id_org: String){
        let url = "http://127.0.0.1:5000/user/follow/\(id_org)/\(id_user)"
        AF.request(url, method: .patch, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData{ data in
            print(data.description)
        }
    }

}
