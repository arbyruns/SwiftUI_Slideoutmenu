//
//  File.swift
//  
//
//  Created by robevans on 2/12/22.
//

import Foundation

struct MenuItem: Identifiable {
    var id: Int
    var text: String
    var image: String
    var color: String
}

let MenuItems = [
    MenuItem(id: 0, text: "Help", image: "questionmark.circle.fill", color: "nord10"),
    MenuItem(id: 1, text: "Contact", image: "mail", color: "nord11"),
    MenuItem(id: 2, text: "Settings", image: "gearshape.fill", color: "nord12")
]
