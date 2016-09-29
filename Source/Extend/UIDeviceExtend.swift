//
//  UIDeviceExtend.swift
//  SwiftPlus
//
//  Created by Yenn on 2016/9/29.
//  Copyright © 2016年 Yenn. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    
    /// 设备型号ID
    var modelIdentifier: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let m = Mirror(reflecting: systemInfo.machine)
        var identifier = ""
        m.children.forEach { (child) in
            let v = Int("\(child.value)")
            if v != 0 {
                identifier += String(describing: UnicodeScalar(v!)!)
            }
        }
        return identifier
    }
    
    
    /// 设备型号名称
    var detailModelName: String {
        //More model list, see -> https://www.theiphonewiki.com/wiki/Models
        var dmn:String = modelIdentifier
        switch dmn {
        case "AppleTV2,1":
            dmn = "Apple TV 2G"
        case "AppleTV3,1", "AppleTV3,2":
            dmn = "Apple TV 3G"
        case "AppleTV5,3":
            dmn = "Apple TV 4G"
        case "Watch1,1", "Watch1,2":
            dmn = "Apple Watch"
        case "Watch2,6", "Watch2,7":
            dmn = "Apple Watch Series 1"
        case "Watch2,3", "Watch2,4":
            dmn = "Apple Watch Series 2"
        case "iPad1,1":
            dmn = "iPad"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":
            dmn = "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":
            dmn = "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":
            dmn = "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":
            dmn = "iPad Air"
        case "iPad5,3", "iPad5,4":
            dmn = "iPad Air 2"
        case "iPad6,7", "iPad6,8":
            dmn = "iPad Pro (12.9 inch)"
        case "iPad6,3", "iPad6,4":
            dmn = "iPad Pro (9.7 inch)"
        case "iPad2,5", "iPad2,6", "iPad2,7":
            dmn = "iPad mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":
            dmn = "iPad mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":
            dmn = "iPad mini 3"
        case "iPad5,1", "iPad5,2":
            dmn = "iPad mini 4"
        case "iPhone1,1":
            dmn = "iPhone"
        case "iPhone1,2":
            dmn = "iPhone 3G"
        case "iPhone2,1":
            dmn = "iPhone 3GS"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":
            dmn = "iPhone 4"
        case "iPhone4,1":
            dmn = "iPhone 4S"
        case "iPhone5,1", "iPhone5,2":
            dmn = "iPhone 5"
        case "iPhone5,3", "iPhone5,4":
            dmn = "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":
            dmn = "iPhone 5s"
        case "iPhone7,2":
            dmn = "iPhone 6"
        case "iPhone7,1":
            dmn = "iPhone 6 Plus"
        case "iPhone8,1":
            dmn = "iPhone 6s"
        case "iPhone8,2":
            dmn = "iPhone 6s Plus"
        case "iPhone8,4":
            dmn = "iPhone SE"
        case "iPhone9,1", "iPhone9,3":
            dmn = "iPhone 7"
        case "iPhone9,2", "iPhone9,4":
            dmn = "iPhone 7 Plus"
        case "iPod1,1":
            dmn = "iPod touch"
        case "iPod2,1":
            dmn = "iPod touch 2G"
        case "iPod3,1":
            dmn = "iPod touch 3G"
        case "iPod4,1":
            dmn = "iPod touch 4G"
        case "iPod5,1":
            dmn = "iPod touch 5G"
        case "iPod7,1":
            dmn = "iPod touch 6G"
        default:
            break
        }
        return dmn
    }
    
    
}
