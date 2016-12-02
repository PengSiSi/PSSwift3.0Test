//
//  DateViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/12/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class DateViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.格式化成字符串
        let date1: Date = Date(timeIntervalSinceNow: 24 * 60 * 60)
        let date2: Date = Date(timeIntervalSince1970: 24 * 60 * 60)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        // 开始比较  不是同一天
        if dateFormatter.string(from: date1) == dateFormatter.string(from: date2) {
            
            print("是同一天");
        }
        else {
            print("不是同一天");
        }
        
        // 2.取出日期的年、月、日
        let calendar = Calendar.current
        let comp1 = calendar.dateComponents([.year,.month,.day], from: date1)
        let comp2 = calendar.dateComponents([.year,.month,.day], from: date2)
        if comp1.year == comp2.year && comp2.month == comp2.month && comp1.day == comp2.day {
            print("是同一天");
        }
        else {
            print("不是同一天");
        }
        
        // 3.使用Calendar的isDate方法进行判断（推荐）
        if Calendar.current.isDate(date1, inSameDayAs: date2) {
             print("是同一天");
        }
        else {
            print("不是同一天");
        }
    }
}
