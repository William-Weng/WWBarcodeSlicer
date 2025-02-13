//
//  Extension.swift
//  WWBarcodeSlicer
//
//  Created by William.Weng on 2025/2/13.
//

import UIKit

// MARK: - String (subscript function)
extension String {
        
    /// [字符串下標](https://www.jianshu.com/p/1cd0e691ab7a)
    /// "subscript"[2..<5] => "bsc"
    subscript (bounds: CountableRange<Int>) -> String {
        
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        
        return String(self[start..<end])
    }
}
