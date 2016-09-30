//
//  ScrollViewDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/25.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit


class ScrollViewDemo: UIViewController {

    // 创建scrollView
    var scrollView = UIScrollView()
    
    // 创建view
    var subView1: ScrollViewDemo1?
    var subView2: ScrollViewDemo2?
    var subView3: ScrollViewDemo1?

       override func viewDidLoad() {
        super.viewDidLoad()
        title = "scrollView简单用法"
        setupScrollView()
        layoutScrollView()
        setSubViews()
    }
 }

// MARK: - 设置scrollView

extension ScrollViewDemo{
    
    // 初始化scrollview
    func setupScrollView() {
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = UIColor.red
        view.addSubview(scrollView)
    }
    // scrollview的布局
    func layoutScrollView() {
        scrollView.frame = CGRect(x: 0, y: 0, width: k_ScreenWidth, height: k_ScreenHeight)
        scrollView.contentSize = CGSize(width: k_ScreenWidth * 3, height: k_ScreenHeight)
    }
}

extension ScrollViewDemo{
    
    func setSubViews(){
        
        subView1 = ScrollViewDemo1(frame: CGRect(x: 0.0, y: 0.0, width: k_ScreenWidth, height: 100), text: "今天是9月25日哟!!!");
        subView1?.backgroundColor = UIColor.red
        subView2 = ScrollViewDemo2(frame: CGRect(x: 1 * k_ScreenWidth, y: 0, width: k_ScreenWidth, height: k_ScreenHeight))
        subView3 = ScrollViewDemo1(frame: CGRect(x: 2 * k_ScreenWidth, y: 0.0, width: 300, height: 100), text: "开心开心!!!");
        subView3?.backgroundColor = UIColor.orange
        scrollView.addSubview(subView1!)
        scrollView.addSubview(subView2!)
        scrollView.addSubview(subView3!)
        
        // block点击事件
        subView2?.rowActionBlock = {
            (tableView,indexPath,dataArray) -> Void in
            
            // 弹出视图
            let alertVc = UIAlertController(title: "亲爱思思,今天开心么?", message: "知道你很开心啦!!", preferredStyle: .alert)
            let cancleAction = UIAlertAction(title: "取消", style: .cancel, handler: { (cancle) in
                print("取消")
            })
            let okAction = UIAlertAction(title: "OK", style: .destructive, handler: { (ok) in
                print("ok!")
            })
            alertVc.addAction(cancleAction)
            alertVc.addAction(okAction)
            self.present(alertVc, animated: true, completion: { 
                print("控制器弹出来了啦!!!")
            })
        }
    }
}
