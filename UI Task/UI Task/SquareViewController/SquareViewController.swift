//
//  SquareViewController.swift
//  UI Task
//
//  Created by Alex Vorobiev on 12/25/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class SquareViewController: UIViewController, RootViewRepresentable {
    
    typealias RootView = SquareView
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onStartButton(_ sender: UIButton) {
        self.rootView?.start()
    }
    
    @IBAction func onStopButton(_ sender: UIButton) {
        self.rootView?.stop()
    }
}
