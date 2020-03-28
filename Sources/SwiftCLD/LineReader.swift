//
//  LineReader.swift
//  
//
//  Created by Eric Yang on 28/3/20.
//

import Foundation

public enum LineReaderError: Error {
    case generalError(String)
    case EOF
    case CTRLC
}

public class LineReader {
    /// A POSIX file handle for the input
    private let inputFile: Int32

    /// A POSIX file handle for the output
    private let outputFile: Int32

    /// Initializer
    public init?(inputFile: Int32 = STDIN_FILENO,
               outputFile: Int32 = STDOUT_FILENO) {
        self.inputFile = inputFile
        self.outputFile = outputFile
    }

    /// The main function of LineReader. This method shows a prompt to the user at the beginning
    /// of the line and reads the input from the user, returning it as a string. The method can
    /// throw an error if the terminal cannot be written to.
    public func readLine(prompt: String) throws -> String {
        Swift.print(prompt, terminator: "")
        if let line = Swift.readLine(strippingNewline: true) {
            return String(line)
        } else {
            throw LineReaderError.EOF
        }
    }
}
