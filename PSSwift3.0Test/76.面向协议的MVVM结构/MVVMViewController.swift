//
//  MVVMViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 2017/5/18.
//  Copyright © 2017年 思 彭. All rights reserved.

// 参考链接: https://news.realm.io/cn/news/doios-natasha-murashev-protocol-oriented-mvvm/

import UIKit

class MVVMViewController: BaseViewController {

    var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = self.view.bounds
        // 注册cell
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
}

extension MVVMViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.selectionStyle = .none
        let model = AccountModel()
        cell.configure(withDelegate: ModelViewModel(model: model))
        return cell
    }
}
