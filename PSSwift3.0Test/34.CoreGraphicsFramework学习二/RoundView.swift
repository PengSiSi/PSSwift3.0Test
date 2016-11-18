//
//  RoundView.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/11/18.
//  Copyright © 2016年 思 彭. All rights reserved.

// 绘制圆形

import UIKit

class RoundView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        //设置背景色为透明，否则是黑色背景
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //获取绘图上下文
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        //创建并设置路径
        let path = CGMutablePath()
        //绘制正圆
        let minWidth = min(self.bounds.width, self.bounds.height)
        path.addEllipse(in: CGRect(x: 3, y: 3, width: minWidth - 6, height: minWidth - 6))
        
        /* 
         绘制椭圆
        path.addEllipse(in: drawingRect)
         */
        
        //添加路径到图形上下文
        context.addPath(path)
        //设置笔触颜色
        context.setStrokeColor(UIColor.orange.cgColor)
        //设置笔触宽度
        context.setLineWidth(6)
        //设置填充颜色
        context.setFillColor(UIColor.blue.cgColor)
        //绘制路径并填充
        context.drawPath(using: .fillStroke)
    }
}
