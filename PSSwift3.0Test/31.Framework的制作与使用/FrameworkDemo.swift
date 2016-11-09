//
//  FrameworkDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/11/9.
//  Copyright © 2016年 思 彭. All rights reserved.
// 学习链接 : http://www.hangge.com/blog/cache/detail_1425.html


/*
 1.创建项目
 2.生成framework库文件
 生成的 framework 文件是分为模拟器使用和真机使用这两种。
 发布编译目标选择“Generic iOS Device”后，使用快捷键 command+B 或者点击菜单 Product > Build 进行编译。这时生成的是真机调试使用的 framework。
 3.如果发布编译目标选择的是模拟器，那么编译出来的模拟器使用的 framework。
 4.编译后右键点击项目中生成的 framework，选择“Show in Finder”，即可打开 framework 所在的文件夹。
 5.访问上级文件夹，可以看到两种类型的 framework 分别放在两个不同的文件夹下。
 6.导入sdk,import导入使用即可
 */

import UIKit

// 导入SDK
import PSSdk

class FrameworkDemo: BaseViewController {

    var imgView: UIImageView?
    var button1: UIButton?
    var button2: UIButton?
    // 原图
    var defaultImage = UIImage(named: "img1.jpg")

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Framework的使用和Extension的使用"
        
        // 图片
        self.imgView = UIImageView(frame: CGRect(x: 60, y: 100, width: 300, height: 200))
        self.imgView?.image = defaultImage
        self.view .addSubview(self.imgView!)
        // 按钮1
        self.button1 = UIButton(frame: CGRect(x: 100, y: 340, width: 70, height: 40))
        self.button1?.setTitle("像素化滤镜", for: .normal)
        self.button1?.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        self.button1?.tag = 1;
        self.button1?.backgroundColor = UIColor.red
        self.button1?.addTarget(self, action: #selector(buttonDidClick(_button:)), for: .touchUpInside)
        self.view .addSubview(self.button1!)
        // 按钮2
        self.button2 = UIButton(frame: CGRect(x: 180, y: 340, width: 100, height: 40))
        self.button2?.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        self.button2?.setTitle("高斯模糊滤镜", for: .normal)
        self.button2?.tag = 2;
        self.button2?.addTarget(self, action: #selector(buttonDidClick(_button:)), for: .touchUpInside)
        self.button2?.backgroundColor = UIColor.red
        self.view .addSubview(self.button2!)
    }

    // 按钮被点击
    func buttonDidClick(_button: UIButton) {
        let tag = _button.tag
        if tag == 1 {
            imgView?.image = defaultImage?.pixellated()
        }
        if tag == 2 {
            imgView?.image = defaultImage?.blured()
        }
    }
}
