//
//  PublicationStructSmall.swift
//  ProyectoApp
//
//  Created by Alumno on 16/10/23.
//

import Foundation
struct OrganizationSmall : Identifiable {
    var id: String
    var name: String
    var img: String
    
    init(id: String, name: String, img: String){
        self.id = id
        self.name = name
        self.img = img
    }
}
