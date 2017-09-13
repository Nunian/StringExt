//
// StringExt.swift
//
// Created by Koua Lo on 4/30/15.
// Last Updated on 10/06/16.
// License: None, do as you please.
//

import Foundation

extension String {
    
    // ====== Subscripts =======
    subscript(start: Int, end: Int) -> String {
        return self.substr(start: start, end: end)
    }
    
    subscript(i: Int) -> Character {
        if i < 0 {
            return self.reverse[-(i + 1)]
        }
        assert(i < self.length, "Index is out of range")
        return self[self.index(self.startIndex, offsetBy: i)]
    }
    
    subscript(str: String) -> Int {
        let possibleIndex = self.range(of: str)?.lowerBound
        assert(possibleIndex != nil, "Substring not found")
        return Int("\(self.range(of: str)!.lowerBound)")!
    }
    
    subscript(start: String, end: String) -> String {
        return self.substring(with: self.range(of: start)!.upperBound ..< self.range(of: end)!.lowerBound)
    }
    
    // ====== Functions ======
    
    // Replace string
    public func replace(target: String, with: String) -> String {
        return self.replacingOccurrences(of: target, with: with, options: .literal, range: nil)
    }
    
    // Check if a string exists
    public func exists(string: String) -> Bool {
        if self.range(of: string) != nil{
            return true
        } else {
            return false
        }
    }
    
    // Get substring starting from
    public func substrfrom(start: Int) -> String {
        let index = self.index(self.startIndex, offsetBy: start)
        return self.substring(from: index)
    }
    
    // Get substring up to
    public func substrto(end: Int) -> String {
        let index = self.index(self.startIndex, offsetBy: end)
        return self.substring(to: index)
    }
    
    // Get substring starting with position "start" and end with position "end"
    public func substr(start: Int, end: Int) -> String {
        let sidx = self.index(self.startIndex, offsetBy: start)
        var eidx = self.index(self.endIndex, offsetBy: 0)
        if start > end {
            let n = start + end
            if n <= self.length {
                eidx = self.index(self.endIndex, offsetBy: n - self.length)
            } else {
                eidx = self.index(self.endIndex, offsetBy: 0)
            }
            let range = sidx..<eidx
            return self.substring(with: range)
        } else {
            if end <= self.length {
                eidx = self.index(self.endIndex, offsetBy: end - self.length)
            } else {
                eidx = self.index(self.endIndex, offsetBy: 0)
             }
            let range = sidx..<eidx
            return self.substring(with: range)
        }
    }
    
    // Get substring between two sets of strings
    public func substr(start: String, end: String) -> String {
        return self[start, end]
    }
    
    // Break string apart with separator
    public func split(separator: String) -> [String] {
        return self.components(separatedBy: separator)
    }
    
    // Pad a string with character/string (left, right, or both sides)
    public func padding(direction: String, repetition: Int, with: String) -> String? {
        var str = self
        for _ in 0...repetition {
            if (direction == "left") {
                str = with + str
            } else if (direction == "right") {
                str += with
            } else if (direction == "both") {
                str = with + str + with
            } else {
                return nil
            }
        }
        return str
    }
    
    // Get substring starting at 0 to index (same as "substrTo()")
    public func left(toIndex: Int) -> String {
        return self[0, toIndex]
    }
    
    // Get right side of string starting with index counting from right
    public func right(fromIndex: Int) -> String {
        let strlen = self.length
        return self[strlen - fromIndex, strlen]
    }
    
    // Check to see if a string starts with "target"
    public func startswith(target: String) -> Bool {
        return target == self.left(toIndex: target.length)
    }
    
    // Check to see if a string ends with "target"
    public func endswith(target: String) -> Bool {
        return target == self.right(fromIndex: target.length)
    }
    
    // See how many times a char/string exists
    public func occurences(sub: String) -> Int {
        var result: Int = 0
        var s = self
        let index: String.Index = "a".endIndex
        while s != "" {
            if s.hasPrefix(sub) {
                result += 1
                s = s.substring(from: sub.endIndex)
            } else {
                s = s.substring(from: index)
            }
        }
        return result
    }
    
    // ======= Vars ======
    
    // Get string length
    var length: Int {
        return self.characters.count
    }
    
    // Trim white spaces from beginning and end of string
    var trim: String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    // Same as trim, but also includes new line chars
    var strip: String {
        let str = NSCharacterSet.whitespacesAndNewlines
        return self.trimmingCharacters(in: str)
    }
    
    // Escape HTML string
    var htmlescape: String? {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
    }
    
    // Unescape HTML string
    var htmlunescape: String? {
        return self.removingPercentEncoding
    }
    
    // Convert to lowercase using locale string
    var lowercaselocale: String {
        return self.lowercased(with: Locale(identifier: NSLocale.current.languageCode!))
    }
    
    // Convert to uppercase using locale string
    var uppercaselocale: String {
        return self.uppercased(with: Locale(identifier: NSLocale.current.languageCode!))
    }
    
    // Convert to lowercase
    var lowercase: String {
        return self.lowercased()
    }
    
    // Convert to uppercase
    var uppercase: String {
        return self.uppercased()
    }
    
    // Swap case of string
    var swapcase: String {
        var result: String = ""
        for ch in self.characters {
            let s = String(ch)
            result += s.uppercased() == s ? s.lowercased() : s.uppercased()
        }
        return result
    }
    
    // Check if string is uppercase
    var isuppercase:Bool {
        return self.uppercased() == self
    }
    
    // Check if string is lowercase
    var islowercase:Bool {
        return self.lowercased() == self
    }
    
    // Return float value
    var tofloat:Float {
        return (self as NSString).floatValue
    }
    
    // Return double value
    var todouble:Double {
        return (self as NSString).doubleValue
    }
    
    // Check to see if a string is empty/blank. Note that the
    // built-in "isEmpty" will return false as long as there is
    // a white space. The code below strips all white spaces
    // including new line characters before determining if the
    // string is empty
    var isblank: Bool {
        return self.strip == ""
    }
    
    // Reverse the string
    var reverse: String {
        var reverseStr = ""
        for character in self.characters {
            reverseStr = "\(character)\(reverseStr)"
        }
        return reverseStr
    }
    
    mutating func reverseSelf() {
        self = self.reverse
    }
    
}
