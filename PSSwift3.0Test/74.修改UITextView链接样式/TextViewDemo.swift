//
//  TextViewDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 2017/5/8.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class TextViewDemo: BaseViewController, UITextViewDelegate {
    
    // 注意点: 要将xib的link勾选上,Editable要取消勾选,好像代码不能实现link属性
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        textView = UITextView(frame: CGRect(x: 20, y: 100, width: 250, height: 100))
        
        textView?.delegate = self
        textView?.backgroundColor = UIColor.lightGray
        textView?.textColor = UIColor.green
        textView?.text = "欢迎访问思思的Github地址:https://github.com/PengSiSi"
        textView.linkTextAttributes = [NSForegroundColorAttributeName: UIColor.orange,NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue]
        view.addSubview(textView!)
    }
}
