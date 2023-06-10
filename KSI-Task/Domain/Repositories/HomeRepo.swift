//
//  HomeRepo.swift
//  CarsApp
//
//  Created by eslam dweeb on 12/02/2023.
//

import Foundation

protocol HomeRepo {
    func getProductList( _ completion:@escaping(_ success:ProductList?,_ error:String?) ->Void)
    func addFaveorite(id:String,_ completion:@escaping(_ success:ProductList?,_ error:String?) ->Void)
}
