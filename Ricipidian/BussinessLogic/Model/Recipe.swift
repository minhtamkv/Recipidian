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
    dynamic var image: List<String>
    dynamic var name: String
    dynamic var step: List<String>
    dynamic var createDate: Int64
    dynamic var material: List<String>
    dynamic var foodDescription: String
    dynamic var updateDate: List<Int64>

    override class func primaryKey() -> String? {
        return Recipe.Property.id.rawValue
    }

    override init() {
        id = UUID().uuidString
        image = List<String>()
        name = ""
        step = List<String>()
        createDate = 0
        material = List<String>()
        foodDescription = ""
        updateDate = List<Int64>()
    }
}
