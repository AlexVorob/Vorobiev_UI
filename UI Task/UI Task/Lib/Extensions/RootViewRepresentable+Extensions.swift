//
//  RootViewRepresentable+Extensions.swift
//  UI Task
//
//  Created by Alex Vorobiev on 1/3/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

extension RootViewRepresentable where Self: UIViewController {
    
    var rootView: RootView? {
        return when(self.isViewLoaded) {
            cast(self.view)
        }
    }
}
