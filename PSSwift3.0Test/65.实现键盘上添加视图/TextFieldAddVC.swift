//
//  TextFieldAddVC.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 2017/4/8.
//  Copyright © 2017年 思 彭. All rights reserved.

// 一般是通过监听触发键盘弹起和收起后的高度在相关位置添加输入消息和发送消息的视图或者改变视图的高度来实现的，这样比较麻烦，如何在不需监听键盘弹起和收起的情况下实现这样的功能？通过苹果自带的UITextField和UITextView的属性就可以实现.

import UIKit

class TextFieldAddVC: BaseViewController {

    var textView: UITextView?

    @IBOutlet var myTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let kScreenWidth = UIScreen.main.bounds.size.width
        let toolBar: UIToolbar = {
           
            // 创建toolBar
            let tmpToolBar = UIToolbar(frame: CGRect(x: 0, y: 5, width: kScreenWidth, height: 44))
            tmpToolBar.backgroundColor = UIColor.gray
            return tmpToolBar
        }()
        //创建UITextView
        textView = UITextView(frame: CGRect(x: 0, y: 5, width: kScreenWidth / 4 * 3, height: 30))
        textView?.backgroundColor = UIColor.lightGray
        let inputItem = UIBarButtonItem(customView: textView!)
        
        // 创建发送按钮
        let sendBtn = UIButton(frame: CGRect(x: kScreenWidth - 50, y: 5, width: 50, height: 30))
        sendBtn.contentMode = .center
//        sendBtn.backgroundColor = UIColor.green
        sendBtn.setTitle("发送", for: .normal)
        sendBtn.setTitleColor(UIColor.blue, for: .normal)
        sendBtn.addTarget(self, action: #selector(handleSend(event:)), for: .touchUpInside)
        let sendItem = UIBarButtonItem(customView: sendBtn)
        //ToolBar添加textView和发送按钮
        toolBar.items = [inputItem, sendItem]
        //赋值给UITextField的inputAccessoryView
        myTextView?.inputAccessoryView = toolBar
    }
    
    func handleSend(event: UIButton) {
        print(myTextView!.text)
        view.endEditing(true)
    }
}
