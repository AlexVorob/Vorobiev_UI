//
//  PositionGenerator.swift
//  UI Task
//
//  Created by Alex Vorobiev on 1/3/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

final class PositionGenerator<Value> {
    
    private(set) var objects = [Value]()
    let index = Atomic(0)
    
    init(objects: [Value]) {
        self.objects = objects
    }
    
    convenience init(objects: Value ...) {
        self.init(objects: objects)
    }
    
    func next() -> Value {
        let index: Int = self.index.modify { index in
            defer {
                index = (index + 1) % self.objects.count
            }
            
            return index
        }
    
        return self.objects[index]
    }
}
