//
//  NetworkingDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/29.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit
//import Alamofire

class NetworkingDemo: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "网络请求"
        // 1.不带参数，不带结果处理
//        Alamofire.request("https://httpbin.org/get")
        
        // 2.带参数，不带结果处理
//        Alamofire.request("http://m.htxq.net/servlet/UserBbsServlet?action=TopBbsAuthor").response { (response) in
//            
//            print("response = \(response)")
//        }
        
//        Alamofire.request("http://m.htxq.net/servlet/UserBbsServlet", parameters: ["action": "TopBbsAuthor"])
//            .responseJSON { response in
//                print(response.request)  // original URL request
//                print(response.response) // URL response
//                print(response.data)     // server data
//                print(response.result)   // result of response serialization
//                if let JSON = response.result.value {
//                    print("JSON: \(JSON)") //具体如何解析json内容可看下方“响应处理”部分
//                }
//        }
    }
}
