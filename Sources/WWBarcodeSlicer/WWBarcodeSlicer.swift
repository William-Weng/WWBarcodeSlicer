//
//  WWBarcodeSlicer.swift
//  WWBarcodeSlicer
//
//  Created by William.Weng on 2025/2/13.
//

// MARK: - Barcode文字分割器
open class WWBarcodeSlicer {
    public static let shared = WWBarcodeSlicer()
}

// MARK: - 公開函式
public extension WWBarcodeSlicer {
    
    /// [解析Barcode => [String]](https://www.einvoice.nat.gov.tw/static/ptl/ein_upload/attachments/1479449792874_0.6(20161115).pdf)
    /// - Parameters:
    ///   - barcode: Barcode文字
    ///   - counts: Barcode每段的數量
    /// - Returns: Result<[String], Error>
    func parse(_ barcode: String, counts: [Int]) -> Result<[String], Error> {
        
        let total = counts.reduce(0) { sum, count in return sum + count }

        var index = 0
        var codes: [String] = []
        
        if (total != barcode.count) { return .failure(BarcodeError.count) }
        
        counts.forEach { count in
            
            let lowerBound = index
            let upperBound = index + count
            let code = barcode[lowerBound..<upperBound]
            
            index += count
            codes.append(code)
        }
        
        return .success(codes)
    }
    
    /// 解析Barcode => [String: String]
    /// - Parameters:
    ///   - barcode: Barcode文字
    ///   - infos: Barcode每段的設定值
    /// - Returns: Result<[String: String], Error>
    func parse(_ barcode: String, infos: [BarcodeInfo]) -> Result<[String: String], Error> {
        
        let total = infos.reduce(0) { sum, info in return sum + info.count }
        
        var index = 0
        var codes: [String: String] = [:]
        
        if (total != barcode.count) { return .failure(BarcodeError.count) }
        
        infos.forEach { info in
            
            let lowerBound = index
            let upperBound = index + info.count
            let code = barcode[lowerBound..<upperBound]
            
            index += info.count
            codes[info.key] = code
        }
        
        return .success(codes)
    }
}
