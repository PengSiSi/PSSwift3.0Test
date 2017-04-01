//
//  JumpSettingVC.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 17/3/3.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

// 导入框架
import Photos

class JumpSettingVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = isAuthorize()
    }
    
    // MARK: - 判断权限
    func isAuthorize() -> Bool {
        
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            return true
        case .notDetermined:
            // 请求授权
            PHPhotoLibrary.requestAuthorization({ (status) -> Void in
                DispatchQueue.main.async(execute: { () -> Void in
                    _ = self.isAuthorize()
                })
            })
        default:()
        DispatchQueue.main.async(execute: { 
            
            // 弹出视图提醒
            let alertController = UIAlertController(title: "照片访问受限", message: "点击“设置”，允许访问您的照片", preferredStyle: .alert)
            let cancleAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            let settingAction = UIAlertAction(title: "设置", style: .default, handler: { (action ) in
                let url = URL(string: UIApplicationOpenSettingsURLString)
                if let url = url, UIApplication.shared.canOpenURL(url) {
                    if #available(iOS 10, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                            
                        })
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
            })
            alertController.addAction(cancleAction)
            alertController.addAction(settingAction)
            self.present(alertController, animated: true, completion: nil)
        })
        }
        return false
    }
}
