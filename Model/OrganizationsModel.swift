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
    var followed: Bool
}
extension Organization {
    static var dummy = Organization(id: "6526168d28bffa9c5c02bf2e", name: "Paz es", img: "https://firebasestorage.googleapis.com:443/v0/b/united-society-fad81.appspot.com/o/publications%2F29A7B0ED-CAAE-48B8-9682-FEB6D737F1A8?alt=media&token=2708ca08-af8f-40e9-8f12-ec650ece41c5", latitud: 324.12, longitud: 21.214, tags: ["Cancer", "Ayuda"], mostLikedPubs: [Publication(title: "algo", media: "iawji", likes: 2, descption: "awekw", _id_mongo: "akwefnkjew", id_user: "kwnkjwe", comments: 2, img_org: "akjwefk", media_type: "kjaenke", liked: true)], direccion: "Alguna", colonia: "Alguna", municipio: "Monterrey", numero: "923928592", atention_hours: "algo", email: "algp@gmail.com", codigoPostal: "94833", followers: 24, followed: true)
}
