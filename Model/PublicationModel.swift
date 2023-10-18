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
    var id = UUID()
    var _id_mongo: String
    var title: String
    var media: String
    var media_type: String
    var likes: Int
    var descption: String
    var id_user: String
    var comments: Int
    var img_org: String
    var liked: Bool
    
    init(title: String, media: String, likes: Int, descption: String, _id_mongo:String, id_user: String, comments: Int, img_org: String, media_type: String, liked: Bool) {
        self.title = title
        self.media = media
        self.likes = likes
        self.descption = descption
        self._id_mongo = _id_mongo
        self.id_user = id_user
        self.comments = comments
        self.img_org = img_org
        self.media_type = media_type
        self.liked = liked
    }
}
extension Publication {
    static var dummy = Publication(title: "Es un título dummy", media: "CanonSumidero", likes: 20, descption: "Esta es la descripción del dummy, esta puede ser muy muy larga", _id_mongo: "23423", id_user: "234232", comments: 12, img_org: "efherjebe", media_type: "png", liked: true)
}


