//
//  LineView.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/11/17.
//  Copyright © 2016年 思 彭. All rights reserved.

// 绘制直线

import UIKit

class LineView: UIView {


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
        // 1.获取上下文
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        // 2.创建矩形，所有边内缩3
        let drawrect = self.bounds.insetBy(dx: 3, dy: 3)
        // 3.创建设置路径
        let path = CGMutablePath()
        path.move(to: CGPoint(x: drawrect.minX, y: drawrect.minY))
        path.addLine(to: CGPoint(x: drawrect.maxX, y: drawrect.minY))
        path.addLine(to: CGPoint(x: drawrect.maxX, y: drawrect.maxY))
        // 4.添加路径到图形上下文
        context.addPath(path)
        // 设置颜色
        context.setStrokeColor(UIColor.orange.cgColor)
        // 设置宽度
        context.setLineWidth(5)
        
        /*
         .butt：不绘制端点， 线条结尾处直接结束。（默认值）
         .round：绘制圆形端点， 线条结尾处绘制一个直径为线条宽度的半圆
         .square：线条结尾处绘制半个边长为线条宽度的正方形。这种形状的端点与“butt”形状的端点十分相似，只是线条略长一点而已。
         */
        // 设置定点的样式（圆角）
        context.setLineCap(.round)
        
        /*
         .mitre：锐角斜切（默认值）
         .round：圆头
         .bevel：平头斜切
         */
        // 设置连接线的样式
        context.setLineJoin(CGLineJoin.miter)
        // 设置阴影
        context.setShadow(offset: CGSize(width:3, height:3), blur: 0.6,
                          color: UIColor.lightGray.cgColor)
        // 绘制路径
        context.strokePath()
    }
}
