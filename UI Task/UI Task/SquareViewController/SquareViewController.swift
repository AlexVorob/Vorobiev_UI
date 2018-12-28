//
//  SquareViewController.swift
//  UI Task
//
//  Created by Alex Vorobiev on 12/25/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class SquareViewController: UIViewController {
    
    func when<Result>(_ condition: Bool, execute: () -> Result?) -> Result? {
        return condition ? execute() : nil
    }
    
    func cast<Value, Result>(_ value: Value) -> Result? {
        return value as? Result
    }
    
    public var squareView: SquareView? {
        return when(self.isViewLoaded) {
            cast(self.view)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onStartButton(_ sender: UIButton) {
        self.squareView?.start()
    }
    
    @IBAction func onStopButton(_ sender: UIButton) {
        self.squareView?.stop()
    }
}
