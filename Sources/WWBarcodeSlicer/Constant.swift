//
//  Constant.swift
//  WWBarcodeSlicer
//
//  Created by William.Weng on 2025/2/13.
//

import UIKit

// MARK: - 常數
public extension WWBarcodeSlicer {
    
    public typealias BarcodeInfo = (key: String, count: Int)
        
    /// 自定義錯誤
    public enum BarcodeError: Error {
        
        case count  // barcode的長度跟參數對不上…
        
        /// 錯誤訊息
        /// - Returns: String
        func message() -> String {
            
            switch self {
            case .count: return "The barcode count does not match."
            }
        }
    }
}
