//
//  UIColorHexConverter.swift
//  GameTeller
//
//  Created by Karrmarr


import UIKit
import Foundation

extension UIColor {
    
    convenience init(hex: String) {
        let rgbValue = UnsafeMutablePointer<UInt32>.alloc(1)
        
        let scanner = NSScanner(string: hex)
        if hex[0] == "#" {
            scanner.scanLocation = 1
        }
        scanner.scanHexInt(rgbValue)
        
        let cval = rgbValue.memory
        rgbValue.destroy()
        
        self.init(red: CGFloat(((cval & 0xFF0000) >> 16)) / 255.0,
            green: CGFloat(((cval & 0xFF00) >> 8)) / 255.0,
            blue: CGFloat(cval & 0xFF) / 255.0, alpha: 1.0)
    }
    
}

extension String {
    
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
    
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: startIndex.advancedBy(r.startIndex), end: startIndex.advancedBy(r.endIndex)))
    }
}