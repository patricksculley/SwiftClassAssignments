//
//  ViewControllerProtocol.swift
//  SwiftDemo
//
//  Created by khurram iqbal on 15/06/2017.
//  Copyright © 2017 Nisum. All rights reserved.
//

import UIKit

protocol ViewControllerProtocol: class {
    var name : String? {get set}
    func printName()
    
}

extension ViewControllerProtocol {
    
    func printName(){
        print (self.name ?? "Nil Value")
        
    }
    
}
