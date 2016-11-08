//
//  ImageBlureViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/11/7.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class ImageBlureViewController: BaseViewController {

    // 图片
    var imgView: UIImageView!
    // 滑块
    var slider: UISlider!
    
    // 懒加载
    lazy var originalImage: UIImage = {
        
        return UIImage(named: "img2.jpg")
        }()!
    
    lazy var context: CIContext = {
        
        return CIContext(options: nil)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "实现图片的模糊效果（高斯模糊滤镜)";
        imgView = UIImageView(frame: CGRect(x: 10, y: 100, width: k_ScreenWidth - 20, height: 200))
        imgView.image = UIImage(named: "img2.jpg")
        self.view.addSubview(imgView)
        
        slider = UISlider(frame: CGRect(x: 10, y: 330, width: k_ScreenWidth - 20, height: 30))
        slider.addTarget(self, action: #selector(slideChange(_slide:)), for: .valueChanged)
        self.view.addSubview(slider)
        
    }
    
    // 滑块拖动
    func slideChange(_slide: UISlider) {
     
        print("滑块拖动啦...\(slider.value)")
         //获取原始图片
        let inputImage = CIImage(image: originalImage)
        //使用高斯模糊滤镜
        let filter = CIFilter(name: "CIGaussianBlur")!
        filter.setValue(inputImage, forKey:kCIInputImageKey)
        //设置模糊半径值（越大越模糊）
        filter.setValue(slider.value, forKey: kCIInputRadiusKey)
        let outputCIImage = filter.outputImage!
        let rect = CGRect(origin: CGPoint.zero, size: originalImage.size)
        let cgImage = context.createCGImage(outputCIImage, from: rect)
        //显示生成的模糊图片
        imgView.image = UIImage(cgImage: cgImage!)
    }
}
