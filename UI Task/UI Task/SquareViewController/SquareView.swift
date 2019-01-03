//
//  SquareView.swift
//  UI Task
//
//  Created by Alex Vorobiev on 12/25/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class SquareView: UIView {

    @IBOutlet var label: UILabel?
    
    private var isRunning = false
    private var isAnimating = false
    private var squarePosition = Position.topLeft
    private let positions = PositionGenerator(objects: Position.topLeft, .topRight, .bottomRight, .bottomLeft)
    
    enum Position {
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
    }
    
    private func point(position: Position) -> CGPoint {
        
        let frame =  self.frame.inset(by: UIEdgeInsets(top: self.safeAreaInsets.top, left: self.safeAreaInsets.left, bottom: (self.label?.frame.height)!, right: (self.label?.frame.width)!))
        
        var result = frame.topLeft
        let bottomRight = frame.bottomRight
        
        switch position {
        case .topLeft:  break
        case .topRight: result.x = bottomRight.x
        case .bottomLeft: result.y = bottomRight.y
        case .bottomRight: result = bottomRight
        }
        
        return result
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
                withDuration: animated ? 2.0 : 0.0,
                animations: { self.label?.frame.origin = self.point(position: position) },
                completion: { _ in
                    self.isRunning = false
                    if self.isAnimating {
                        self.squarePosition = self.positions.next()
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
