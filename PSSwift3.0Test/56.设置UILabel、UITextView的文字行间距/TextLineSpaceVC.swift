//
//  TextLineSpaceVC.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 17/3/1.
//  Copyright © 2017年 思 彭. All rights reserved.
//

import UIKit

class TextLineSpaceVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - label设置行间距
        
        // 需要调整 label 或 textView 的文本行间距大小，但这两个组件都没有相关属性可以直接设置。这个就需要借助富文本（NSAttributedString）来实现
        let label = UILabel(frame: CGRect(x: 20, y: 100, width: 300, height: 100))
        label.numberOfLines = 0
        let str = "需要调整 label 或 textView 的文本行间距大小，但这两个组件都没有相关属性可以直接设置。这个就需要借助富文本（NSAttributedString）来实现"
        //通过富文本来设置行间距
        let paraph = NSMutableParagraphStyle()
        paraph.lineSpacing = 28
        let attribute = [NSForegroundColorAttributeName : UIColor.red,
                         NSFontAttributeName: UIFont.systemFont(ofSize: 17),
                         NSParagraphStyleAttributeName: paraph]
        label.attributedText = NSAttributedString(string: str, attributes: attribute)
        view.addSubview(label)
        
        // MARK: - textView在不能编辑下设置行间距和以上label设置一致
        
        // MARK: - textView在编辑下设置行间距,在输入内容的时候就按照设置的行间距进行动态改变，那就需要将相关代码放到 textview 的 delegate 方法里
        let textView = UITextView(frame: CGRect(x: 20, y: 300, width: 250, height: 100))
        textView.backgroundColor = UIColor.lightGray
        textView.delegate = self
        view.addSubview(textView)
        
    }
}

// MARK: - UITextViewDelegate

extension TextLineSpaceVC: UITextViewDelegate {
 
    // textView已经被改变
    func textViewDidChange(_ textView: UITextView) {
        let text = textView.text
        // 富文本设置行间距
        let praph = NSMutableParagraphStyle()
        praph.lineSpacing = 40
        let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15),
                         NSParagraphStyleAttributeName: praph]
        let attributeString = NSMutableAttributedString(string: text!, attributes: attributes)
        textView.attributedText = attributeString
    }
}
