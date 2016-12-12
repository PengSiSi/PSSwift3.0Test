//
//  HeartAnimationVC.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/12/12.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class HeartAnimationVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        let heartBtn = UIButton(frame: CGRect(x: 120, y: 150, width: 70, height: 70))
        view.addSubview(heartBtn)
        heartBtn.setImage(UIImage(named: "logo_1000x1000_@1x"), for: .selected)
        heartBtn.setImage(UIImage(named: "haoshu_1000x1000_@1x"), for: .normal)
        heartBtn.addTarget(self, action: #selector(click(button:)), for: .touchUpInside);
    }
    
    func click(button: UIButton) {
        
        print("心跳动画开始");
        button.isSelected = !button.isSelected
        let k = CAKeyframeAnimation(keyPath: "transform.scale")
        k.values = [0.1, 1.0, 1.5]
        k.keyTimes = [0.0, 0.8, 1.0]
        k.calculationMode = kCAAnimationLinear
        button.layer.add(k, forKey: "SHOW")
    }
}
