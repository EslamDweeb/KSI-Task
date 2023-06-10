//
//  ProductList.swift
//  KSI-Task
//
//  Created by eslam dweeb on 09/06/2023.
//

import Foundation

struct ProductList {
    let products: [Product]
    let total, skip, limit: Int
}
struct Product {
    let id:String
    let name:String
    let description: String
    let price: Int
    let thumbnail: String
    let isFav:Bool
}
