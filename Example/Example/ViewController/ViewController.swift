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
    
    typealias CodeInfo = (key: String, count: Int)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let counts = [10, 7, 4, 8, 8, 8, 8, 24]
        
        let infos: [WWBarcodeSlicer.BarcodeInfo] = [
            (key: "發票號碼", count: 10),
            (key: "發票日期", count: 7),
            (key: "四位", count: 4),
            (key: "銷售額", count: 8),
            (key: "總計", count: 8),
            (key: "買受人統編", count: 8),
            (key: "賣方統編", count: 8),
            (key: "加密密文", count: 24),
        ]
        
        let dict = WWBarcodeSlicer.shared.parse(barcode, infos: infos)
        let codes = WWBarcodeSlicer.shared.parse(barcode, counts: counts)

        wwPrint(dict)
        wwPrint(codes)
    }
}
