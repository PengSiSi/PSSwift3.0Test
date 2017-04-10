//
//  ImageViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 2017/4/10.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class ImageViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 方法一:
        let image = UIImage(named: "videoScreenshot03")
        let imgView = UIImageView(image: image)
        imgView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        imgView.contentMode = .scaleAspectFill
        // 设置遮罩
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = imgView.width / 2
        self.view.addSubview(imgView)
        
        // 方法二:
        let inmage = image?.toCircle()
        imgView.image = inmage;
    }
}

extension UIImage {
    
    // 生成图片
    func toCircle() -> UIImage {
        
        // 取最短边长
        let short = min(self.size.width, self.size.height)
        // 输出尺寸
        let outpuctRect = CGRect(x: 0, y: 0, width: short, height: short)
        // 开始图片处理上下文
        UIGraphicsBeginImageContextWithOptions(outpuctRect.size, false, 0)
        // 取得上下文
        let context = UIGraphicsGetCurrentContext()
        //添加圆形裁剪区域
        context?.addEllipse(in: outpuctRect)
        context?.clip()
         //绘制图片
        self.draw(in: CGRect(x: (short-self.size.width)/2,
                             y: (short-self.size.height)/2,
                             width: self.size.width,
                             height: self.size.height))
        //获得处理后的图片
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resultImage!
    }
}
