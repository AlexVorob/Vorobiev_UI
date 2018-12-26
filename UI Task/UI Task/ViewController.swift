//
//  ViewController.swift
//  UI Task
//
//  Created by Alex Vorobiev on 12/25/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var viewSquare: ViewSquare!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonClick(_ sender: UIButton) {
        self.viewSquare.startRunning()
    }
    
    @IBAction func buttonStop(_ sender: UIButton) {
        self.viewSquare.stop()
    }
}
