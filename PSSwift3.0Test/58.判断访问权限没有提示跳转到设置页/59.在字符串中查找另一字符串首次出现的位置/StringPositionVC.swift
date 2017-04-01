//
//  StringPositionVC.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 17/4/1.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class StringPositionVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 使用
        let str1 = "欢迎来到思思的学习天地";
        let str2 = "思思";
        let position = str1.positionOf(sub: str2)
        
        /*
         父字符串：欢迎来到思思的学习天地
         子字符串：思思
         子字符串在父字符串里的位置是：4
         */
        print("父字符串：\(str1)")
        print("子字符串：\(str2)")
        print("子字符串在父字符串里的位置是：\(position)")
    }
}

// 对 String 类做个扩展，新增个 positionOf 方法 ,用来获取内部子字符串第一次出现的位置索引。（如果内部不存在该字符串则返回 -1。）
extension String {
    func positionOf(sub: String) -> Int {
        var pos = -1
        if let range = range(of: sub) {
            if !range.isEmpty {
                pos = characters.distance(from: startIndex, to: range.lowerBound)
            }
        }
        return pos
    }
}
