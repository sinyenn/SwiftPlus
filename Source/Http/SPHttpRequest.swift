//
//  SPHttpRequest.swift
//  SwiftPlus
//
//  Created by Yenn on 2016/9/23.
//  Copyright © 2016年 Yenn. All rights reserved.
//

import UIKit

/// Http请求
class SPHttpRequest: NSObject {
    
    private var request:URLRequest!
    private var url:URL!
    private var headerMap = [String : String]()
    private var parameterMap = [String : String]()
    private var httpMethod:String = "GET"
    
    init(urlStr:String) {
        self.url = URL(string: urlStr)!
    }
    
    init(url:URL) {
        self.url = url
    }
    
    public func getRequest() -> URLRequest {
        return self.request
    }
    
    public func getURL() -> URL {
        return self.url
    }
    
    public func post() -> SPHttpRequest {
        self.httpMethod = "POST"
        return self
    }
    
    public func get() -> SPHttpRequest {
        self.httpMethod = "GET"
        return self
    }
    
    public func addHeader(_ field:String,_ value:String) -> SPHttpRequest{
        self.headerMap[field] = value
        return self
    }
    
    public func addHeaders(_ headers:[String : String]) -> SPHttpRequest{
        for (k,v) in headers {
            self.headerMap[k] = v
        }
        return self
    }
    
    public func addCookie(_ name:String, _ value:String) -> SPHttpRequest {
        var cookieKVMap = [HTTPCookiePropertyKey:Any]()
        cookieKVMap[HTTPCookiePropertyKey.domain] = self.url.host!
        cookieKVMap[HTTPCookiePropertyKey.name] = name
        cookieKVMap[HTTPCookiePropertyKey.value] = value
        cookieKVMap[HTTPCookiePropertyKey.path] = "/"
        return addCookie(HTTPCookie(properties: cookieKVMap)!)
    }
    
    public func addCookies(cookiesMap:[String:String]) -> SPHttpRequest {
        for (name,value) in cookiesMap {
            addCookie(name, value)
        }
        return self
    }
    
    public func addCookie(_ cookie:HTTPCookie) -> SPHttpRequest{
        SPHCM.setCookie(self.url.host!, cookie)
        return self
    }
    
    public func addCookies(_ cookies:[HTTPCookie]) -> SPHttpRequest{
        SPHCM.setCookies(self.url.host!, cookies)
        return self
    }
    
    public func addParameter(_ field:String, _ value:String) -> SPHttpRequest{
        self.parameterMap[field] = value
        return self
    }
    
    public func addParameters(_ parameters:[String : String]) -> SPHttpRequest{
        for (k,v) in parameters {
            self.parameterMap[k] = v
        }
        return self
    }
    
    public func build() -> SPHttpRequest {
        self.request = URLRequest(url: self.url)
        if self.httpMethod == "GET" {
            var urlStr = url.absoluteString
            if urlStr.contains("?") {
                if urlStr.hasSuffix("?") || urlStr.hasSuffix("&") {
                    urlStr += SPHttpUtil.paramMapToQueryString(parameterMap)
                }else{
                    urlStr += "&" + SPHttpUtil.paramMapToQueryString(parameterMap)
                }
            }else{
                urlStr += "?" + SPHttpUtil.paramMapToQueryString(parameterMap)
            }
            self.url = URL(string:urlStr)!
            self.request = URLRequest(url: self.url)
        }else if self.httpMethod == "POST" {
            self.request.httpBody = SPHttpUtil.paramMapToQueryString(parameterMap).data(using: String.Encoding.utf8)
        }
        self.request.httpMethod = self.httpMethod
        for (k, v) in self.headerMap {
            self.request.setValue(v, forHTTPHeaderField: k)
        }
        
        var cookieStr = "";
        for cookie in SPHCM.getCookies(url.host!) {
            cookieStr += cookie.name + "=" + cookie.value + ";"
        }
        if cookieStr != "" {
            cookieStr.remove(at: cookieStr.index(before: cookieStr.endIndex))
            self.request.setValue(cookieStr, forHTTPHeaderField: "cookie")
        }
        return self
    }
    
}
