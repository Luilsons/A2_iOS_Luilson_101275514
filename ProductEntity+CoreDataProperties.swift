//
//  ProductEntity+CoreDataProperties.swift
//  A2_IOS_Luilson_101275514
//
//  Created by Luilson Marcos Sousa dos Reis on 2025-03-30.
//
//

import Foundation
import CoreData


extension ProductEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductEntity> {
        return NSFetchRequest<ProductEntity>(entityName: "ProductEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var productDescription: String?
    @NSManaged public var productID: Int64
    @NSManaged public var provider: String?

}

extension ProductEntity : Identifiable {

}
