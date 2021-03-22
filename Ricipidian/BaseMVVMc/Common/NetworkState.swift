//
//  NetworkState.swift
//  Ricipidian
//
//  Created by Minh Tâm on 22/03/2021.
//

import Foundation
import Alamofire

class NetworkState {
    class func isConnected() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
