//
//  PSPickView.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/12/15.
//  Copyright © 2016年 思 彭. All rights reserved.

// 省市互动的PickView

import UIKit

class PSPickView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var provinceArr: NSArray = []
    var cityArr: NSArray = []
    var areaArr: NSArray = []
    var provinceStr = ""
    var areaStr = ""
    var cityStr = ""
    var selectArr:NSArray = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        getData()
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getData() {
        
        let path = Bundle.main.path(forResource: "area", ofType: "plist")
        let dataArray = NSArray(contentsOfFile: path!)
        for (_, value) in (dataArray?.enumerated())! {
            
            let tempArr = NSMutableArray(array: provinceArr)
            let dic = value as! NSDictionary
            let state = dic.value(forKey: "state")
            guard  let str = state else {
                return
            }
            tempArr.add(str)
            // 省
            provinceArr = tempArr
        }
        
        // 市
        for (_, value) in (dataArray?.enumerated())! {
            
            let dic = value as! NSDictionary
            let citiesArray: NSArray = dic.value(forKey: "cities") as! NSArray
            for cities in citiesArray {
               
//                let cities = cities as! NSDictionary
//                var tempCityArr = NSMutableArray(array: cityArr)
//                let city = dic.value(forKey: "city")
//                guard  let str = city else {
//                    return
//                }
//                tempCityArr.add(str)
//                // 省
//                cityArr = tempCityArr
//
            }
        }
        
        let cityDict = dataArray?.firstObject as! NSDictionary
        var cityArr = cityDict.value(forKey: "cities") as! NSArray
        let tempCitysArr = NSMutableArray.init(array: cityArr)
        for (_, value) in tempCitysArr.enumerated() {
            let temp = NSMutableArray.init(array: cityArr)
            let dict = value as! NSDictionary
            temp.add(dict.value(forKey: "city") ?? "")
            cityArr = temp
        }
        let areaDict = tempCitysArr.firstObject as! NSDictionary
        let areaArray = areaDict.value(forKey: "areas") as! NSArray
        areaArr = NSMutableArray.init(array: areaArray)
        
        provinceStr = provinceArr.firstObject as! String
//        cityStr = cityArr.firstObject as! String ?? ""
        areaStr = ((areaArr.count == 0) ? "" : areaArr.firstObject as! String)
    }
    
    // MARK: UIPickViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return provinceArr.count
        }
        else if component == 1 {
            return cityArr.count
        }
        else {
            return areaArr.count
        }
    }
    
    // MARK: UIPickViewDelegate
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let path = Bundle.main.path(forResource: "area", ofType: "plist")
        let provinceArray = NSArray.init(contentsOfFile: path!)!
        if component == 0 {
            let tempDict = provinceArray[row] as! NSDictionary
            selectArr = tempDict.value(forKey: "cities") as! NSArray
            let tempArr = NSMutableArray.init(array: cityArr)
            tempArr.removeAllObjects()
            cityArr = tempArr
            for (_, value) in selectArr.enumerated() {
                let temp = NSMutableArray.init(array: cityArr)
                let dict = value as! NSDictionary
                temp.add(dict.value(forKey: "city"))
                cityArr = temp
            }
            let areaDict = selectArr.firstObject as! NSDictionary
            areaArr = areaDict.value(forKey: "areas") as! NSArray
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: true)
            pickerView.reloadComponent(2)
            pickerView.selectRow(0, inComponent: 2, animated: true)
        }else if component == 1{
            if selectArr.count == 0 {
                selectArr = (provinceArray.firstObject as! NSDictionary).value(forKey: "cities") as! NSArray
            }
            
            areaArr = NSMutableArray.init(array: (selectArr[row] as! NSDictionary).value(forKey: "areas") as! NSArray)
            pickerView.reloadComponent(2)
            pickerView.selectRow(0, inComponent: 2, animated: true)
        }
        let provinceNum = pickerView.selectedRow(inComponent: 0)
        let cityNum = pickerView.selectedRow(inComponent: 1)
        let areaNum = pickerView.selectedRow(inComponent: 2)
        
        provinceStr = provinceArr[provinceNum] as! String
        cityStr = cityArr[cityNum] as! String
        if areaArr.count == 0 {
            areaStr = ""
        }else{
            areaStr = areaArr[areaNum] as! String
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        if component == 0 {
            label.text = provinceArr[row] as? String
        }else if component == 1 {
            label.text = cityArr[row] as? String
        }
        else {
            if  areaArr.count == 0 {
                label.text = ""
            }else {
                label.text = areaArr[row] as? String
            }
        }
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }
}
