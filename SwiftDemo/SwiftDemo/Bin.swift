//
//  Bin.swift
//  SwiftDemo
//
//  Created by khurram iqbal on 15/06/2017.
//  Copyright © 2017 Nisum. All rights reserved.
//

import UIKit

class Bin: NSObject,EntityProtocol {
    var name: String?
    var entityType: EntityType {return .BinType}
    weak var location : Location?
    
    init(binName : String?, location : Location?){
        super.init()
        self.name = binName
        self.location = location
        
    }
    override init() {
        super.init()
    }
    
    
}
