//
//  BaseResponse.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import Foundation

protocol BaseResponse: Codable {
    var mess: MessageResponse? { get }
}

struct MessageResponse: Codable {
    let code: Int?
    let description: String?
}

struct CommonResponse : BaseResponse {
    var mess: MessageResponse?
}

// MARK: - Welcome
struct ValidateOTPResponse: Codable {
    let mess: Mess?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let valid: Bool?
}

// MARK: - Mess
struct Mess: Codable {
    let code: Int?
    let message: String?
}
