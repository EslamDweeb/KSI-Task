//
//  ProductItemFavUsecase.swift
//  KSI-Task
//
//  Created by eslam dweeb on 10/06/2023.
//

import Foundation
protocol ProductItemFavUsecase {
    func excute(id:String,_ completion:@escaping(_ success:ProductList?,_ error:String?) ->Void)
}
 
class DefaultProductItemFavUsecase:ProductItemFavUsecase{
    
    

   private let repo:HomeRepo
    
    init(homeRepo: HomeRepo) {
        self.repo = homeRepo
    }
    func excute(id:String,_ completion:@escaping(_ success:ProductList?,_ error:String?) ->Void){
        repo.addFaveorite(id: id, completion)
    }
}
