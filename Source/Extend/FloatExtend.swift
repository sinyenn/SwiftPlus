//
//  FloatExtend.swift
//  SwiftPlus
//
//  Created by Yenn on 2016/11/29.
//  Copyright © 2016年 Yenn. All rights reserved.
//

import UIKit

public extension Float {
    
    //===========随机数==============
    
    public static func random(_ lower: Float, _ upper: Float) -> Float {
        return SPRandomUtil.randomFloat(lower, upper)
    }
    
    public static func random(_ upper:Float = 1) -> Float{
        return SPRandomUtil.randomFloat(0, upper)
    }
    
}
