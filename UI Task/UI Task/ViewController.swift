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
    
    public var squareView: ViewSquare? {
        if self.isViewLoaded {
            return self.view as? ViewSquare
        }
        
        return nil
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
