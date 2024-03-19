//
//  APILogger.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

enum LogLevel: String {
    case info = "[INFO]"
    case warning = "[WARNING]"
    case error = "[ERROR]"
}

class APILogger {
    static let shared = APILogger()

    private init() {}

    func log(message: String, level: LogLevel = .info, file: String = #file, function: String = #function, line: Int = #line) {
        let filename = (file as NSString).lastPathComponent
        let logMessage = "\(Date()) \(level.rawValue) \(filename):\(line) \(function) -> \(message)"
        print(logMessage)
    }
}

// Global log function
func log(_ message: String, level: LogLevel = .info, file: String = #file, function: String = #function, line: Int = #line) {
    APILogger.shared.log(message: message, level: level, file: file, function: function, line: line)
}

