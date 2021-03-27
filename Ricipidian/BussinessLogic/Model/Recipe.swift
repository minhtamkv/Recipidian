//
//  Recipe.swift
//  Ricipidian
//
//  Created by Minh Tâm on 27/03/2021.
//

import Foundation
import RealmSwift

@objcMembers class Recipe: Object {
    enum Property: String {
        case id, image, name, step, createDate, material, foodDescription
    }

    dynamic var id: String
    dynamic var image: [String]
    dynamic var name: String
    dynamic var step: [String]
    dynamic var createDate: Int64
    dynamic var material: [String]
    dynamic var foodDescription: String
    dynamic var updateDate: [Int64]

    override class func primaryKey() -> String? {
        return Recipe.Property.id.rawValue
    }

    override init() {
        id = UUID().uuidString
        image = []
        name = ""
        step = []
        createDate = 0
        material = []
        foodDescription = ""
        updateDate = []
    }
}
