//
//  CommentModel.swift
//  ProyectoApp
//
//  Created by Alumno on 09/10/23.
//

import Foundation
struct Comment : Identifiable {
    var id: String
    var comment: String
    var likes: Int
    var name: String
    var img: String
}
