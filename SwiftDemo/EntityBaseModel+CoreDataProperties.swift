//
//  EntityBaseModel+CoreDataProperties.swift
//  SwiftDemo
//
//  Created by Khurram Iqbal on 21/06/2017.
//  Copyright © 2017 Nisum. All rights reserved.
//

import Foundation
import CoreData


extension EntityBaseModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EntityBaseModel> {
        return NSFetchRequest<EntityBaseModel>(entityName: "EntityBaseModel")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var entityTypeModel: String?

}
