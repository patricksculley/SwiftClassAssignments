//
//  Item.swift
//  SwiftDemo
//
//  Created by khurram iqbal on 15/06/2017.
//  Copyright © 2017 Nisum. All rights reserved.
//

import UIKit

class Item: EntityProtocol {
    
    var name: String?
    var entityType: EntityType {return .ItemType}
    weak var bin : Bin?
    
    init(itemnName : String?, bin : Bin?){
        self.name = itemnName
        self.bin = bin
        
    }
     init() {
    }
    
}
