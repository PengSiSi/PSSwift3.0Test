//
//  GCDDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/28.
//  Copyright © 2016年 思 彭. All rights reserved.

// 下载图片的demo不成功

/*
 总结:
 1.串行队列异步执行会开一条线程。由于是异步执行，代码执行不会阻塞当前线程。after 打印的位置就会不固定。
 2.串行队列同步执行不会开线程。由于是同步执行，代码执行会阻塞当前线程。 after 的打印是固定在最后的。
 3.并发队列异步执行会开线程，且线程的条数不固定。代码异步执行是不会阻塞当前线程。after打印会在任意位置。（关于多次执行 after 一直在最后的问题，请将循环的次数改为100试试）
 4.并发队列同步执行不会开线程。 代码同步执行会阻塞当前线程。 after 会一直保持在最后面。
 */

import UIKit

class GCDDemo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GCD的使用"
        view.backgroundColor = UIColor.white
        /* 1.
        /* 输出:
         before:<NSThread: 0x600000065c80>{number = 1, name = main}
         after<NSThread: 0x600000065c80>{number = 1, name = main}
         task<NSThread: 0x600000260580>{number = 3, name = (null)}
         task<NSThread: 0x600000065c80>{number = 1, name = main}
         
         */
        print("before:\(Thread.current)")
        // 获得全局队列,异步
        DispatchQueue.global().async {
            
            print("task" + "\(Thread.current)")
            // 主线程异步执行（主线程同步可能会死锁）
            DispatchQueue.main.async {
                print("task" + "\(Thread.current)")
            }
        }
        print("after:" + "\(Thread.current)")
 
        
        // 2. 主队列：默认就是串行队列  全局队列：默认就是并发队列
        // 自己创建的队列
        let queue = DispatchQueue(label: "queue1")
        for _ in 1...10 {
            // 异步执行0次  输出同一线程
            queue.async {
                print("task" + "\(Thread.current)")
            }
        }
        
        // 全局队列
        let globQ = DispatchQueue.global()
        
        for _ in 1...10 {
            // 异步执行 10 次  输出在不同的线程
            globQ.async(execute: {
//                print("globQ - task" + "\(Thread.current)")
            })
        }
   */
    // 3.GCD 的 实际运用 下载图片
        let imgView: UIImageView = UIImageView(frame: CGRect(x: 50, y: 70, width: 200, height: 200))
        imgView.backgroundColor = UIColor.green
        view.addSubview(imgView)
       
        // 子线程下载数据
        DispatchQueue.global().async {
            let url = URL(string: "http://img1.imgtn.bdimg.com/it/u=3611450414,2684460387&fm=21&gp=0.jpg")
//            let data: Data?
//            
//            do {
//                data = try? Data(contentsOf: url!)
//            } catch {
//                print("网络下载数据失败!")
//                return
//            }
            let data = try? Data(contentsOf: url!)
            if data == nil{
                
                print("data为nil")
                return
            }
            let image = UIImage(data: data!)
            
            // 主线程刷新UI
            DispatchQueue.main.async(execute: {
                imgView.image = image
            })
        }
    }
}
