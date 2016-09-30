//
//  OpenUrlDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/28.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class OpenUrlDemo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "13.通过url地址打开web页面"
        view.backgroundColor = UIColor.white
        
        let urlString: String = "http://hangge.com"
        let url: URL = URL(string: urlString)!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
