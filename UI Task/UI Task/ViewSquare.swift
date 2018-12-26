//
//  ViewSquare.swift
//  UI Task
//
//  Created by Alex Vorobiev on 12/25/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class ViewSquare: UIView {

    @IBOutlet var label: UILabel!
    
    private var isRunning = false
    private var isAnimated = true
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
    
//    func setSquarePosition() {
//        self.setSquarePosition(position: self.squarePosition)
//    }
    
    func setSquarePosition(position: Position) {
        self.setSquarePosition(animated: false, nextPosition: position)
    }
    
    
    func setSquarePosition(animated: Bool, nextPosition: Position) {
        self.setSquarePosition(position: nextPosition, animated: animated, completionHandler: nil)
    }
    
    func setSquarePosition(position: Position, animated: Bool, completionHandler: ((Bool) -> ())?) {
        if !self.isRunning {
            self.isRunning = true
            UIView.setAnimationsEnabled(animated)
            UIView.animate(
                withDuration: 3,
                animations: { self.label.frame.origin = position.point },
                completion: { _ in
                    self.isRunning = false
                    self.squarePosition = self.squarePosition.nextPoint
                    completionHandler?(animated)
            })
        }
    }
    
    func stop() {
        self.isAnimated = false
    }
    
    func startRunning() {
        self.isAnimated = true
        if self.isAnimated {
            self.setSquarePosition(position: self.squarePosition, animated: true) { animated in
                self.startRunning()
            }
        }
        
        
        
//        if !self.isRunning {
//            self.isRunning = true
//            UIView.animate(
//                withDuration: 3,
//                animations: { self.setSquarePosition() },
//                completion: { stateCompletion in
//                self.isRunning = false
//                if !self.isAnimated {
//                    self.run()
//                }
//            })
//        }
    }
}
