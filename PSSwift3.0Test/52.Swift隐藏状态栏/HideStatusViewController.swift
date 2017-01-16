//
//  HideStatusViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 17/1/16.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class HideStatusViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 1.全局设置
        // 1>在 Info.plist 中添加如下配置 <key>UIViewControllerBasedStatusBarAppearance</key>   <false/> 2>Hide Status Bar
        // 2.在视图控制器中单独设置
        
    }
    override var prefersStatusBarHidden: Bool {
        
        return true
    }
}
