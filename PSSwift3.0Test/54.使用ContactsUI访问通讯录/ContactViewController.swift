//
//  ContactViewController.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 17/2/4.
//  Copyright © 2017年 思 彭. All rights reserved.

// 使用ContactsUI访问通讯录（通过图形界面选择联系人）

import UIKit
import ContactsUI

class ContactViewController: BaseViewController, CNContactPickerDelegate {

    var selectButton = UIButton()
    var multiSelectBtn = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "使用ContactsUI访问通讯录"
        selectButton.frame = CGRect(x: 50, y: 100, width: 150, height: 50)
        selectButton.backgroundColor = UIColor.green
        selectButton.setTitle("选择联系人--单选", for: .normal)
        selectButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        selectButton.setTitleColor(UIColor.white, for: .normal)
        selectButton.addTarget(self, action: #selector(selectPerson(_sender:)), for: .touchUpInside)
        self.view.addSubview(selectButton)
        
        multiSelectBtn.frame = CGRect(x: 50, y: 200, width: 150, height: 50)
        multiSelectBtn.backgroundColor = UIColor.green
        multiSelectBtn.setTitle("选择联系人--多选", for: .normal)
        multiSelectBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        multiSelectBtn.setTitleColor(UIColor.white, for: .normal)
        multiSelectBtn.addTarget(self, action: #selector(multiSelectPerson(_sender:)), for: .touchUpInside)
        self.view.addSubview(multiSelectBtn)

    }
    
    // 单选
    func selectPerson(_sender: AnyObject) {
        print("选择联系人")
        
        // 联系人选择控制器
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self
        // 添加可选项目的过滤条件
        contactPicker.predicateForEnablingContact = NSPredicate(format: "emailAddresses.@count > 0", argumentArray: nil)
        // 弹出控制器
        self.present(contactPicker, animated: true, completion: nil)
    }
    
    // 多选
    func multiSelectPerson(_sender: AnyObject) {
        
        //联系人选择控制器
        let contactPicker = CNContactPickerViewController()
        //设置代理
        contactPicker.delegate = self
        //添加可选项目的过滤条件
        contactPicker.predicateForEnablingContact
            = NSPredicate(format: "emailAddresses.@count > 0", argumentArray: nil)
        //弹出控制器
        self.present(contactPicker, animated: true, completion: nil)
    }
    
    /*
    // 单选联系人
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        
        // 获取联系人的姓名
        let lastName = contact.familyName
        let firstName = contact.givenName
        print("选中人的姓：\(lastName)")
        print("选中人的名：\(firstName)")
        
        // 获取联系人电话号码
        print("选中人电话:")
        let phones = contact.phoneNumbers
        for phone in phones {
            
        //获得标签名（转为能看得懂的本地标签名，比如work、home）
        let phonelabel = CNLabeledValue<NSString>.localizedString(forLabel: phone.label!)
        // 获取号码
        let phoneValue = phone.value.stringValue
        print("\(phonelabel): \(phoneValue)")
        }
    }
    
 */
    
    //多选联系人
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        print("一共选择了\(contacts.count)个联系人。")
        for contact in contacts {
            print("--------------")
            //获取联系人的姓名
            let lastName = contact.familyName
            let firstName = contact.givenName
            print("选中人的姓：\(lastName)")
            print("选中人的名：\(firstName)")
            
            //获取联系人电话号码
            print("选中人电话：")
            let phones = contact.phoneNumbers
            for phone in phones {
                //获得标签名（转为能看得懂的本地标签名，比如work、home）
                let phoneLabel = CNLabeledValue<NSString>.localizedString(forLabel: phone.label!)
                //获取号码
                let phoneValue = phone.value.stringValue
                print("\(phoneLabel):\(phoneValue)")
            }
        }
    }
}
