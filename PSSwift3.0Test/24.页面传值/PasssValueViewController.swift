//
//  PasssValueViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/10/20.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class PasssValueViewController: BaseViewController {

    let textField = UITextField()
    
    // 自定义闭包
    var backValueClusore:((_ text:String)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "页面传值"
        demo2()
    }
    
    // 按钮的点击
    func buttonAction(button: UIButton) {
        
        for i in 0..<5 {
            let btn = self.view.viewWithTag(100 + i) as! UIButton
            btn.isSelected = false
        }
        button.isSelected = true
        // 为什么不能在extension里面写???
        let userDefaults = UserDefaults.standard
        let selectIndexStr = String(button.tag)
        // 写入plist文件
        userDefaults.set(selectIndexStr, forKey: "selectIndex")
        // 回写文件
        userDefaults.synchronize()
    }

}

extension PasssValueViewController {
    
    // 1.最简单的正向传值
    func demo1() {
        
        textField.frame = CGRect(x: 20, y: 100, width: 200, height: 44)
        textField.borderStyle = .roundedRect
        self.view.addSubview(textField)
    }
    
    // 2.利用属性进行AB页面的反向传值
    func demo2() {
        
        for i in 0..<5 {
            let button = UIButton(type: .system)
            button.setTitle("第\(i + 1)个按钮", for: .normal)
            button.frame = CGRect(x: 7, y: CGFloat(150 + i * 100), width: 400, height: 100)
            //为每一个button设置tag值
            button.tag = 100 + i
            //点击事件
            button.addTarget(self, action: #selector(buttonAction(button:)), for: .touchUpInside)
            self.view.addSubview(button)
        }
    }
    
    // 3.利用NSUserDefult双向传值
    func demo3() {
        
    }
    
    // 4.使用系统闭包反向传值
    func demo4() {
        
    }
    
    // 5.自定义闭包传值
    func demo5() {
        
    }
}

extension PasssValueViewController {
    
    // 点击屏幕触发
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // 创建第二个界面
        let subVc = SubViewController()
//        subVc.string = self.textField.text
        self.present(subVc, animated: true, completion: nil)
    }
}
