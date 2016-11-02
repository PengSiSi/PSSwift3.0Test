//
//  ColorViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/11/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

//返回随机颜色  扩展
extension UIColor {
    
    open class var randomColor:UIColor{
        get
        {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}

class ColorViewController: BaseViewController {

    let colorView = UIView (frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 创建视图展示随机颜色
        colorView.backgroundColor = UIColor.randomColor
        self.view.addSubview(colorView);
        
    }
}
