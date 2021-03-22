//
//  BaseService.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import RxSwift
import UIKit

class BaseCommonAPI {
    static var urlCommon = "http://10.60.155.31:8576"
}

class BaseService: BaseServiceRxManager {
    convenience init(url: String = BaseCommonAPI.urlCommon, contentType: String = Header.ApplicationJson, hasToken: Bool = true) {
        self.init(baseURL: url)

        if hasToken {
            let token = UserDefaultHelper.sharedInstance.getValueStringByKey(key: KeyUserDefaults.keyAccessToken)
            updateHeaderIfNeed(key: Header.Authorization, value: "Bearer " + token)
        }
        updateHeaderIfNeed(key: Header.ContentType, value: contentType)
    }

    func requestPOST<T>(type: T.Type,
                        params: [String: Any],
                        pathURL: String, useFullPathURL: Bool = false) -> Observable<T>
        where T: Decodable {
        return super.request(type: type, method: .post, parameters: params, pathURL: pathURL, useFullPathURL: useFullPathURL)
    }

    func requestGET<T>(type: T.Type,
                       params: [String: Any],
                       pathURL: String, useFullPathURL: Bool = false) -> Observable<T>
        where T: Decodable {
        return super.request(type: type, method: .get, parameters: params, pathURL: pathURL, useFullPathURL: useFullPathURL)
    }

    func requestDELETE<T>(type: T.Type,
                          params: [String: Any],
                          pathURL: String, useFullPathURL: Bool = false) -> Observable<T>
        where T: Decodable {
        return super.request(type: type, method: .delete, parameters: params, pathURL: pathURL, useFullPathURL: useFullPathURL)
    }

    func requestPUT<T>(type: T.Type,
                       params: [String: Any],
                       pathURL: String, useFullPathURL: Bool = false) -> Observable<T>
        where T: Decodable {
        return super.request(type: type, method: .put, parameters: params, pathURL: pathURL, useFullPathURL: useFullPathURL)
    }

    func getFullURL(baseURL: String, pathURL: String) -> String {
        return baseURL + pathURL
    }
}
