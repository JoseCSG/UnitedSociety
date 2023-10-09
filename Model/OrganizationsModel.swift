//
//  OrganizationsModel.swift
//  ProyectoApp
//
//  Created by Josue Sosa on 19/09/23.
//

import Foundation
struct Organization : Identifiable {
    var id: Int
    var title: String
    var img: String
    
}
extension Organization {
    static var dummy = Organization(id: 1, title: "Es un título dummy", img: "CanonSumidero")
}
