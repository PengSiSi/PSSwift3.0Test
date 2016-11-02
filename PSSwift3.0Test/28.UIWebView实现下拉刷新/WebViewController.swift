//
//  WebViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/11/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit
import MJRefresh

class WebViewController: BaseViewController,UIWebViewDelegate {

    var webView: UIWebView?
    
    // 顶部刷新
    let header  = MJRefreshNormalHeader()
    
    // 视图一出现即开始刷新
    override func viewWillAppear(_ animated: Bool) {
        
        header.beginRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWebView()
    }
    
    // 创建webView
    func setWebView() {
        
       self.webView = UIWebView(frame: CGRect(x: 0, y: 0, width: k_ScreenWidth, height: k_ScreenHeight))
        self.webView?.delegate = self
        self.webView?.scalesPageToFit = true
        self.view.addSubview(self.webView!)
        
        // 加载页面
        let request = URLRequest(url: URL(string: "http://hangge.com")!)
        self.webView?.loadRequest(request)
        
        // 下拉刷新的设置
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        self.webView?.scrollView.mj_header = header
    }
    
    // 下拉刷新
    func headerRefresh() {
        
        print("开始下拉刷新")
        // 模拟网络
        sleep(2)
        self.webView?.reload()
        self.webView?.scrollView.mj_header.endRefreshing()
    }
}
