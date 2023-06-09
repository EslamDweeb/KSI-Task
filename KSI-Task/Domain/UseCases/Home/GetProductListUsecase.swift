//
//  GetVisitorsCountUsecase.swift
//  CarsApp
//
//  Created by eslam dweeb on 26/03/2023.
//

import Foundation
protocol GetProductListUsecase {
    func excute(_ completion:@escaping(_ success:ProductList?,_ error:String?) ->Void)
}
 
class DefaultGetProductListUsecase:GetProductListUsecase{

   private let repo:HomeRepo
    
    init(homeRepo: HomeRepo) {
        self.repo = homeRepo
    }
    func excute(_ completion:@escaping(_ success:ProductList?,_ error:String?) ->Void){
        repo.getProductList( completion)
    }
}
