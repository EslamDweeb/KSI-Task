//
//  ProductListDTO.swift
//  KSI-Task
//
//  Created by eslam dweeb on 09/06/2023.
//

import Foundation
// MARK: - ProductListDTO
struct ProductListDTO: Codable {
    let products: [ProductDTO]
    let total, skip, limit: Int
}

// MARK: - Product
struct ProductDTO: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}

