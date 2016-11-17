//
//  DottedView.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/11/17.
//  Copyright © 2016年 思 彭. All rights reserved.

// 设置虚线

import UIKit

class DottedView: UIView {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        // 设置背景颜色，否则为黑色背景
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // 1.获取图形上上下文
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        // 2.创建矩形，所有边内缩3
        let drawingRect = self.bounds.insetBy(dx: 3, dy: 3)
        // 3.创建并设置路径
        let path = CGMutablePath()
        path.move(to: CGPoint(x:drawingRect.minX, y:drawingRect.minY))
        path.addLine(to:CGPoint(x:drawingRect.maxX, y:drawingRect.minY))
        path.addLine(to:CGPoint(x:drawingRect.maxX, y:drawingRect.maxY))
        
        //4. 添加路径到上下文
        context.addPath(path)
        // 设置笔触颜色
        context.setStrokeColor(UIColor.red.cgColor)
        // 设置笔触宽度
        context.setLineWidth(6)
        // 虚线每个线段的长度与间隔
        let lengths: [CGFloat] = [15, 4]
        // 设置虚线的样式
        context.setLineDash(phase: 0, lengths: lengths)
        // 5.绘制路径
        context.strokePath()
    }
}
