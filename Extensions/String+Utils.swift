//
//  String+Utils.swift
//
//  Created by Chris Comeau on 2018-09-05.
//  Copyright © 2018 Skyriser Media. All rights reserved.
//

import Foundation
import UIKit

public extension NSString
{

}

public extension String
{
    //https://stackoverflow.com/questions/32021712/how-to-split-a-string-by-new-lines-in-swift
//    var lines: [String] {
//        return split { String($0).rangeOfCharacter(from: .newlines) != nil }.map(String.init)
//    }
//    var lines: [String] {
//        return split { CharacterSet.newlines.contains($0.unicodeScalars.first!) }.map(String.init)
//    }

    var lines: [String] {
        var result: [String] = []
        enumerateLines { line, _ in result.append(line) }
        return result
    }


    //https://www.hackingwithswift.com/articles/141/8-useful-swift-extensions

    var wordCount: Int {
        let regex = try? NSRegularExpression(pattern: "\\w+")
        return regex?.numberOfMatches(in: self as String, range: NSRange(location: 0, length: self.utf16.count)) ?? 0
    }

    func replacingOccurrences(of search: String, with replacement: String, count maxReplacements: Int) -> String {
        var count = 0
        var returnValue = self

        while let range = returnValue.range(of: search) {
            returnValue = returnValue.replacingCharacters(in: range, with: replacement)
            count += 1

            // exit as soon as we've made all replacements
            if count == maxReplacements {
                return returnValue
            }
        }

        return returnValue
    }

    func truncate(to length: Int, addEllipsis: Bool = false) -> String  {
        if length > count { return self }

        let endPosition = self.index(self.startIndex, offsetBy: length)
        let trimmed = self[..<endPosition]

        if addEllipsis {
            return "\(trimmed)..."
        } else {
            return String(trimmed)
        }
    }

		static func randomString(length: Int) -> String {

			let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
			let len = UInt32(letters.length)

			var randomString = ""

			for _ in 0 ..< length {
				let rand = arc4random_uniform(len)
				var nextChar = letters.character(at: Int(rand))
				randomString += NSString(characters: &nextChar, length: 1) as String
			}

			return randomString
		}

		//https://stackoverflow.com/questions/31250074/split-attributed-string-and-retain-formatting
		static func splitAttributedString(inputString: NSAttributedString, seperateBy: String) -> [NSAttributedString] {
			let input = inputString.string
			let separatedInput = input.components(separatedBy: seperateBy)
			var output = [NSAttributedString]()
			var start = 0
			for sub in separatedInput {
				let range = NSMakeRange(start, sub.count)
				let attribStr = inputString.attributedSubstring(from: range)
				output.append(attribStr)
				start += range.length + seperateBy.count
			}
			return output
		}

}
