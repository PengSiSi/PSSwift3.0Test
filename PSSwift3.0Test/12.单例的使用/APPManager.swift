//
//  APPManager.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/27.
//  Copyright © 2016年 思 彭. All rights reserved.
// 单例类

import UIKit

class APPManager: NSObject {

    /*
    // 方法一:
    private static let instance = APPManager()
    
    // 定义类方法,返回当前单例类对象
    class func getShareInstance() ->APPManager {
        
        return instance
    }
    
    // 私有化init方法<需要override重写>
    private override init() {
        
    }
    */
    
    // 方法二:
    static let instance = APPManager()
    
    // 私有化init方法
    fileprivate override init() {
        
    }
}
