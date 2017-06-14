//
//  Entity.swift
//  SwiftDemo
//
//  Created by Khurram Iqbal on 14/06/2017.
//  Copyright © 2017 Nisum. All rights reserved.
//

import UIKit

protocol EntityProtocol : class{
    
    var name : String? {get set}
    
    func printName()

}

extension EntityProtocol {

    func printName(){
        print (self.name ?? "Nil Value")
    }
}
