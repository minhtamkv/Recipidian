//
//  User.swift
//  Ricipidian
//
//  Created by Minh Tâm on 27/03/2021.
//

import Foundation
import RealmSwift

@objcMembers class User: Object {
    enum Property: String {
        case id, recipe, group
    }

    dynamic var id: String
    dynamic var recipe: [Recipe]

    override class func primaryKey() -> String? {
        return User.Property.id.rawValue
    }

    override init() {
        id = UUID().uuidString
        recipe = []
    }
}
