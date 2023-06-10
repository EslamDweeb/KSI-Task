//
//  ProductListLDB.swift
//  KSI-Task
//
//  Created by eslam dweeb on 09/06/2023.
//

import Foundation
import RealmSwift


class ProductListLDB: Object {
    @Persisted var products: RealmSwift.List<ProductLDB>
    @Persisted var total: Int
    @Persisted var skip: Int
    @Persisted var limit: Int
    convenience init(products: RealmSwift.List<ProductLDB>, total: Int, skip: Int, limit: Int) {
        self.init()
        self.products = products
        self.total = total
        self.skip = skip
        self.limit = limit
    }
}
extension ProductListLDB {
    func toDomian()->ProductList {
        return .init(products: products.map({$0.toDomain()}), total: total, skip: skip, limit: limit)
    }
}
