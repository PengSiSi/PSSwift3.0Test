//
//  ImageProcessor.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/11/9.
//  Copyright © 2016年 思 彭. All rights reserved.
// 使用扩展

import Foundation

extension UIImage {
    
    //返回像素化后的图片
    public func pixellated(scale:Int = 30) -> UIImage {
        //使用像素化滤镜
        let filter = CIFilter(name: "CIPixellate")!
        let inputImage = CIImage(image: self)
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        //设置像素版半径，值越大马赛克就越大
        filter.setValue(scale, forKey: kCIInputScaleKey)
        let fullPixellatedImage = filter.outputImage
        let cgImage = CIContext().createCGImage(fullPixellatedImage!,
                                                from: fullPixellatedImage!.extent)
        return UIImage(cgImage: cgImage!)
    }
    
    //返回高斯模糊后的图片
    public func blured(radius:Int = 40) -> UIImage {
        //使用高斯模糊滤镜
        let filter = CIFilter(name: "CIGaussianBlur")!
        let inputImage = CIImage(image: self)
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        //设置模糊半径值（越大越模糊）
        filter.setValue(radius, forKey: kCIInputRadiusKey)
        let outputCIImage = filter.outputImage
        let rect = CGRect(origin: CGPoint.zero, size: self.size)
        let cgImage = CIContext().createCGImage(outputCIImage!, from: rect)
        return UIImage(cgImage: cgImage!)
    }
}
