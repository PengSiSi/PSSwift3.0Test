//
//  CAShapeLayerDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 17/1/3.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class CAShapeLayerDemo: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CAShapeLayer学习"
        demo1()
        demo2()
    }
    
}
extension CAShapeLayerDemo {
    
    func demo1() {
        
        let layer = CAShapeLayer()
        layer.frame = CGRect(x: 80, y: 100, width: 150, height: 100)
        layer.backgroundColor = UIColor.green.cgColor
        view.layer.addSublayer(layer)
    }
    
    func demo2() {
        
        let path = UIBezierPath(rect: CGRect(x: 80, y: 250, width: 150, height: 100))
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        /** 背景颜色*/
        layer.fillColor = UIColor.red.cgColor
       
        /** 边框颜色*/
        layer.strokeColor = UIColor.green.cgColor
        view.layer.addSublayer(layer)
    }
}
