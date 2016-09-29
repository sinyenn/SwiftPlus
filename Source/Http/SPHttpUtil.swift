//
//  SPHttpUtil.swift
//  SwiftPlus
//
//  Created by Yenn on 2016/9/23.
//  Copyright © 2016年 Yenn. All rights reserved.
//

import UIKit

/// Http工具类
class SPHttpUtil: NSObject {
    
    /// 将字典转换为URL查询字符串
    ///
    /// - parameter paramMap: 参数字典
    /// - parameter isEncode: 是否需要URLEncode，default true
    ///
    /// - returns: 查询字符串
    public static func paramMapToQueryString(_ paramMap:[String:Any]?, _ isEncode:Bool = true) -> String {
        var queryStr = ""
        if let map = paramMap {
            for (k,v) in map {
                queryStr += "\(k)=\(v)&"
            }
            queryStr.remove(at: queryStr.index(before: queryStr.endIndex))
            if isEncode {
                queryStr = queryStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
            }
        }
        return queryStr
    }

}
