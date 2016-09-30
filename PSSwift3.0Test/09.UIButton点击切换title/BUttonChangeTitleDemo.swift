//
//  BUttonChangeTitleDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/27.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class BUttonChangeTitleDemo: UIViewController {

    var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        title = "UIButton点击切换title"
        createButton()
    }

}

// MARK: 设置界面

extension BUttonChangeTitleDemo {
    
    func createButton() {
        
        button = UIButton(type: .custom)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        button.setTitle("播放", for: .normal)
        button.backgroundColor = UIColor.green
        button.addTarget(self, action: #selector(buttonClick1), for: .touchUpInside)
        view.addSubview(button)
    }
    
    // 1.使用currentTitle获取
    func buttonClick() {
        
        
        if button.currentTitle == "播放" {
            button.setTitle("暂停", for: .normal)
        }
        else{
            button.setTitle("播放", for: .normal)
        }
    }
    // 2.使用titleForState()获取
    func buttonClick1() {
        
        if  button.title(for: .normal) == "播放" {
            button.setTitle("暂停", for: .normal)
        }
        else{
            button.setTitle("播放", for: .normal)
        }
    }
}
