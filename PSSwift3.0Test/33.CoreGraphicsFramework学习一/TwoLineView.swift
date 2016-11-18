//
//  TwoLineView.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/11/17.
//  Copyright © 2016年 思 彭. All rights reserved.

// 二次贝塞尔曲线绘制

import UIKit

class TwoLineView: UIView {

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
        
        //创建一个矩形，它的所有边都内缩3点
        let drawingRect = self.bounds.insetBy(dx: 3, dy: 3)
        
        //创建并设置路径
        let path = CGMutablePath()
        //移动起点
        path.move(to: CGPoint(x: drawingRect.minX, y: drawingRect.maxY))
        //二次贝塞尔曲线终点
        let toPoint = CGPoint(x: drawingRect.maxX, y: drawingRect.maxY)
        //二次贝塞尔曲线控制点
        let controlPoint = CGPoint(x: drawingRect.midX, y: drawingRect.minY)
        //绘制二次贝塞尔曲线
        path.addQuadCurve(to: toPoint, control: controlPoint)
        
        //添加路径到图形上下文
        context.addPath(path)
        
        //设置笔触颜色
        context.setStrokeColor(UIColor.orange.cgColor)
        //设置笔触宽度
        context.setLineWidth(6)
        
        //绘制路径
        context.strokePath()
    }
}
