//
//  CGRect+Extensions.swift
//  UI Task
//
//  Created by Alex Vorobiev on 12/28/18.
//  Copyright © 2018 Student. All rights reserved.
//

import CoreGraphics

extension CGRect {
    
    enum Position {
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
    }
    
    var topLeft: CGPoint {
        return CGPoint(x: self.minX, y: self.minY)
    }
    
    var topRight: CGPoint {
        return CGPoint(x: self.maxX, y: self.minY)
    }
    
    var bottomRight: CGPoint {
        return CGPoint(x: self.maxX, y: self.maxY)
    }
    
    var bottomLeft: CGPoint {
        return CGPoint(x: self.minX, y: self.maxY)
    }
    
    var leftCenter: CGPoint {
        return CGPoint(x: self.minX, y: self.midY)
    }
    
    var rightCenter: CGPoint {
        return CGPoint(x: self.maxX, y: self.midY)
    }
    
    var center: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
    
    var topCenter: CGPoint {
        return CGPoint(x: self.midX, y: self.minY)
    }
    
    var bottomCenter: CGPoint {
        return CGPoint(x: self.midX, y: self.maxY)
    }
}
