//
//  Level.swift
//  Blobies
//
//  Created by Emil Lind on 2015-10-01.
//  Copyright (c) 2015 Emil's app house. All rights reserved.
//

import UIKit

class Level: NSObject {
    
    convenience override init() {
        self.init();
    }
    
    init(progress: Int) {
        switch(progress){
        case 1:
            println("levelstarted")
        default:
            println("wrong level")
        }
        
    }
    
   
}
