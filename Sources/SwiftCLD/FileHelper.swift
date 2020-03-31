//
//  File.swift
//  
//
//  Created by Eric Yang on 28/3/20.
//

import Foundation

extension StaticString {
  var cld_lastPathComponent: String {
    return (self.cld_toString as NSString).lastPathComponent
  }
  
  var cld_toString: String {
    return self.withUTF8Buffer {
        String(decoding: $0, as: UTF8.self)
    }
  }
}


struct FileHelper {
    static func read(from file: String) -> Data? {
        let path = FileHelper.findParentFolder().appendingPathComponent("Data").appendingPathComponent(file).path
        return FileManager.default.contents(atPath: path)
    }
    
    static func findParentFolder(from filePath: StaticString = #file) -> URL {
        self.findParentFolder(from: filePath.cld_toString)
    }
    
    static func findParentFolder(from filePath: String) -> URL {
        let url = URL(fileURLWithPath: filePath)
        return url.deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
    }
}
