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
        print(NSHomeDirectory())
        doSomething()
    }

    func doSomething() {
        
        PSLog("欢迎来到思思的学习空间!")
    }
    
    // 1.封装打印信息打印到控制台
    /*
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
 */
    
    // 2. 封装日志输出保存到文件
    func PSLog<T>(_ message:T, file:String = #file, function:String = #function,
               line:Int = #line) {
        #if DEBUG
            
            // 获取文件名
            let fileName = (file as NSString).lastPathComponent
            // 日志内容
            let consoleStr = "\(fileName):\(line) \(function) | \(message)"
            print(consoleStr)
            
            // 创建日期格式
            let dateFormat = DateFormatter()
            // 设置格式符
            dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
            // 当前日期,时间
            let dateStr = dateFormat.string(from: Date())
            // 将内容写到文件(Caches文件夹下)
            let cachePath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
            let logUrl = cachePath.appendingPathComponent("log.text")
            appendText(fileURL: logUrl, string: "\(dateStr) \(consoleStr)")
            
            
        #endif
    }

    func appendText(fileURL: URL, string: String) {
       
        do {
            
            // 文件不存在创建一个
            if !FileManager.default.fileExists(atPath: fileURL.path) {
                FileManager.default.createFile(atPath: fileURL.path, contents: nil)
            }
            let fileHandle = try FileHandle(forWritingTo: fileURL)
            let stringToWrite = "\n" + string
            
            //找到末尾位置并添加
            fileHandle.seekToEndOfFile()
            fileHandle.write(stringToWrite.data(using: String.Encoding.utf8)!)
        } catch let error as NSError {
            
            print("failed to append: \(error)")
        }
    }
}
