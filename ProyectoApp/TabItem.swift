//
//  TabItem.swift
//  CustomTabView
//
//  Created by Alumno on 21/09/23.
//

import Foundation

struct TabItem {
    
    var tab: Tab
    var image: String
    var selectedImage: String
}

extension TabItem {
    static public var home = TabItem(tab: .home, image: "house", selectedImage: "house.fill")
    static public var news = TabItem(tab: .news, image: "book", selectedImage: "book.fill")
    static public var search = TabItem(tab: .search, image: "magnifyingglass.circle", selectedImage: "magnifyingglass.circle.fill")
}
