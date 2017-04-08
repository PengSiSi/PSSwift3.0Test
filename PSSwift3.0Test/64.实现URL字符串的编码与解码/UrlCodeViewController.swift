//
//  UrlCodeViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 2017/4/6.
//  Copyright © 2017年 思 彭. All rights reserved.

// 发起 HTTP 网络请求，如果拼接的 URL 地址中包含有中文、空格、特殊符号时，我们就要对其转义。否则就会无法正确访问。

import UIKit

class UrlCodeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlStr = "http://www.combanc.com?name=思思&key=!*'();:@&=+$,/?%#[]"
        print("转义后的url：\(urlStr.urlEncoded())")
        print("还原后的url：\(urlStr.urlEncoded().urlDecoded())")
        
        // 记录最大数字的种类(kind)，同时仍然记录这个最大数字的值
        let interestingNumbers = ["prime": [2,3,4,5,9],
                                  "fibonacci": [1,3,4,6],
                                  "square": [4,6,7,9]]
        var larger: Int = 0
        var kind: String = ""
        for (kinds, numbers) in interestingNumbers {
            for number in numbers {
                if number > larger {
                    larger = number;
                    kind = kinds
                }
            }
        }
        print("kind = \(kind) number = \(larger)")
    }
}

// Swift3 新增的 addingPercentEncoding 方法实现了编码的功能，也就是将指定的字符集使用“%”代替。
extension String {
    
    // 将原始的url编码为合法的url
    func urlEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        return encodeUrlString ?? ""   // 存在返回,否则返回空字符串
    }
    
    // 将编码后的url转换回原始的url
    func urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
    }
}

