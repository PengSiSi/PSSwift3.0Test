//
//  SwiftJSONDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/30.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit
import SwiftyJSON

class SwiftJSONDemo: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "数据解析,JSON转Model"
        // 1.解析json文件
        resolveJsonFile()
    }

}

extension SwiftJSONDemo {
    
    func resolveJsonFile() {
        
        let file = Bundle.main.path(forResource: "SwiftyJSONTests", ofType: "json")
        let data = try? Data(contentsOf: URL(fileURLWithPath: file!))
        let json = JSON(data: data!)
        print("json = \(json)")
    }
}
