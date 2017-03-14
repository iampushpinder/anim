//
//  Math.swift
//  anim
//
//  Created by Onur Ersel on 2017-02-21.
//  Copyright (c) 2017 Onur Ersel. All rights reserved.

import UIKit

struct DoubleRange {
    var min: Double
    var max: Double
    
    static var random01: Double {
        let max: UInt32 = 10000
        return Double(arc4random_uniform(max)) / Double(max)
    }
    
    var random: Double {
        let diff = max - min
        return min + diff * DoubleRange.random01
    }
    
}

extension Double {
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
}

extension CGFloat {
    var radian: CGFloat {
        return CGFloat.pi * self / 180.0
    }
    
    var randomPointWithRadius: CGPoint {
        let theta = CGFloat(arc4random_uniform(UInt32.max))/CGFloat(UInt32.max-1) * CGFloat.pi * 2.0
        let x = self * cos(theta)
        let y = self * sin(theta)
        return CGPoint(x: CGFloat(x),y: CGFloat(y))
    }
    
    func randomize(range: CGFloat) -> CGFloat {
        return self - range * 0.5 + range * DoubleRange.random01.cgFloat
    }
}

extension Int {
    var randomTill: Int {
        return Int( floor(DoubleRange.random01 * (Double(self)-0.00001)) )
    }
}

extension CGPoint {
    static func + (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x + right.x, y: left.y + right.y)
    }
    
    static func - (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x - right.x, y: left.y - right.y)
    }
    
    static func * (left: CGPoint, right: CGFloat) -> CGPoint {
        return CGPoint(x: left.x * right, y: left.y * right)
    }
    
    static func lerp(current: CGPoint, target: CGPoint, t: CGFloat) -> CGPoint {
        return current + ((target - current) * t)
    }
}
