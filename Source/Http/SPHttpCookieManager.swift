//
//  SPHttpCookieManager.swift
//  SwiftPlus
//
//  Created by Yenn on 2016/9/24.
//  Copyright © 2016年 Yenn. All rights reserved.
//

import UIKit

/// Cookie管理类
class SPHttpCookieManager: NSObject {
    
    /// 全局cookieMap，格式[Host:[Key:HTTPCookie]]
    private static var cookieMap = [String:[String:HTTPCookie]]()
    
    public static func setCookie(_ host:String, _ cookie:HTTPCookie){
        if cookieMap[host] == nil {
            cookieMap[host] = [String:HTTPCookie]()
        }
        cookieMap[host]?[cookie.name] = cookie
    }
    
    public static func setCookies(_ host:String, _ cookies:[HTTPCookie]){
        for cookie in cookies {
            setCookie(host, cookie)
        }
    }
    
    public static func getCookie(_ host:String, _ name:String) -> HTTPCookie? {
        if let ckMap = cookieMap[host] {
            if let cookie = ckMap[name]{
                return cookie
            }
        }
        return nil
    }
    
    public static func getCookies(_ host:String) -> [HTTPCookie] {
        var cookies = [HTTPCookie]()
        if let ckMap = cookieMap[host] {
            for (_, cookie) in ckMap {
                cookies.append(cookie)
            }
        }
        return cookies
    }

}

typealias SPHCM = SPHttpCookieManager
