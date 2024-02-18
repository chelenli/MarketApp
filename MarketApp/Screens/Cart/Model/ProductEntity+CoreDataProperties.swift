//
//  ProductEntity+CoreDataProperties.swift
//  MarketApp
//
//  Created by Naciye Celenli on 17.02.2024.
//
//

import Foundation
import CoreData


extension ProductEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductEntity> {
        return NSFetchRequest<ProductEntity>(entityName: "ProductEntity")
    }
    @NSManaged public var quantity: Int32
    @NSManaged public var id: Int32
    @NSManaged public var price: Int32
    @NSManaged public var title: String?

}

extension ProductEntity : Identifiable {

}
