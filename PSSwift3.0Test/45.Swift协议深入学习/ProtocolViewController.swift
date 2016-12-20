//
//  ProtocolViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/12/20.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit


/// 定义一个名字为学生的协议 <首字母大写>
protocol Student {

/// 1.具体来说只能使用var关键字声明并且必须明确规定该属性是可读的get、还是可读可写的get set，另外还可以通过关键字static声明一个类型属性.
    
    //定义一个可读可写的 name 属性
    var name: String { get set }
    
    //定义一个可读的 birthPlace 属性
    var birthPlace: String { get }
    
    // 定义一个类属性 record
    static var qualification: String { get }
    
/// 和定义方法一样，我们只需要确定该属性具体是什么类型并且添加对应的关键字，不需要具体的实现，更不能为他们赋上初始值（类似于计算属性）。定义好属性之后，我们就可以利用属性来做点事情了。
    
    // 2.协议中定义方法
    // 类方法
    static func study()
    // 实例方法
    func changeName()
    
}

// 3. 不同协议,相同协议方法
protocol TextOne {
    
    func text() -> Int
}

protocol TextTwo {
    
    func text() -> String
}

struct Puple: Student {
    
    /// 1.变量名称必须和协议属性相同!
    static var qualification: String = "小学"
    var name: String
    var birthPlace: String = "北京"

    // 类方法实现
    static func study() {
    
        print("类方法实现")
    }
    
    // 实例方法实现
    func changeName() {
        
      print("实例方法实现")
//      self.name = "思思"
    }
    // 异变方法: 在结构体中的方法修改到属性的时候需要在方法前面加上关键字mutating表示该属性能够被修改
}

struct Person: TextOne, TextTwo {
    
    func text() -> Int {
        
        return 10
    }
    
    func text() -> String {
        
        return "hello"
    }
}

class ProtocolViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Swift协议深入学习"
        
        // 初始化结构体
        var p1 = Puple(name: "小明", birthPlace: "上海")
        print(p1)   // Puple(name: "小明", birthPlace: "上海")
        
        // 协议中的“只读”属性修饰的是协议这种“类型“”的实例
        Puple.qualification = "中学"
        print(Puple.qualification)  // 中学
        
        let s1: Student = p1
//        s1.birthPlace = "广州"  提示只读
        
        // 调用
        Puple.study()
        p1.changeName()
        
        let person1 = Person()
        /* 编译不通过
        //尝试调用返回值为Int的方法
        let num = person1.text()
        //尝试调用返回值为String的方法
        let string = person1.text()
        */
        
        // 正确写法
        let num = (person1 as TextOne).text()
        let string = (person1 as TextTwo).text()
        
        //4. 协议的检查
        if (person1 is TextOne) {
            print("遵守了TextOne协议")
        }
    }
}
