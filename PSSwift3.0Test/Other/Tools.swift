
//
//  Tools.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/25.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import Foundation

// 记得导入UIKit框架
import UIKit

//这里你不能这样写获取屏幕宽度,因为你这样写了就算转屏也不会重新获取宽高的
var k_ScreenWidth: CGFloat{
    get {
        
        return UIScreen.main.bounds.size.width
    }
}

var k_ScreenHeight: CGFloat{
    get {
        
        return UIScreen.main.bounds.size.height
    }
}
