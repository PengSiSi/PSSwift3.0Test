//
//  PickViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/12/15.
//  Copyright © 2016年 思 彭. All rights reserved.
// 待完善

import UIKit

class PickViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pickView = PSPickView(frame: CGRect(x: 30, y: 100, width: self.view.frame.size.width - 60, height: 300))
        self.view .addSubview(pickView)
    }
}
