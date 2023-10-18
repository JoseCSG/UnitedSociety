//
//  PublicationModel.swift
//  ProyectoApp
//
//  Created by Alumno on 19/09/23.
//

import Foundation
import SwiftData

@Model
final class User {
    var id = UUID()
    var user_id: String
    var name: String
    var tags: [String]
    var number: String
    var last_name: String
    var location: String
    var age: Int
    var img: String
    var rol: String
    
    init(user_id: String, name: String, tags: [String], number: String, last_name: String, location: String, age: Int, img: String, rol: String) {
        self.user_id = user_id
        self.name = name
        self.tags = tags
        self.number = number
        self.last_name = last_name
        self.location = location
        self.age = age
        self.img = img
        self.rol = rol
    }
}


