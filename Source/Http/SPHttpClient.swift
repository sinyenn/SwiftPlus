//
//  SPHttpClient.swift
//  SwiftPlus
//
//  Created by Yenn on 2016/9/23.
//  Copyright © 2016年 Yenn. All rights reserved.
//

import UIKit

/// Http客户端，客户端内会话共享
class SPHttpClient: NSObject {
    
    private var configuration:URLSessionConfiguration!
    private var session:URLSession!
    
    init(configuration:URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }
    
    init(configHandle:() -> URLSessionConfiguration) {
        session = URLSession(configuration: configHandle())
    }
    
    /// 执行普通请求(GET,POST)
    ///
    /// - parameter request: SPHttpRequest
    /// - parameter handle:  处理方法
    public func exec(_ request: SPHttpRequest, _ handle:@escaping SPResponseHandle){
        session.dataTask(with: request.getRequest()) { (data, respone, error) in
            //将服务器返回的cookies保存起来
            let cookies = HTTPCookieStorage.shared.cookies!
            let host = request.getURL().host!
            for c in cookies {
                if c.domain == host {
                    SPHttpCookieManager.setCookie(host, c)
                }
            }
            //回调处理方法
            let resp = respone as? HTTPURLResponse
            handle(data, resp, error)
        }.resume()
    }

}

typealias SPResponseHandle = (_ data:Data?, _ resp:HTTPURLResponse?, _ error:Error?) -> Void
