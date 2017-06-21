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
