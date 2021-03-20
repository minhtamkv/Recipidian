//
//  BaseRequest.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import Foundation

protocol BaseRequest: Codable {

}

extension BaseRequest {
    var jsonData: Data? {

        return try? JSONEncoder().encode(self)
    }

    var json: String? {
        guard let data = self.jsonData else {
            printLogMessageRequest("Convert json loi")
            return nil
        }

        let jsonString = String(data: data, encoding: .utf8)
        printLogMessageRequest(jsonString)

        return jsonString
    }

    var params: [String: Any]? {
        guard let params = try? JSONSerialization.jsonObject(with: jsonData ?? Data(), options: []) as? [String: Any] else { return [:] }
       
        return params
    }
}
