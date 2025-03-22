//
//  Product+CoreDataProperties.swift
//  A2_IOS_Luilson_101275514
//
//  Created by Luilson Marcos Sousa dos Reis on 2025-03-22.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var productID: Int64
    @NSManaged public var name: String?
    @NSManaged public var productDescription: String?
    @NSManaged public var price: Double
    @NSManaged public var provider: String?

}

extension Product : Identifiable {

}
