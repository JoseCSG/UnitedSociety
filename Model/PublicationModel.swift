//
//  PublicationModel.swift
//  ProyectoApp
//
//  Created by Alumno on 19/09/23.
//

import Foundation
import SwiftData

@Model
final class Publication {
    var id: String
    var title: String
    var img: String
    var likes: Int
    var descption: String
    init(title: String, img: String, likes: Int, descption: String, id:String) {
        self.title = title
        self.img = img
        self.likes = likes
        self.descption = descption
        self.id = id
    }
}
extension Publication {
    static var dummy = Publication(title: "Es un título dummy", img: "CanonSumidero", likes: 20, descption: "Esta es la descripción del dummy, esta puede ser muy muy larga", id: "23423")
}


