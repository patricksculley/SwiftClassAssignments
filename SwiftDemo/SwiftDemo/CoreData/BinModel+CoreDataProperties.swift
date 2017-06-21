//
//  BinModel+CoreDataProperties.swift
//  SwiftDemo
//
//  Created by Khurram Iqbal on 21/06/2017.
//  Copyright © 2017 Nisum. All rights reserved.
//

import Foundation
import CoreData


extension BinModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BinModel> {
        return NSFetchRequest<BinModel>(entityName: "BinModel")
    }

    @NSManaged public var binToLocation: LocationModel?
    @NSManaged public var binToItem: NSSet?
    
    func setBin (binDict : [String : Any]){
        self.name = binDict["name"] as! String
        self.binToLocation = binDict["location"] as! LocationModel
            
        self.id = (CoreDataManager.shared.fetechRequest(entityName: CoreDataModelName.BinModel.rawValue, predicate: nil)?.count)! + 1
        self.entityTypeModel = EntityType.BinType.rawValue
        
    
    }

}

// MARK: Generated accessors for binToItem
extension BinModel {

    @objc(addBinToItemObject:)
    @NSManaged public func addToBinToItem(_ value: ItemModel)

    @objc(removeBinToItemObject:)
    @NSManaged public func removeFromBinToItem(_ value: ItemModel)

    @objc(addBinToItem:)
    @NSManaged public func addToBinToItem(_ values: NSSet)

    @objc(removeBinToItem:)
    @NSManaged public func removeFromBinToItem(_ values: NSSet)

}
