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
    
    private var isRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func buttonClick(_ sender: UIButton) {
        self.viewSquare.run()
    }
    
    @IBAction func buttonStop(_ sender: UIButton) {
        
    }
}
