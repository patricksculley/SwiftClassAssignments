//
//  BinLocModel.swift
//  SwiftDemo
//
//  Created by Khurram Iqbal on 14/06/2017.
//  Copyright © 2017 Nisum. All rights reserved.
//

import UIKit

enum ValueType  {
    
    case BinType
    case LocationType
    
}
class BinLocModel: NSObject {
   
   
    var names : [String]! = [String]()
    var bins : [String]! = [String]()
    var locations : [String]! = [String]()
    var modelType : ValueType = .BinType
    
    func addElement(name : String? ){
        if name == nil {return}
        
        switch (modelType){
        
        case ValueType.BinType : self.bins.append(name!)
        case ValueType.LocationType : self.locations.append(name!)
        }
    }
    
    func setName (){
        names = (modelType == .BinType) ? bins : locations
    }
    func getIndexOfValue(val : String!)-> Int{
    
      return  names.index(of: val)!
    }
}
