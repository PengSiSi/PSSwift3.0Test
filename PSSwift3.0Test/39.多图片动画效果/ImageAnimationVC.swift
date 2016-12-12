//
//  ImageAnimationVC.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/12/8.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class ImageAnimationVC: BaseViewController {

    var button: UIButton?

    fileprivate lazy var animationImageView: UIImageView = { [unowned self] in
        
        let imageView = UIImageView(image: UIImage(named: "img_loading_1"))
        imageView.center = self.view.center
        imageView.animationImages = [UIImage(named: "img_loading_1")!,UIImage(named: "img_loading_2")!]
        imageView.animationDuration = 0.5   // 动画时间
        imageView.animationRepeatCount = LONG_MAX   // 重复次数   无限大
        imageView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]
        return imageView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "多图片动画效果"
        
        button = UIButton(type: .custom)
        button?.backgroundColor = UIColor.gray
        button?.setTitle("停止动画", for: .normal)
        button?.setTitleColor(UIColor.white, for: .normal)
        button?.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button?.frame = CGRect(x: (k_ScreenWidth - 60) / 2, y: k_ScreenHeight - 50, width: 60, height: 40)
        button?.addTarget(self, action: #selector(buttonDidClick(button:)), for: .touchUpInside)
        view.addSubview(button!)
        
        // 设置界面
        setUI()
    }
}

extension ImageAnimationVC {
    
    func setUI() {
        
        view.addSubview(animationImageView)
        animationImageView.startAnimating()
        view.backgroundColor = UIColor.lightGray
    }
    
    func buttonDidClick(button: UIButton) {

        stopAnimation()
    }
    
    func stopAnimation() {
        
        animationImageView.stopAnimating()
        animationImageView.isHidden = true
    }
}
