//
//  ProductListLDB.swift
//  KSI-Task
//
//  Created by eslam dweeb on 09/06/2023.
//

import Foundation
import RealmSwift


class ProductListLDB: Object {
    @Persisted var products: RealmSwift.List<ProductLDB >
    @Persisted var total: Int
    @Persisted var skip: Int
    @Persisted var limit: Int
}

