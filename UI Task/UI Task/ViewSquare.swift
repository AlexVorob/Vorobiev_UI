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
    
    private var isRunning = false
    private var isStop = false
    private var squarePosition = Position.leftTop
    
    enum Position {
        case leftTop
        case rightTop
        case leftDown
        case rightDown
        
        var nextPoint: Position {
            switch self {
            case .leftDown: return .leftTop
            case .leftTop: return .rightTop
            case .rightTop: return .rightDown
            case .rightDown: return .leftDown
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
    
    func setSquarePosition() {
        let next = self.squarePosition.nextPoint
        self.label?.frame.origin = next.point
    }
    
    func stop() {
        self.isStop = true
    }
    
    func run() {
        self.isStop = false
        if !self.isRunning {
            self.isRunning = true
            UIView.animate(withDuration: 3,
                           animations: { self.setSquarePosition() },
                           completion: { stateCompletion in
                            self.isRunning = false
                            if !self.isStop {
                                self.run()
                            }
            })
        }
//        {
//            self.squarePosition = self.squarePosition.nextPoint
//            self.label?.frame.origin = self.squarePosition.point
//        }
    }
}
