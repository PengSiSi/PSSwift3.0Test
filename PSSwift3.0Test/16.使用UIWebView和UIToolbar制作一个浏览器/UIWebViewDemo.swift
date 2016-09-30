//
//  UIWebViewDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/28.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class UIWebViewDemo: UIViewController,UIWebViewDelegate,UITextFieldDelegate {
    
    let textField: UITextField = UITextField()
    let button: UIButton = UIButton()
    var webView: UIWebView = UIWebView()
    var activityIndicator: UIActivityIndicatorView?
    //进度条计时器
    var ptimer:Timer!
    //进度条控件
    var progBar:UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "使用UIWebView和UIToolbar制作一个浏览器"
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
        createSubViews()
        createActivityIndicator()
        setupBrowserToolbar()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // 失去第一响应
        textField.resignFirstResponder()
        print("url Changed!")
        let url = textField.text
        loadURL((url)!)
        return true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
        progBar.setProgress(0.0, animated: true)
        ptimer.fire()
        activityIndicator?.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        activityIndicator?.stopAnimating()
        progBar.setProgress(1.0, animated: true)
        ptimer.invalidate()
    }
}

extension UIWebViewDemo {
    
    func createSubViews() {
        textField.frame = CGRect(x: (k_ScreenWidth - 200) / 2, y: 70, width: 200, height: 30)
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.backgroundColor = UIColor.gray
        textField.delegate = self
        textField.text = "http://www.baidu.com"
        view.addSubview(textField)
        button.frame = CGRect(x: 130, y: 120, width: 50, height: 20)
        button.backgroundColor = UIColor.green
        button.setTitle("Go", for: .normal)
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        view.addSubview(button)
        webView.frame = CGRect(x: 0, y: 140, width: k_ScreenWidth, height: k_ScreenHeight - 64 - 30 - 50)
        webView.delegate = self
        view.addSubview(webView)
    }
    
    func buttonClick() {
        
        print("Go")
        // 收起输入面板
        textField.resignFirstResponder()
        let url = textField.text
        loadURL(url!)
    }
}

extension UIWebViewDemo {
    
    func createActivityIndicator() {
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator?.frame = CGRect(x: 20.0, y: 80.0, width: 32.0, height: 32.0)
        view.addSubview(activityIndicator!)
    }
}

 //构建浏览器工具条

extension UIWebViewDemo {
    
    func setupBrowserToolbar() {
        
        // 创建一个浏览器工具条，并设置它的大小和位置
        let browserToolBar = UIToolbar(frame: CGRect(x: 0, y: 20, width: k_ScreenWidth, height: 44))
//        browserToolBar.backgroundColor = UIColor.red
        view.addSubview(browserToolBar)
        //创建图片工具条
        let backButton = UIBarButtonItem(image: UIImage(named: "back.png")
            , style: .plain, target: self, action: #selector(backClick))
        //第一个分隔按钮
        let btngap1 =  UIBarButtonItem(barButtonSystemItem:.fixedSpace,
                                       target:nil,
                                       action:nil);
        // 创建前进按钮 UIBarButtonItem
        let btnforward = UIBarButtonItem(image:UIImage(named:"forward.png"),
                                         style:.plain, target:self, action:#selector(forwardClicked));
        
        // 第二个分隔按钮，创建一个可伸缩的UIBarButtonItem
        let btngap2 =  UIBarButtonItem(barButtonSystemItem:.fixedSpace,
                                       target:nil,
                                       action:nil);
        
        // 创建重新加载按钮 UIBarButtonItem
        let btnreload = UIBarButtonItem(image:UIImage(named:"reload.png"),
                                        style:.plain, target:self, action:#selector(reloadClicked));
        
        //第三个分隔按钮
        let btngap3 =  UIBarButtonItem(barButtonSystemItem:.fixedSpace,
                                       target:nil,
                                       action:nil);
        
        //创建加载停止按钮
        let btnstop = UIBarButtonItem(image:UIImage(named:"stop"),
                                      style:.plain, target:self, action:#selector(stopClicked));
        
        //第四个分隔按钮
        let btngap4 =  UIBarButtonItem(barButtonSystemItem:.fixedSpace,
                                       target:nil,
                                       action:nil);
        
        //创建进度工具条
        progBar = UIProgressView(frame: CGRect(x: 0, y: 70, width: 200, height: 20))
//        progBar.tintColor = UIColor.red
        progBar.progressViewStyle = .bar
        progBar.progress = 0
        view.addSubview(progBar)
        // 创建使用 UIView 的自定义的 UIBarButtonItem
        let btnprog =  UIBarButtonItem(customView:progBar)
        
        // 为工具条设置工具按钮
        browserToolBar.setItems( [backButton,btngap1, btnforward,btngap2,
                                  btnreload,btngap3, btnstop,btngap4, btnprog ], animated:true)
        //创建计时器对象
        ptimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(loadProgress), userInfo: nil, repeats: true)
        ptimer.invalidate()
    }
    
    // 返回
    func backClick() {
        
        webView.goBack()
    }
    
    // 前进
    func forwardClicked() {
       
        webView.goForward()
    }
    
    // 刷新
    func reloadClicked() {
        
        webView.reload()
    }
    
    // 停止
    func stopClicked() {
        
        webView.stopLoading()
    }
    
    // 加载
    func loadProgress() {
        
        // 判断进度
        if progBar.progress >= 1.0 {
            // 定时器停止
            ptimer.invalidate()
        }
        else{
            
            // 改变进度
            progBar.setProgress(progBar.progress + 0.02, animated: true)
        }
    }
}

// 在 UIWebView 加载指定 URL

extension UIWebViewDemo {
    
    func loadURL(_ urlstr: String) {
        
        let url = URL(string: urlstr)
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }
}
