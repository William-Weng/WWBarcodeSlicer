//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2025/2/13.
//

import UIKit
import WWPrint
import WWBarcodeSlicer

// MARK: - ViewController
final class ViewController: UIViewController {

    let barcode = "QQ000815241000801396600000014000000141234567828433892qk90D8ggCWuEvOngCZaEdaw="
        
    override func viewDidLoad() {
        super.viewDidLoad()
        demo1(barcode: barcode)
        demo2(barcode: barcode)
    }
}

private extension ViewController {
    
    func demo1(barcode: String) {
        
        let counts = [10, 7, 4, 8, 8, 8, 8, 24]
        let result = WWBarcodeSlicer.shared.parse(barcode, counts: counts)
        
        switch result {
        case .failure(let error): wwPrint(error)
        case .success(let codes): wwPrint(codes)
        }
    }
    
    func demo2(barcode: String) {
                
        let infos: [WWBarcodeSlicer.BarcodeInfo] = [
            (key: "發票號碼", count: 10),
            (key: "發票日期", count: 7),
            (key: "隨機碼", count: 4),
            (key: "銷售額", count: 8),
            (key: "總計", count: 8),
            (key: "買受人統編", count: 8),
            (key: "賣方統編", count: 8),
            (key: "加密密文", count: 24),
        ]
        
        let result = WWBarcodeSlicer.shared.parse(barcode, infos: infos)
        
        switch result {
        case .failure(let error): wwPrint(error)
        case .success(let dict): wwPrint(dict)
        }
    }
}
