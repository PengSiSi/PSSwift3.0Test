
//
//  CirculeView.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/11/17.
//  Copyright © 2016年 思 彭. All rights reserved.

// 绘制圆弧

import UIKit

class CirculeView: UIView {

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
        
        //1.获取绘图上下文
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        //2.创建一个矩形，它的所有边都内缩3
        let drawingRect = self.bounds.insetBy(dx: 3, dy: 3)
        
        //3.创建并设置路径
        let path = CGMutablePath()
        
        // 4.圆弧的半径
        let radius = min(drawingRect.width, drawingRect.height)/2
        // 圆弧的中点
        let center = CGPoint(x: drawingRect.midX, y: drawingRect.midY)
        // 绘制圆弧
        path.addArc(center: center, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 1.5, clockwise: false)
        // 添加路径到上下文
        context.addPath(path)
        // 设置笔触颜色
        context.setStrokeColor(UIColor.green.cgColor)
        // 设置笔触宽度
        context.setLineWidth(6)
        // 绘制路径
        context.strokePath()
    }
}
