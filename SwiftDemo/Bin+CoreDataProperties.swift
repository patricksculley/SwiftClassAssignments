//
//  Bin+CoreDataProperties.swift
//  SwiftDemo
//
//  Created by Khurram Iqbal on 21/06/2017.
//  Copyright © 2017 Nisum. All rights reserved.
//

import Foundation
import CoreData


extension Bin {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bin> {
        return NSFetchRequest<Bin>(entityName: "Bin")
    }

    @NSManaged public var binNam: String?
    @NSManaged public var entityType: String?
    @NSManaged public var locationId: Int16
    @NSManaged public var binToLocation: Location?

}
