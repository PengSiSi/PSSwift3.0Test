//
//  ScannerDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/27.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

// 导入框架
import AVFoundation

class ScannerDemo: UIViewController,AVCaptureMetadataOutputObjectsDelegate,UIAlertViewDelegate {

    var scanRectView: UIView!
    var device: AVCaptureDevice!
    var input: AVCaptureDeviceInput!
    var output:AVCaptureMetadataOutput!
    var session:AVCaptureSession!
    var preview:AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "10.使用AVFoundation实现条形码扫描"
        view.backgroundColor = UIColor.white
        // 调用扫描
        fromCamera()
        let label = UILabel(frame: CGRect(x: 10, y: 100, width: 300, height: 44))
        label.numberOfLines = 0
        label.backgroundColor = UIColor.green
        label.text = "这个暂时没有实现哟,太难...呜呜~~~"
        view.addSubview(label)

    }
}

extension ScannerDemo {
    
    func fromCamera() {
        
        device = AVCaptureDevice.defaultDevice(withMediaType:AVMediaTypeVideo)
        
    }
}
