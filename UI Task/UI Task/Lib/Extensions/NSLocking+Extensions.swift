//
//  NSLocking+Extensions.swift
//  UI Task
//
//  Created by Alex Vorobiev on 12/28/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

extension NSLocking {
    
    func locked<Result>( _ action: () -> Result) -> Result {
        self.lock()
        defer { self.unlock() }
        
        return action()
    }
}
