//
//  IntExtend.swift
//  SwiftPlus
//
//  Created by Yenn on 2016/11/29.
//  Copyright © 2016年 Yenn. All rights reserved.
//

import UIKit

public extension Int {
    
    //===========随机数==============
    
    public static func random(_ lower: Int, _ upper: Int) -> Int {
        return SPRandomUtil.randomInt(lower, upper)
    }
    
    public static func random(_ upper:Int = Int.max) -> Int{
        return SPRandomUtil.randomInt(0, upper)
    }
    
}
