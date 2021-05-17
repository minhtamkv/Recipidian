//
//  Int.swift
//  Ricipidian
//
//  Created by Minh Tâm on 06/05/2021.
//

import Foundation

extension Int {
    var miniSecondstoDateFull: Date {
        return Date(timeIntervalSince1970: Double(self))
    }
}
