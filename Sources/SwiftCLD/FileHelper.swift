//
//  File.swift
//  
//
//  Created by Eric Yang on 28/3/20.
//

import Foundation

struct FileHelper {
    static func read(from file: String) -> Data? {
        return FileManager.default.contents(atPath: file)
    }
}
