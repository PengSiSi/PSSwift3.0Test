//
//  SingleInstanceDemo.swift
//  
//
//  Created by 思 彭 on 16/9/27.
//
//

import UIKit

class SingleInstanceDemo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "单例的使用"
        view.backgroundColor = UIColor.white
        
        // 方法一使用方式
        //APPManager.getShareInstance()
        
        // 方法二使用方式
        /*
          输出结果如下:
         manage:<PSSwift3_0Test.APPManager: 0x60800000a990> manage1:<PSSwift3_0Test.APPManager: 0x60800000a990> manage2:<PSSwift3_0Test.APPManager: 0x60800000a990> manage3:<PSSwift3_0Test.APPManager: 0x60800000a990>

        */
        let manage = APPManager.instance
        let manage1 = APPManager.instance
        let manage2 = APPManager.instance
        let manage3 = APPManager.instance
        print("manage:\(manage) manage1:\(manage1) manage2:\(manage2) manage3:\(manage3)")
    }
}
