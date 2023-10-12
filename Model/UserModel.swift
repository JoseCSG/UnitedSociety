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
    
    init(id: UUID = UUID(), user_id: String, name: String, tags: [String], number: String, last_name: String) {
        self.id = id
        self.user_id = user_id
        self.name = name
        self.tags = tags
        self.number = number
        self.last_name = last_name
    }
}


