//
//  DelegateDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/27.
//  Copyright © 2016年 思 彭. All rights reserved.
// 实现两个界面的传值

import UIKit

class DelegateDemo: UIViewController,DelegateDemo1Delegate {

    var label: UILabel!
    var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "代理的使用"
        view.backgroundColor = UIColor.white
        // label
        label = UILabel()
        label.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        label.backgroundColor = UIColor.green
        view.addSubview(label)
        
        // button
        button = UIButton(type: .custom)
        button.frame = CGRect(x: 100, y: 200, width: 100, height: 30)
        button.setTitle("跳转", for: .normal)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(click), for: .touchUpInside)
        view.addSubview(button)
    }
    
    // 跳转
    func click() {
        
        let pushVc = DelegateDemo1()
        pushVc.delegate = self
        self.navigationController?.pushViewController(pushVc, animated: true)
    }
    
    // 实现代理 DelegateDemo1Delegate
    func didInputText(_ string: String) {
    
        label.text = string
    }
}
