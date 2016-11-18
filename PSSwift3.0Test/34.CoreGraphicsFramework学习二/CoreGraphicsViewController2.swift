//
//  CoreGraphicsViewController2.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/11/18.
//  Copyright © 2016年 思 彭. All rights reserved.

// 图形绘制

import UIKit

class CoreGraphicsViewController2: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CoreGraphicsFramework学习二"
        // 1.绘制矩形
        let rectView = RectView (frame: CGRect(x: 10, y: 100, width: 100, height: 100))
        self.view.addSubview(rectView)
        
        // 2.绘制圆角矩形
        let roundRectView = RoundRectView (frame: CGRect(x: 160, y: 100, width: 100, height: 100))
        self.view.addSubview(roundRectView)
        
        // 3.绘制正圆
        let roundView = RoundView (frame: CGRect(x: 10, y: 220, width: 100, height: 100))
        self.view.addSubview(roundView)
    }
}
