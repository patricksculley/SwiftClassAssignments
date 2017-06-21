//
//  LocationModel+CoreDataProperties.swift
//  SwiftDemo
//
//  Created by Khurram Iqbal on 21/06/2017.
//  Copyright © 2017 Nisum. All rights reserved.
//

import Foundation
import CoreData


extension LocationModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LocationModel> {
        return NSFetchRequest<LocationModel>(entityName: "LocationModel")
    }

    @NSManaged public var locationToBin: NSSet?
    
    
    func setLocation (locDict : [String : Any]){
        self.name = locDict["name"] as! String
        
        let id = (CoreDataManager.shared.fetechRequest(entityName: CoreDataModelName.ItemModel.rawValue, predicate: nil)?.count)! + 1
        self.id = Int16(id)
        self.entityTypeModel = EntityType.LocationType.rawValue
        
        
    }

}

// MARK: Generated accessors for locationToBin
extension LocationModel {

    @objc(addLocationToBinObject:)
    @NSManaged public func addToLocationToBin(_ value: BinModel)

    @objc(removeLocationToBinObject:)
    @NSManaged public func removeFromLocationToBin(_ value: BinModel)

    @objc(addLocationToBin:)
    @NSManaged public func addToLocationToBin(_ values: NSSet)

    @objc(removeLocationToBin:)
    @NSManaged public func removeFromLocationToBin(_ values: NSSet)

}
