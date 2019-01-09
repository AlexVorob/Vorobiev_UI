//
//  SquareView.swift
//  UI Task
//
//  Created by Alex Vorobiev on 12/25/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class SquareView: UIView {
    
    typealias Position = CGRect.Position
    
    @IBOutlet var label: UILabel?
    @IBOutlet var button: UIButton?
    
    private struct Strings {
        
        static let start = "Start"
        static let stop = "Stop"
    }
    
    private struct Durations {
        
        static let zero = 0.0
        static let duration = 2.0
    }
    
    private(set) var isCancelled = false {
        didSet {
            let newValue = self.isCancelled ? Strings.stop : Strings.start
            self.button?.setTitle(newValue, for: .normal)
        }
    }
    
    private(set) var isRunning = false
    private(set) var isAnimating = true
    private(set) var squarePosition = Position.topLeft
    
    private let positions = PositionGenerator(objects: Position.topLeft, .topRight, .bottomRight, .bottomLeft)
    
    private func moveToPoint(position: Position) -> CGPoint {
        guard let label = self.label else { return .zero }
        
        let labelFrame = label.frame
        
        let inset = UIEdgeInsets(
            top: self.safeAreaInsets.top,
            left: self.safeAreaInsets.left,
            bottom: labelFrame.height,
            right: labelFrame.width
        )
        
        let frame = self.frame.inset(by: inset)
        
        return frame.point(at: position)
    }
    
    private func setSquarePosition(
        position: Position,
        animated: Bool = true,
        completionHandler: F.Completion<Bool>? = nil
    ) {
        if !self.isRunning {
            self.isRunning = true
            UIView.animate(
                withDuration: animated ? Durations.duration : Durations.zero,
                animations: { self.label?.frame.origin = self.moveToPoint(position: position) },
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
        if !self.isCancelled {
            self.animateMooving()
        }
        
        self.isCancelled.toggle()
    }
    
    private func animateMooving() {
        self.setSquarePosition(position: self.squarePosition) { _ in
            if self.isCancelled {
                self.animateMooving()
            }
        }
    }
}
