//
//  ViewController2.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/12/14.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class ViewController2: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "C页面"
        view.backgroundColor = UIColor.gray
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // 返回到上一个页面
        // self.dismiss(animated: true, completion: nil)
        
        // 1.直接返回到根页面 连续dismiss两个页面
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)

        // 2.循环调用 presentingViewController 获取根VC，再dissmiss
        var rootVc = self.presentingViewController
        while let parent = rootVc?.presentingViewController {
            rootVc = parent
        }
        rootVc?.dismiss(animated: true, completion: nil)
        
        //3.直接获取根控制器,dismiss
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
