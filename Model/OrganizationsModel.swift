//
//  OrganizationsModel.swift
//  ProyectoApp
//
//  Created by Josue Sosa on 19/09/23.
//

import Foundation
struct Organization : Identifiable {
    var id: String
    var name: String
    var img: String
    var latitud: Double
    var longitud: Double
    var tags: [String]
    var mostLikedPubs: [Publication]
    var direccion: String
    var colonia: String
    var municipio: String
    var numero: String
    var atention_hours: String?
    var email: String
    var codigoPostal: String
    var followers: Int
}
extension Organization {
    static var dummy = Organization(id: "erw", name: "Una org", img: "https://firebasestorage.googleapis.com:443/v0/b/united-society-fad81.appspot.com/o/publications%2FB7135DC2-0558-43EB-B98A-534F33173F9D?alt=media&token=820e30bc-0192-42c6-a3db-01febf5c6e68", latitud: 324.12, longitud: 21.214, tags: ["Una tag"], mostLikedPubs: [Publication(title: "algo", media: "iawji", likes: 2, descption: "awekw", _id_mongo: "akwefnkjew", id_user: "kwnkjwe", comments: 2, img_org: "akjwefk", media_type: "kjaenke")], direccion: "Alguna", colonia: "Alguna", municipio: "Monterrey", numero: "923928592", atention_hours: "algo", email: "algp@gmail.com", codigoPostal: "94833", followers: 12)
}
