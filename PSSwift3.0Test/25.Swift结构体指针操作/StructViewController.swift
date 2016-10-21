//
//  StructViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/10/21.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class StructViewController: BaseViewController {

    // 申明User结构体
    struct User {
        
        var ID: Int
        var age: Int
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       var user =  User(ID: 660303, age: 20)
        print("ID = \(user.ID) age = \(user.age)")
       let userPointer = withUnsafePointer(to: &user, {$0})//UnsafePointer
        // 1.打印user指针的值
        print(userPointer.pointee)
        
        // 2.获取user ID的值   不知道为啥报错??
//        let userIDPointer = unsafeBitCast(userPointer, to: UnsafeMutablePointer.self)
        // 3.获取user age的指针
        let agePointer = userPointer.advanced(by: 1)
//        agePointer.pointee = 4   // ????
        print(userPointer.pointee)
        }
}
