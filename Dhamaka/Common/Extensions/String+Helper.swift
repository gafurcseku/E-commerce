//
//  String+Helper.swift
//  Buddy_iOS
//
//  Created by S.M.Moinuddin on 11/14/17.
//  Copyright © 2017 S.M.Moinuddin. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    func isEqualToString(find: String) -> Bool {
        return String(format: self) == find
    }
    
    func setStrikeThrough(strike:String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.init(named: "Regular_font_color") as Any, range: NSMakeRange(0, strike.count))
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSNumber(value: NSUnderlineStyle.single.rawValue), range: NSMakeRange(0, strike.count))
        attributedString.addAttribute(NSAttributedString.Key.strikethroughColor, value: UIColor.init(named: "Regular_font_color") as Any, range: NSMakeRange(0, strike.count))
        return attributedString
    }
    
    func toLengthOf(length:Int) -> String {
        if length <= 0 {
            return self
        } else if let to = self.index(self.startIndex, offsetBy: length, limitedBy: self.endIndex) {
            return String(self[to...])
            
        } else {
            return ""
        }
    }
    
    func trim()->String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    /**
     Returns subtring to x length starting from 1
     - Parameter to: length to n (Starting from 1)
     */
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[toIndex...]) //substring(to: toIndex)
    }
    
    var isInt: Bool {
        return Int(self) != nil
    }
    
    var containsNonWhitespace: Bool {
        return !self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func chopPrefix(_ count: Int = 1) -> String {
        return count>self.count ? self : String(self[index(self.startIndex, offsetBy: count)...])
    }

    func dateTimeSubstruct(needle: String, beforeNeedle: Bool = false) -> String? {
        guard let range = self.range(of: needle) else { return nil }
        
        if beforeNeedle {
            return String(self[..<range.lowerBound].trimmingCharacters(in: .whitespaces))
        }
        return  String(self[range.upperBound...].trimmingCharacters(in: .whitespaces))
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}


extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}


extension NSLocale {
    
    
    class func locales() -> [String] {
        var locales = [String]()
        
        for localeCode in NSLocale.isoCountryCodes {
            let countryName = (NSLocale.autoupdatingCurrent).localizedString(forRegionCode: localeCode )
            locales.append(countryName!)
        }
        
        return locales
    }
    
}
