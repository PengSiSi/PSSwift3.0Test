//
//  PSView.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/11/16.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class PSView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        // 设置背景色为透明色
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        // 获取图形上下文
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        // 创建矩形，它的所有边都内缩10点
        let drawRect = self.bounds.insetBy(dx: 10, dy: 10)
        // 创建并设置路径
        let path = CGMutablePath()
        path.addRect(drawRect)
        context.addPath(path)
        // 设置笔触的颜色
        context.setStrokeColor(UIColor.orange.cgColor)
        // 设置笔触的宽度
        context.setLineWidth(6)
        // 设置路径并填充
        context.strokePath()
    }
}
