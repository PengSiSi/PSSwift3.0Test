//
//  StringDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 17/4/1.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class StringDemo: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 去除字符串的收尾特定字符
        trimCharacter()
        
        // 字符串字面量
        let s3 = "sisiisisi"
        
        // 定义空字符串
        var s1 = ""
        var s2 = String()
        
        // 判断该字符串是否为空
        if s3.isEmpty {
            print("s3是空字符串...")
        }
        
        // 字符串可变性
        var s4 = "Peng"
        s4 += "si"
        print(s4)
        
        // 字符串是值类型
        
        // 使用字符
        for character in s4.characters {
            print(character)
        }
        
        // 连接字符串和字符
        let string1 = "abc"
        let string2 = "123"
        var string3 = string1 + string2
        
        // append
        let exclamationMark: Character = "!"
        string3.append(exclamationMark)
        
        // 字符串插值
        let multiplier = 3
        let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
        print(message)
        
        // 计算字符数量
        let unusualMenagerie = "adefrfrvrv"
        print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
        
        // 字符串索引
        let greeting = "Guten Tag!"
        _ = greeting[greeting.startIndex];
//        _ = greeting[greeting.endIndex];
        _ = greeting[greeting.index(after: greeting.startIndex)]
        _ = greeting[greeting.index(before: greeting.endIndex)]
        _ = greeting[greeting.index(greeting.startIndex, offsetBy: 2)]
        
        // characters 属性的 indices 创建一个包含全部索引的范围(Range)
        for index in greeting.characters.indices {
            print(greeting[index])
        }
        
        // 插入和删除 
        // 调用 insert(_:atIndex:) 方法可以在一个字符串的指定索引插入一个字符，调用 insert(contentsOf:at:) 方法可以在一个字符串的指定索引插入一个段字符串。
        var welcome = "hello"
        welcome.insert("!", at: welcome.endIndex)
        welcome.insert(contentsOf: "there".characters, at: welcome.startIndex)
        welcome.remove(at: welcome.startIndex)
        let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
        welcome.removeSubrange(range)
        
        // 比较字符串
        let quotation = "We're a lot alike, you and I."
        let sameQuotation = "We're a lot alike, you and I."
        if quotation == sameQuotation {
            print("These two strings are considered equal")
        }
        
        // 前缀/后缀相等
        let romeoAndJuliet = [
            "Act 1 Scene 1: Verona, A public place",
            "Act 1 Scene 2: Capulet's mansion",
            "Act 1 Scene 3: A room in Capulet's mansion",
            "Act 1 Scene 4: A street outside Capulet's mansion",
            "Act 1 Scene 5: The Great Hall in Capulet's mansion",
            "Act 2 Scene 1: Outside Capulet's mansion",
            "Act 2 Scene 2: Capulet's orchard",
            "Act 2 Scene 3: Outside Friar Lawrence's cell",
            "Act 2 Scene 4: A street in Verona",
            "Act 2 Scene 5: Capulet's mansion",
            "Act 2 Scene 6: Friar Lawrence's cell"
        ]
        var act1SceneCount = 0
        for scene in romeoAndJuliet {
            if scene.hasPrefix("Act") {
                act1SceneCount += 1
            }
        }
        print("There are \(act1SceneCount) scenes in Act 1")
    }
}

extension StringDemo {
    
    func trimCharacter() {
        
        // 去除字符串前后的空白
        /*
         CharacterSet 里各个枚举类型的含义如下：
         controlCharacters：控制符
         whitespaces：空格
         newlines：换行符
         whitespacesAndNewlines：空格换行
         decimalDigits：小数
         letters：文字
         lowercaseLetters：小写字母
         uppercaseLetters：大写字母
         nonBaseCharacters：非基础
         alphanumerics：字母数字
         decomposables：可分解
         illegalCharacters：非法
         punctuationCharacters：标点
         capitalizedLetters：大写
         symbols：符号
         */
        // 1.删除前后空格
        let str1 = "  https://github.com/PengSiSi?tab=repositories  "
        let str2 = str1.trimmingCharacters(in: .whitespaces)
        print("str1 = \(str1) str2 = \(str2)")
        
        // 2.删除指定字符<>
        let character = CharacterSet(charactersIn: "<>")
        let str3 = "<<https://github.com/PengSiSi?tab=repositories>>"
        let str4 = str3.trimmingCharacters(in: character)
        print("str3 = \(str3) str4 = \(str4)")
    }
}
