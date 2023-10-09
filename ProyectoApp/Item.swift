//
//  Item.swift
//  CustomTabView
//
//  Created by Alumno on 21/09/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
