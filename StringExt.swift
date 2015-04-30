//
// StringExt.swift
//
// Created by Koua Lo on 4/30/15.
// Copyright (c) 2015 Koua Lo.  All rights reserved.
//
// License: None, do as you please.
//

import Foundation

extension String {
    
    // ====== Subscripts =======
    subscript(start: Int, end: Int) -> String {
        return self.substr(start: start, end: end)
    }
    
    subscript (var i: Int) -> Character {
        if i < 0 {
            return self.reverse[-(i + 1)]
        }
        
        assert( i < self.length, "Index is out of range")
        
        return self[advance(self.startIndex, i)]
    }
    
    subscript (str: String) -> Int {
        
        let possibleIndex = self.rangeOfString(str)?.startIndex
        
        assert(possibleIndex != nil, "Substring not found")
        
        return "\(self.rangeOfString(str)!.startIndex)".toInt()!
    }
    
    subscript (str_start: String, str_end: String) -> String {
        return self.substringWithRange(Range<String.Index>(start: self.rangeOfString(str_start)!.endIndex, end: self.rangeOfString(str_end)!.startIndex))
    }
    
    // ====== Functions ======
    
    // Replace string
    public func replace(#target: String, with: String) -> String {
        return self.stringByReplacingOccurrencesOfString(target, withString: with, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    
    // Check if a string exists
    public func exists(searchString: String) -> Bool {
        if self.rangeOfString(searchString) != nil{
            return true
        } else {
            return false
        }
    }
    
    // Get substring starting from
    public func substrfrom(start: Int) -> String {
        return self.substr(start: start, end: self.length)
    }
    
    // Get substring up to
    public func substrto(end: Int) -> String {
        return self.substr(start: 0, end: end)
    }
    
    // Get substring starting with position "start" and end with position "end"
    public func substr(var #start: Int, var end: Int) -> String {
        var flipped = false
        
        if start > end {
            swap(&start, &end)
            flipped = true
        }
        
        let substring = (self as NSString).substringWithRange(NSMakeRange(start, end - start))
        
        if flipped {
            return substring.reverse
        }
        
        return substring
    }
    
    // Get substring between two sets of strings
    public func substr(#start: String, end: String) -> String {
        return self[start, end]
    }
    
    // Break string apart with separator
    public func split(separator: String) -> [String] {
        return self.componentsSeparatedByString(separator)
    }
    
    // Pad a string with character/string (left, right, or both sides)
    public func padding(#direction: String, repetition: Int, with: String) -> String? {
        var str = self
        for (var i = 0; i <= repetition; i++) {
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
        return target == self.left(target.length)
    }

    // Check to see if a string ends with "target"
    public func endswith(target: String) -> Bool {
        return target == self.right(target.length)
    }

    // See how many times a char/string exists
    public func occurences(sub: String) -> Int {
        var result: Int = 0
        var s = self
        let index: String.Index = "a".endIndex
        while s != "" {
            if s.hasPrefix(sub) {
                result += 1
                s = s.substringFromIndex(sub.endIndex)
            } else {
                s = s.substringFromIndex(index)
            }
            
        }
        return result
    }

    // ======= Vars ======
    
    // Get string length
    var length: Int {
        return count(self)
    }

    // Trim white spaces from beginning and end of string
    var trim: String {
        let str = NSCharacterSet.whitespaceCharacterSet()
        return self.stringByTrimmingCharactersInSet(str)
    }

    // Same as trim, but also includes new line chars
    var strip: String {
        let str = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        return self.stringByTrimmingCharactersInSet(str)
    }
    
    // Escape HTML string
    var htmlescape: String? {
        return self.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
    }
    
    // Unescape HTML string
    var htmlunescape: String? {
        return self.stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
    }

    // Convert to lowercase using locale string
    var lowercaselocale: String {
        return self.lowercaseStringWithLocale(NSLocale.currentLocale())
    }
    
    // Convert to uppercase using locale string
    var uppercaselocale: String {
        return self.uppercaseStringWithLocale(NSLocale.currentLocale())
    }
    
    // Convert to lowercase
    var lowercase: String {
        return self.lowercaseString
    }
    
    // Convert to uppercase
    var uppercase: String {
        return self.uppercaseString
    }
    
    // Swap case of string
    var swapcase:String {
        var result: String = ""
        for ch in self {
            let s = String(ch)
            result += s.uppercaseString == s ? s.lowercaseString : s.uppercaseString
        }
        return result
    }
    
    // Check if string is uppercase
    var isuppercase:Bool {
        return self.uppercaseString == self
    }
    
    // Check if string is lowercase
    var islowercase:Bool {
        return self.lowercaseString == self
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
        for character in self {
            reverseStr = "\(character)\(reverseStr)"
        }
        return reverseStr
    }
    
    mutating func reverseSelf() {
        self = self.reverse
    }

}