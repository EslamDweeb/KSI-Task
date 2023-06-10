//
//  DefaultProductDetailsRepo.swift
//  KSI-Task
//
//  Created by eslam dweeb on 10/06/2023.
//

import Foundation
class DefaultProductDetailsRepo: ProductDetailsRepo {
    var productListLDBCLient:ProductListLDBCLient
    
    init(productListLDBCLient:ProductListLDBCLient) {
        self.productListLDBCLient = productListLDBCLient
    }
    func getProducDetails(id: String, _ completion: @escaping (ProductDetails?, String?) -> Void) {
        productListLDBCLient.getProductDetails(id: id, completion)
    }
    
    
}
