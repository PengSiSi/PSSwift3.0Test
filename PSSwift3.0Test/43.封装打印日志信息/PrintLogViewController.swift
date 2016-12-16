//
//  PrintLogViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/12/16.
//  Copyright © 2016年 思 彭. All rights reserved.

// 由于 Swift 支持全局函数，全局函数可以在当前所在的命名空间下随意调用。所以我们只需要定义一个全局函数即可

import UIKit

class PrintLogViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        PSLog("程序启动!")
        doSomething()
    }

    func doSomething() {
        
        PSLog("欢迎来到思思的学习空间!")
    }
    
    //封装的日志输出功能（T表示不指定日志信息参数类型）
    func PSLog<T>(_ message:T, file:String = #file, function:String = #function,
               line:Int = #line) {
        #if DEBUG
            //获取文件名
            let fileName = (file as NSString).lastPathComponent
            //打印日志内容
            print("\(fileName):\(line) \(function) | \(message)")
        #endif
    }
}
