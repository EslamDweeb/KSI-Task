//
//  ProductLDB.swift
//  KSI-Task
//
//  Created by eslam dweeb on 09/06/2023.
//

import Foundation
import RealmSwift
// MARK: - Product
class ProductLDB: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title:String
    @Persisted var descriptions: String
    @Persisted var price: Int
    @Persisted var discountPercentage:Double
    @Persisted var rating: Double
    @Persisted var stock: Int
    @Persisted var brand: String
    @Persisted var category: String
    @Persisted var thumbnail: String
    @Persisted var images: RealmSwift.List<String>
    
    @Persisted(originProperty: "products") var productList :LinkingObjects<ProductListLDB>
    
    init( title: String, descriptions: String, price: Int, discountPercentage: Double, rating: Double, stock: Int, brand: String, category: String, thumbnail: String, images: RealmSwift.List<String>) {
        self.title = title
        self.descriptions = descriptions
        self.price = price
        self.discountPercentage = discountPercentage
        self.rating = rating
        self.stock = stock
        self.brand = brand
        self.category = category
        self.thumbnail = thumbnail
        self.images = images
    }
}

