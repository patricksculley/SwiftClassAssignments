//
//  ItemModel+CoreDataProperties.swift
//  SwiftDemo
//
//  Created by Khurram Iqbal on 21/06/2017.
//  Copyright © 2017 Nisum. All rights reserved.
//

import Foundation
import CoreData


extension ItemModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemModel> {
        return NSFetchRequest<ItemModel>(entityName: "ItemModel")
    }

    @NSManaged public var qty: Int16
    @NSManaged public var iItemToBin: BinModel!
    
    func setItem(itemDic : [String : Any]){
    
        self.qty = itemDic["quantity"] as! Int16
        self.iItemToBin = itemDic["bin"] as! BinModel
        self.name = itemDic["name"] as! String
        self.entityTypeModel = EntityType.ItemType.rawValue
        let id = (CoreDataManager.shared.fetechRequest(entityName: CoreDataModelName.ItemModel.rawValue, predicate: nil)?.count)! + 1
        self.id = Int16(id)
        
    }

}
