//
//  SwiftSummaryVC.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 2017/5/17.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

// 10.类型别名
typealias example = Int16

// 7.协议使用
protocol SwiftSummaryVCProtocol {
    
    var simpleDescription: String { get }
    mutating func adjust()
}

// 8.错误处理
enum PrinterError: Error {
    case OutOfPager
    case NoToner
    case OnFire
}

class SwiftSummaryVC: BaseViewController {

    var numbers: [Int] = [23, 45, 65,78, 90]
    
    // 6. 枚举可以包含方法
    enum Rank: Int {
        case Ace = 1
        case Two, Three, Four
        case Jack, Sisi
        
        func simpleDescription() -> String {
            switch self {
            case .Ace:
                return "ace"
            case .Two:
                return "Two"
            default:
                return String(self.rawValue)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1.repeat...while的使用
        var m = 2
        repeat {
            m = m * 2
        } while m < 100
        
        // 5.匿名闭包的使用
        let result =  numbers.map({
            (number: Int) -> Int in
            let result = 3 * number
            return result
        })
        let sortNumber = numbers.sort{$0 > $1}
        print(sortNumber)
        
        let ace = Rank.Ace
        let aceRawVValue = ace.rawValue
        
        // 定义类实例
        var a = simpleClass()
        a.adjust()  // A very examplehaha
        
        // 错误处理
        do {
            let printerResponse = try send(Jon: 22, toPrinter: "Never has Toner")
        } catch  {
            print(error)
        }
        
        do {
            let printerErrors = try send(Jon: 34, toPrinter: "hah")
        } catch PrinterError.OnFire {
            print("")
        } catch PrinterError.NoToner {
            print("")
        } catch {
            print(error)
        }
        
        // 断言
        assertExample(age: 3);
        
        var str = "abcdef"
        let count = str.characters.count
        
        // 创建带默认值的数组
        var threeDoubles = Array(repeating: 0.0, count: 3)
        
        var letters = Set<Character>()
        letters.insert("a")
        
        var dic: [String: String] = ["1":"a",
                                     "2":"b",
                                     "3":"c"]
        dic["c"] = "4"
        if let oldValue = dic.updateValue("d", forKey: "3") {
            print("oldValue = \(oldValue)") // oldValue = d
        }
        
        switch str {
        case "A":
            print("A")
            fallthrough
        case "B":
            print("B")
        default:
            print("default")
        }
        
        // 检测API的可用性
        if #available(iOS 10, macOS 10.12, *) {
          // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
        } else {
          //使用先前版本的iOS和macOS的API
        }
        sortExample { 
            
        }
    }
    
    // 2.函数参数带有多个值
    func sumOf(numbers: Int...) -> Int {
        var sum = 0
        for number in numbers {
            sum += number;
        }
        return sum
    }
    
    // 3.函数的返回值是函数
    func makeIncrementer() -> ((Int) -> Int) {
        func addOne(number: Int) -> Int {
            return 1 + number
        }
        return addOne
    }
    
    // 4.函数参数是函数
    func lessThanTen(number: Int) -> Bool {
        return number < 10
    }
    
    func hasAnyMatches(list: [Int], condition: ((Int) -> Bool)) -> Bool {
        for item in list {
            if condition(item) {
                return true
            }
        }
        return false
    }
}

extension SwiftSummaryVC {
    
    // 错误处理抛出函数
    func send(Jon: Int, toPrinter printerName: String) throws -> String {
        if printerName == "Never has Toner" {
            throw PrinterError.NoToner
        }
        defer {
            print("程序这块一定会执行的...")
        }
        return "job sent"
    }
    
    // 9.泛型的使用
    func repearItem<Item>(repeatItem: Item , numberItems: Int) -> [Item] {
        var result = [Item]()
        for _ in 0..<numberItems {
            result.append(repeatItem)
        }
        return result
    }
    
    // 10.断言
    func assertExample(age: Int) {
        assert(age >= 0, "age < 0")
        print(age)
    }
    
    // 尾随闭包
    func sortExample(closure: () -> Void) {
        
    }
}

// 定义类遵守协议
class simpleClass: SwiftSummaryVCProtocol {
    
    // 实现协议
    var simpleDescription: String = "A very example"
    func adjust() {
        simpleDescription += "haha"
        print(simpleDescription)
    }
}
