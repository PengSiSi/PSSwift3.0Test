//
//  DelegateDemo1.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/27.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

// 定义协议
protocol DelegateDemo1Delegate {
    
    func didInputText(_ string: String)
}

class DelegateDemo1: UIViewController,UITextFieldDelegate {

    var textField: UITextField?
    // 定义代理
    var delegate: DelegateDemo1Delegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        textField = UITextField(frame: CGRect(x: 80, y: 100, width: 200, height: 30))
        textField?.delegate = self
        textField?.backgroundColor = UIColor.green
        view.addSubview(textField!)
    }
    
    // UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    // 传递数据
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        if delegate != nil {
            delegate?.didInputText((textField?.text)!)
        }
    }
}
