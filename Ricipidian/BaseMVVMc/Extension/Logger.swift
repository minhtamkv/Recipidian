//
//  Logger.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import Foundation

public func printLogMessageWithTag(_ message: Any?, classTag: AnyClass) {
    #if DEBUG
        print("LOG_DEBUG \(NSStringFromClass(classTag)): \(message ?? "")")
    #endif
}

func printLogMessage(_ message: Any?) {
    #if DEBUG
        print("LOG_MESSAGE_COMMON: \(message ?? "nil")")
    #endif
}

func printLogMessageRequest(_ message: Any?) {
    #if DEBUG
        print("LOG_MESSAGE_REQUEST: \(message ?? "nil")")
    #endif
}

func printLogMessageResponse(_ message: Any?) {
    #if DEBUG
        print("LOG_MESSAGE_RESPONSE: \(message ?? "nil")")
    #endif
}

func printLogMessageError(_ message: Any?) {
    #if DEBUG
        print("LOG_MESSAGE_ERROR: \(message ?? "nil")")
    #endif
}

func printLogTime(message: Any?, isTimeStart: Bool = true) {
    #if DEBUG
        if isTimeStart {
            // print("LOG_TIME: _START = \(Date().toString(format: .dateServer)) - \(message ?? "NO MESSAGE")")
        } else {
            // print("LOG_TIME: _END = \(Date().toString(format: .dateServer)) - \(message ?? "NO MESSAGE")")
        }
    #endif
}
