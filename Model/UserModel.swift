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
    var _id_mongo: String
    var title: String
    var img: String
    var likes: Int
    var descption: String
    init(title: String, img: String, likes: Int, descption: String, _id_mongo:String) {
        self.title = title
        self.img = img
        self.likes = likes
        self.descption = descption
        self._id_mongo = _id_mongo
    }
}



