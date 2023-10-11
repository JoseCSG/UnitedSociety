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
}
extension Organization {
    static var dummy = Organization(id: "erw", name: "Una org", img: "https://firebasestorage.googleapis.com:443/v0/b/united-society-fad81.appspot.com/o/publications%2FB7135DC2-0558-43EB-B98A-534F33173F9D?alt=media&token=820e30bc-0192-42c6-a3db-01febf5c6e68", latitud: 324.12, longitud: 21.214)
}
