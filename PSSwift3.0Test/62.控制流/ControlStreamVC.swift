//
//  ControlStreamVC.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 2017/4/2.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

// 枚举的简单使用
enum Type {
    case a
    case b
    case c
}

class ControlStreamVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // 1.For-In 循环 闭区间操作符（...）
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        // 开区间 0,1,2,3
        for i in 0..<4 {
            print(i)
        }
        
        // 2.While 循环
        // while循环，每次在循环开始时计算条件是否符合；
        var i = 1
        while i < 3 {
            print(i)   //1 2
            i += 1
        }
        
        // repeat-while循环，每次在循环结束时计算条件是否符合  注意while后面不要加{}
        var j = 0
        repeat {
            
            print(j)
            j += 1
        } while j < 10
            print("结束了...")  // 条件不成立执行的
        
        // 3.条件语句 if...else
        
        if i < 3 {
            print("<3")
        } else {
            print(">=3")
        }
        
        // 4.Switch
        let character = "z"
        switch character {
        case "a":
            print("a")
        default:
            print("no this character")
        }
        
        // 5.元组（Tuple)
        let somePoint = (1, 1)
        switch somePoint {
        case (0, 0):
            print("(0, 0) is at the origin")
        case (_, 0):
            print("(\(somePoint.0), 0) is on the x-axis")
        case (0, _):
            print("(0, \(somePoint.1)) is on the y-axis")
        case (-2...2, -2...2):
            print("(\(somePoint.0), \(somePoint.1)) is inside the box")
        default:
            print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
        }
        // 输出 "(1, 1) is inside the box"
        
        // 6.值绑定（Value Bindings） case 分支允许将匹配的值绑定到一个临时的常量或变量，并且在case分支体内使用 —— 这种行为被称为值绑定（value binding），因为匹配的值在case分支体内，与临时的常量或变量绑定。
        let anotherPoint = (2, 0)
        switch anotherPoint {
        case (let x, 0):
            print("on the x-axis with an x value of \(x)")
        case (0, let y):
            print("on the y-axis with a y value of \(y)")
        case let (x, y):
            print("somewhere else at (\(x), \(y))")
        }
        // 输出 "on the x-axis with an x value of 2"

        // 7.Continue continue语句告诉一个循环体立刻停止本次循环，重新开始下次循环。
        let puzzleInput = "great minds think alike"
        var puzzleOutput = ""
        for character in puzzleInput.characters {
            switch character {
            case "a", "e", "i", "o", "u", " ":
                continue
            default:
                puzzleOutput.append(character)
            }
        }
        print(puzzleOutput)
        // 输出 "grtmndsthnklk"
        
        // 8.Break break语句会立刻结束整个控制流的执行
        let numberSymbol: Character = "三"  // 简体中文里的数字 3
        var possibleIntegerValue: Int?
        switch numberSymbol {
        case "1", "١", "一", "๑":
            possibleIntegerValue = 1
        case "2", "٢", "二", "๒":
            possibleIntegerValue = 2
        case "3", "٣", "三", "๓":
            possibleIntegerValue = 3
        case "4", "٤", "四", "๔":
            possibleIntegerValue = 4
        default:
            break
        }
        if let integerValue = possibleIntegerValue {
            print("The integer value of \(numberSymbol) is \(integerValue).")
        } else {
            print("An integer value could not be found for \(numberSymbol).")
        }
        // 输出 "The integer value of 三 is 3."
        
        // 9.贯穿（Fallthrough）
        let integerToDescribe = 5
        var description = "The number \(integerToDescribe) is"
        switch integerToDescribe {
        case 2, 3, 5, 7, 11, 13, 17, 19:
            description += " a prime number, and also"
            fallthrough
        default:
            description += " an integer."
        }
        print(description)
        // 输出 "The number 5 is a prime number, and also an integer."
        
        // 10.提前退出 如果条件不为真则执行else从句中的代码。
        var name: String? = nil
        
        guard let n = name else {
            return
        }
        print("n == name")
        
        // 11.检测 API 可用性
        if #available(iOS 10,macOS 10.12, *) {
            print("在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API")
        } else {
            print("使用先前版本的 iOS 和 macOS 的 API")
        }
    }
}
