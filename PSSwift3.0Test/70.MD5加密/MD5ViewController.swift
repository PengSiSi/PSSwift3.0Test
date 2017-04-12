//
//  MD5ViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 2017/4/12.
//  Copyright © 2017年 思 彭. All rights reserved.

// 注意:需要添加桥接文件,#import <CommonCrypto/CommonCrypto.h>

import UIKit

class MD5ViewController: BaseViewController {

    var originString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        originString = "sisi"
        let md5ResultString = originString?.md5
        print(md5ResultString ?? "error")
    }
}

// String扩展,MD5加密 <给 String 添加属性，获取 MD5 值>

extension String {
    
    var md5: String {
        let str = cString(using: .utf8)
        let strLen = CC_LONG(lengthOfBytes(using: .utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        
        CC_MD5(str!, strLen, result)
        
        var hash = ""
        for i in 0..<digestLen {
            hash = hash.appendingFormat("%02x", result[i])
        }
        result.deallocate(capacity: digestLen)
        
        return hash
    }
}
