//
//  SPConvertUtil.swift
//  SwiftPlus
//
//  Created by Yenn on 2016/9/23.
//  Copyright © 2016年 Yenn. All rights reserved.
//

import UIKit

/// 转换工具类
class SPConvertUtil: NSObject {
    
    
    /// Any to JSONString
    ///
    /// - parameter obj: Any
    ///
    /// - returns: JSONString
    public static func objectToJsonString(_ obj:Any) -> String?{
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: obj, options: JSONSerialization.WritingOptions.prettyPrinted)
            return String(data: jsonData, encoding: String.Encoding.utf8)!
        }catch let error{
            print(error)
        }
        return nil
    }

}
