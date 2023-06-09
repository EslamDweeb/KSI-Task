//
//  DefaultHomeRepo.swift
//  CarsApp
//
//  Created by eslam dweeb on 12/02/2023.
//

import Foundation
 

class DefaultHomeRepo:HomeRepo {
    func getProductList(_ completion: @escaping (ProductList?, String?) -> Void) {
        HomeClient.getProductList { success, failure, ReqErr in
            if let success {
                completion(success.toDomain(),nil)
            }
            if let failure {
                completion(nil,failure)
            }
            if let ReqErr {
                print(ReqErr)
                completion(nil,ReqErr.localizedDescription)
            }
        }
    }
    
}
