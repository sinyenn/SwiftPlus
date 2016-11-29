//
//  SPRandomUtil.swift
//  SwiftPlus
//
//  Created by Yenn on 2016/11/29.
//  Copyright © 2016年 Yenn. All rights reserved.
//

import UIKit


/// 随机数据工具类
class SPRandomUtil: NSObject {
    
    
    /// 随机范围Int
    ///
    /// - Parameters:
    ///   - lower: 最小数（包含）
    ///   - upper: 最大数（包含）
    /// - Returns: Int
    public static func randomInt(_ lower: Int, _ upper: Int) -> Int {
        let max = upper >= Int(UInt32.max) ? UInt32.max - 1 : UInt32(upper)
        let min = lower >= Int(UInt32.max) ? UInt32.max - 1 : UInt32(lower)
        return Int(min) + Int(arc4random_uniform(max - min + 1))
    }
    
    /// 随机Int
    ///
    /// - Parameter upper: 最大数（包含）
    /// - Returns: Int
    public static func randomInt(_ upper:Int = Int.max) -> Int{
        return randomInt(0, upper)
    }
    
    
    /// 随机范围Double
    ///
    /// - Parameters:
    ///   - lower: 最小数
    ///   - upper: 最大数
    /// - Returns: Double
    public static func randomDouble(_ lower: Double = 0, _ upper: Double = 1) -> Double {
        srand48(randomInt())
        return drand48() * (upper-lower) + lower
    }
    
    
    /// 随机Double
    ///
    /// - Parameter upper: 最大数
    /// - Returns: Double
    public static func randomDouble(_ upper: Double = 1) -> Double {
        return randomDouble(0, upper)
    }
    
    
    /// 随机范围Float
    ///
    /// - Parameters:
    ///   - lower: 最小数
    ///   - upper: 最大数
    /// - Returns: Float
    public static func randomFloat(_ lower: Float = 0, _ upper: Float = 1) -> Float {
        return Float(randomDouble(Double(lower), Double(upper)))
    }
    
    
    /// 随机Float
    ///
    /// - Parameter upper: 最大数
    /// - Returns: Float
    public static func randomFloat(_ upper: Float = 1) -> Float {
        return Float(randomDouble(Double(upper)))
    }

    
}
