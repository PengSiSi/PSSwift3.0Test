//
//  SubViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/10/20.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class SubViewController: BaseViewController {

    var string: String?
    private let label: UILabel = UILabel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // 读取plist文件，并完成反向传值
        let userDefaults = UserDefaults.standard
        let data = userDefaults.object(forKey: "selectIndex")
        self.label.text = "按钮的tag值是\(data)选中转态"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.label.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: 44)
        self.label.textAlignment = .center
        self.label.backgroundColor = UIColor.red
        self.view.addSubview(self.label)
//        self.label.text = self.string
    }
}

extension SubViewController {
    
    // 点击屏幕dismiss
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
}
