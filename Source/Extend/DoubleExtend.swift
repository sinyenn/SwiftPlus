//
//  DoubleExtend.swift
//  SwiftPlus
//
//  Created by Yenn on 2016/11/29.
//  Copyright © 2016年 Yenn. All rights reserved.
//

import UIKit

public extension Double {
    
    //===========随机数==============
    
    public static func random(_ lower: Double, _ upper: Double) -> Double {
        return SPRandomUtil.randomDouble(lower, upper)
    }
    
    public static func random(_ upper:Double = 1) -> Double{
        return SPRandomUtil.randomDouble(0, upper)
    }
    
}
