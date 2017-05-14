//
//  utilities.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 4/25/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import UIKit

class Utilities {
    func addBottomBorder(textField: UITextField) {
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    
    
    // I adopted this code from 
    // http://stackoverflow.com/questions/27880650/swift-extract-regex-matches
    // Feel free to look there if there are any questions
    func matches(for regex: String, in text: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let nsString = text as NSString
            let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
            return results.map { nsString.substring(with: $0.range)}
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    // Uses the above match function to capture a
    // date String in the format of "yyyy-MM-dd"
    func captureDate(dateString: String) -> String {
        let regex  = "\\d\\d\\d\\d-\\d\\d-\\d\\d"
        let ms = matches(for: regex, in: dateString)
        return ms[0]
    }
}

