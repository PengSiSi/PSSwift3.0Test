//
//  CollectionViewDemo.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/9/26.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class CollectionViewDemo: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView?
    let colectionCellID: String =  "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UICollectionView基本使用"
        view.backgroundColor = UIColor.white
        createCollectionView()
        registerCell()
    }
    
    // UICollectionView DataSource
    
    // 组数
    open func numberOfSections(in collectionView: UICollectionView) -> Int{
        
        return 1;
    }
    
    // item个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 20
    }
    
    // 创建cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: colectionCellID, for: indexPath)
        cell.backgroundColor = UIColor.green
        return cell
    }
    
    // UICollectionView Delegate
    
    // item的Size
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (k_ScreenWidth - 30) / 2, height: 200)
    }
    
    // collectionViewCell的点击
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("你点击了第\(indexPath.section)的第\(indexPath.item)个Iten")
    }
    
    // UICollectionViewDelegateFlowLayout
    
    // Item的上左下右的间距
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

// 设置界面

extension CollectionViewDemo{
    
    func createCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (k_ScreenWidth - 30) / 2, height: (k_ScreenWidth - 30) / 2)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionView?.backgroundColor = UIColor.white
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: k_ScreenWidth, height: k_ScreenHeight), collectionViewLayout: layout);
        collectionView?.dataSource = self
        collectionView?.delegate = self
        self.view.addSubview(collectionView!)
    }
    
    // 注册cell
    
    func registerCell() {
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: colectionCellID)
    }
}
