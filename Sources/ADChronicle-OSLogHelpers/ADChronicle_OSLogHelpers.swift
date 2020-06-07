import Foundation
import ADChronicle
import os

@available(iOS 12.0, *)
@available(OSX 10.14, *)
public extension ADChronicle {
    static func string(from json: [String: Any]) -> String {
        guard JSONSerialization.isValidJSONObject(json),
            let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
            let jsonString = String(data: jsonData, encoding: .utf8)
            else { return String(describing: json) }
        
        return jsonString
    }
    
    static func string(from userInfo: CustomDebugStringConvertible?) -> String {
        if let json = userInfo as? [String: Any] {
            return string(from: json)
        }
        return String(describing: userInfo)
    }
}

// MARK: Loggers
@available(iOS 12.0, *)
@available(OSX 10.14, *)
public extension ADChronicle {
    static func filename(from file: StaticString) -> String {
        return URL(fileURLWithPath: file.description).deletingPathExtension().lastPathComponent
    }
    
    static func logger(for file: StaticString) -> OSLog {
        return logger(subsystem: Bundle.main.bundleIdentifier!, file: file)
    }
    
    static func logger(subsystem: String, file: StaticString) -> OSLog {
        return OSLog(subsystem: subsystem, category: filename(from: file))
    }
}
