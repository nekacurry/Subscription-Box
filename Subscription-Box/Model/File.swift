//
//  File.swift
//  Subscription-Box
//
//  Created by Anneka Curry on 4/27/22.
//

import Foundation

//MARK: The Main Settings
struct Item {
    let name: String
    let image: String
}

struct Box {
    let date: String
    let items: [Item]
//    let image: String
}

struct Category {
    let name: String
    let image: String
}

