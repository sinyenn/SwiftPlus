//
//  ViewController.swift
//  SwiftPlus
//
//  Created by Yenn on 2016/9/23.
//  Copyright © 2016年 Yenn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        testExtend()
//        testHttp()
    }
    
    func testExtend() {
        print(#function, "↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓")
        print("=========UIDevice============")
        print("modelIdentifier -> \(UIDevice.current.modelIdentifier)")
        print("detailModelName -> \(UIDevice.current.detailModelName)")
        print("=========random============")
        print(Int.random())
        print(Double.random())
        print(Float.random())
    }
    
    func testHttp() {
        print(#function, "↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓")
        let client = SPHttpClient(configuration: URLSessionConfiguration.default)
        var req = SPHttpRequest(urlStr: "https://httpbin.org/get").get().addHeader("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36").addParameter("name", "yenn").build()
        client.exec(req) { (data, resp, error) in
            print("----GET----")
            print(String(data: data!, encoding: String.Encoding.utf8)!)
            req = SPHttpRequest(urlStr: "http://httpbin.org/post").post().addHeader("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36").addParameter("name", "yenn").build()
            client.exec(req) { (data, resp, error) in
                print("----POST----")
                print(String(data: data!, encoding: String.Encoding.utf8)!)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


