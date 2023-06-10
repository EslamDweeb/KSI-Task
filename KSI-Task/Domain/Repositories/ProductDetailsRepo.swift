//
//  ProductDetailsRepo.swift
//  KSI-Task
//
//  Created by eslam dweeb on 10/06/2023.
//

import Foundation

protocol ProductDetailsRepo {
    func getProducDetails(id:String, _ completion:@escaping(_ success:ProductDetails?,_ error:String?) ->Void)
    
}
