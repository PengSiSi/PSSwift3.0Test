//
//  SpaceSizeTool.swift
//  PSSwift3.0Test
//
//  Created by 思 彭 on 16/12/16.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class SpaceSizeTool: NSObject {

    // 单例
    static let shareInstance: SpaceSizeTool = {
        let tool = SpaceSizeTool()
        return tool
    }()
}

// MARK:- 获取磁盘空闲空间大小
extension SpaceSizeTool {
    
    func getDiskSpaceFreeSize() -> Int {
        
        guard let attrs = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()) else {
            return -1
        }
        guard let space = attrs.index(forKey: .systemFreeSize) else {
            return -1
        }
        guard let freeSpace = attrs.values[space] as? Int else {
            return -1
        }
        return freeSpace
    }
}

// MARK:- 获取空间大小对应的文字说明
extension SpaceSizeTool {
    
    func diskSpaceFreeSizeString(size: Int) -> String {
        
        let size: CGFloat = CGFloat(size)
        let sizeUnit: CGFloat  = 1024.0;
        if  size < sizeUnit { //B
            return String(format: "%1lDB", size)
        }else if size < sizeUnit * sizeUnit {
            return String(format: "%.1fKB", size / sizeUnit)
        }else if size < sizeUnit * sizeUnit * sizeUnit {   // MB
            return String(format: "%.1fMB", size / (sizeUnit * sizeUnit))
        } else{ // GB
            return String(format: "%.1fGB", size / (sizeUnit * sizeUnit * sizeUnit))
        }
    }
}
