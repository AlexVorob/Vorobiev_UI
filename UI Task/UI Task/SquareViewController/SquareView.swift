//
//  SquareView.swift
//  UI Task
//
//  Created by Alex Vorobiev on 12/25/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class SquareView: UIView {

    @IBOutlet var label: UILabel!
    
    private var isRunning = false
    private var isAnimating = false
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
    }
    
    private func point(position: Position) -> CGPoint {
        let screenBounds = UIScreen.main.bounds
        let labelBounds = self.label.bounds
        
        switch position {
        case .leftTop:
            return .init(x: screenBounds.minX, y: screenBounds.minY)
        case .rightTop:
            return .init(x: screenBounds.maxX - labelBounds.width, y: screenBounds.minY)
        case .leftDown:
            return .init(x: screenBounds.minX, y: screenBounds.maxY - labelBounds.height)
        case .rightDown:
            return .init(x: screenBounds.maxX - labelBounds.width, y: screenBounds.maxY - labelBounds.height)
        }
    }
    
    func setSquarePosition(position: Position) {
        self.setSquarePosition(animated: false, nextPosition: position)
    }
    
    func setSquarePosition(animated: Bool, nextPosition: Position) {
        self.setSquarePosition(position: nextPosition, animated: animated, completionHandler: nil)
    }
    
    private func setSquarePosition(position: Position, animated: Bool, completionHandler: ((Bool) -> ())?) {
        if !self.isRunning {
            self.isRunning = true
            
            UIView.animate(
                withDuration: animated ? 2 : 0,
                animations: { self.label.frame.origin = self.point(position: position) },
                completion: { _ in
                    self.isRunning = false
                    if self.isAnimating {
                        self.squarePosition = self.squarePosition.nextPoint
                        completionHandler?(animated)
                    }
                }
            )
        }
    }
    
    func stop() {
        self.isAnimating = false
    }
    
    func start() {
        self.isAnimating = true
        if self.isAnimating {
            self.setSquarePosition(position: self.squarePosition, animated: true) { _ in
                self.start()
            }
        }
    }
}
