//
//  CMPendometer.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 17/2/16.
//  Copyright © 2017年 思 彭. All rights reserved.

// 计步器CMPedometer的使用

import UIKit
// 导入框架
import CoreMotion

class CMPendometer: BaseViewController {
    
    var textLabel: UILabel = UILabel()
    let pedometer = CMPendometer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.frame = CGRect(x: 50, y: 100, width: 300, height: 200)
        textLabel.font = UIFont.systemFont(ofSize: 15)
        textLabel.textColor = UIColor.green
        textLabel.backgroundColor = UIColor.lightGray
        self.view.addSubview(textLabel)
        
        // 开始计步
        startGetpedometerData()
    }
    
    func startGetpedometerData() {
        
        // 判断设备是否支持
//        guard CMPendometer.isStepCountingAvailable() else {
//            self.textLabel.text = "\n当前设备不支持获取步数\n"
//            return
//        }
        let cal = Calendar.current
        var comps = cal.dateComponents([.year,.month,.day], from: Date())
        comps.hour = 0
        comps.minute = 0
        comps.second = 0
        let midnightOfToday = cal.date(from: comps)!
        //初始化并开始实时获取数据
//        self.pedometer.startUpdates (from: midnightOfToday, withHandler: { pedometerData, error in
//            //错误处理
//            guard error == nil else {
//                print(error!)
//                return
//            }
//            
//            //获取各个数据
//            var text = "---今日运动数据---\n"
//            if let numberOfSteps = pedometerData?.numberOfSteps {
//                text += "步数: \(numberOfSteps)\n"
//            }
//            if let distance = pedometerData?.distance {
//                text += "距离: \(distance)\n"
//            }
//            if let floorsAscended = pedometerData?.floorsAscended {
//                text += "上楼: \(floorsAscended)\n"
//            }
//            if let floorsDescended = pedometerData?.floorsDescended {
//                text += "下楼: \(floorsDescended)\n"
//            }
//            if let currentPace = pedometerData?.currentPace {
//                text += "速度: \(currentPace)m/s\n"
//            }
//            if let currentCadence = pedometerData?.currentCadence {
//                text += "速度: \(currentCadence)步/秒\n"
//            }
//            
            //在线程中更新文本框数据
//            DispatchQueue.main.async{
//                self.textLabel.text = text
//            }
//        })
    }
}
