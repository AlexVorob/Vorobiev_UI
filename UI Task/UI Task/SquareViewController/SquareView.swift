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
    private var squarePosition = Position.topLeft
    
    enum Position {
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
        
        var nextPoint: Position {
            switch self {
            case .bottomLeft: return .topLeft
            case .topLeft: return .topRight
            case .topRight: return .bottomRight
            case .bottomRight: return .bottomLeft
            }
        }
    }
    
    private func point(position: Position) -> CGPoint {
        let screenBounds = UIScreen.main.bounds
        let labelBounds = self.label.bounds
        
        switch position {
        case .topLeft:
            return .init(x: screenBounds.minX, y: screenBounds.minY)
        case .topRight:
            return .init(x: screenBounds.maxX - labelBounds.width, y: screenBounds.minY)
        case .bottomLeft:
            return .init(x: screenBounds.minX, y: screenBounds.maxY - labelBounds.height)
        case .bottomRight:
            return .init(x: screenBounds.maxX - labelBounds.width, y: screenBounds.maxY - labelBounds.height)
        }
    }
    
    func setSquarePosition(position: Position) {
        self.setSquarePosition(animated: false, nextPosition: position)
    }
    
    func setSquarePosition(animated: Bool, nextPosition: Position) {
        self.setSquarePosition(position: nextPosition, animated: animated, completionHandler: nil)
    }
    
    private func setSquarePosition(position: Position, animated: Bool, completionHandler: F.Completion<Bool>?) {
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
