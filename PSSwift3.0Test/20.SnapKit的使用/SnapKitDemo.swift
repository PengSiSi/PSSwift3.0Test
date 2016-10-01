//
//  SnapKitDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/10/1.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit
import SnapKit

class SnapKitDemo: BaseViewController {

    lazy var box = UIView()
    lazy var view1 = UIView()
    lazy var innerBox = UIView()
    lazy var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SnapKit的使用"
        demo1()
//        demo2()
//        demo3()
//        demo4()
        demo5()
        demo6()
    }
}

extension SnapKitDemo {

    // 1.布局: view中心点对齐,等宽等高
    func demo1() {
        
        box.backgroundColor = UIColor.orange
        view.addSubview(box)
        box.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.center.equalTo(self.view)
        }
    }
    
    // 2.greaterThanOrEqualTo属性:view1.left 大于等于 box.left：
    func demo2() {
      
        view1.backgroundColor = UIColor.green
        view.addSubview(view1)
        view1.snp.makeConstraints { (make) in
            make.left.greaterThanOrEqualTo(box).offset(20)
            make.top.equalTo(box)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    // 3.left、right、top、centerX、centerY等其他属性
    func demo3() {
        
        innerBox.backgroundColor = UIColor.red
        view.addSubview(innerBox)
        innerBox.snp.makeConstraints { (make) in
            make.right.equalTo(box)
            make.bottom.equalTo(box)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }

    // 4.内位移修正：inset
    func demo4() {
        
        innerBox.backgroundColor = UIColor.red
        view.addSubview(innerBox)
        innerBox.snp.makeConstraints { (make) in
            make.edges.equalTo(box).inset(UIEdgeInsetsMake(10, 10, 10, 10))
        }
    }
    
    // 5.倍率修正：multipliedBy 
    func demo5() {
        
        innerBox.backgroundColor = UIColor.red
        box.addSubview(innerBox)
        innerBox.snp.makeConstraints { (make) in
            make.center.equalTo(box)
            make.size.equalTo(box).multipliedBy(0.5)
        }
    }
    
    // 6.实现label的换行显示
    func demo6() {
        
        label.backgroundColor = UIColor.purple
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(200)
            make.left.equalTo(10)
//            make.width.equalTo(200)
            make.right.equalTo(-20)
//            make.height.equalTo(20)
        }
        label.text = "思思加油!!!思思加油!!!思思加油!!!思思加油!!!思思加油!!!思思加油!!!思思加油!!!思思加油!!!思思加油!!!思思加油!!!思思加油!!!";
        label.numberOfLines = 0
    }
}

