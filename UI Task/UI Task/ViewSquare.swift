//
//  ViewSquare.swift
//  UI Task
//
//  Created by Alex Vorobiev on 12/25/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class ViewSquare: UIView {

    @IBOutlet var label: UILabel?
    
    func animation() {
        UIView.animate(withDuration: 3) {
            self.label?.frame.origin = CGPoint(x: 300, y: 45)
            //self.label?.transform = .init(scaleX: 1.5, y: 1.5)
        }
        
    }
    
    enum Position {
        case leftTop
        case rightTop
        case leftDown
        case rightDown
        
        var nextPoint: Position {
            switch self {
            case .leftDown:
                return .leftTop
            case .leftTop:
                return .rightTop
            case .rightTop:
                return .rightDown
            case .rightDown:
                return .leftDown
            }
        }
        
        var point: CGPoint {
            switch self {
            case .leftTop:
                return .init(x: 20, y: 45)
            case .rightTop:
                return .init(x: 300, y: 45)
            case .leftDown:
                return .init(x: 20, y: 750)
            case .rightDown:
                return .init(x: 300, y: 750)
            }
        }
    }
}
