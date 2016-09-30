//
//  UIBlurEffectDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/27.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class UIBlurEffectDemo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        // 1.图片视图
        
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: k_ScreenWidth, height: 300))
        imgView.image = UIImage(named: "20160802144546260948.jpeg")
        view.addSubview(imgView)
        
        //2.首先创建一个模糊效果
        let blurEffect = UIBlurEffect(style: .light)
        //接着创建一个承载模糊效果的视图
        let blurView = UIVisualEffectView(effect: blurEffect)
        //设置模糊视图的大小（全屏）
        blurView.frame = view.bounds
        //添加模糊视图到页面view上（模糊视图下方都会有模糊效果）
        view.addSubview(blurView)
        
        //3.创建并添加vibrancy视图
        let vibrancyView = UIVisualEffectView(effect: blurEffect)
        vibrancyView.frame.size = CGSize(width: k_ScreenWidth, height: 300)
        blurView.contentView.addSubview(vibrancyView)
        //将文本标签添加到vibrancy视图中
        let label = UILabel(frame: CGRect(x: 100, y: 210, width: 300, height: 100))
        label.text = "思思,最棒棒!!!"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 40)
        label.textAlignment = .center
        label.textColor = UIColor.white
        vibrancyView.contentView.addSubview(label)
        
    }
}


extension UIBlurEffectDemo {
    
    
}
