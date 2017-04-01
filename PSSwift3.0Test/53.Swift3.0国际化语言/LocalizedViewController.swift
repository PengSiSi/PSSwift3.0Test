//
//  LocalizedViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 17/1/17.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class LocalizedViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        

    }
    /*
     代码说明：
     　　　　1、"Localizable" 指的是 Localizable.strings
     
     　　　　2、"zh-Hans" 这里强制指定中文
     
     　　　　3、如果强制指定就用上面的代码，否则可以直接用 NSLocalizedString(key, comment: "") 根据系统语言自动切换。
     */
    
    fileprivate var localizedBundle: Bundle = {
        return Bundle(path: Bundle.main.path(forResource: "zh-Hans", ofType: "lproj")!)!
    }()
    
    public func LocalizedString(_ key: String, comment: String) -> String {
        let localText = NSLocalizedString(key, tableName: "Localizable", bundle: localizedBundle, comment: "")
        return localText == key ? comment :  localText
    }
}
