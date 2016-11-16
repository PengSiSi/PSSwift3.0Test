//
//  DrawViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/11/16.
//  Copyright © 2016年 思 彭. All rights reserved.
// 继承UIView重写draw方法后背景变黑色的问题解决

import UIKit

class DrawViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "继承UIView，重写DrawRect"
        // 创建视图
        let myView = PSView(frame: CGRect(x: 30, y: 64, width: 100, height: 100))
        // 解决方法1：设置背景色为透明色
//        myView.backgroundColor = UIColor.clear
        // 解决方法2：init方法设置背景色
        self.view.addSubview(myView)
    }
}
