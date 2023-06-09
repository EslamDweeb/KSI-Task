//
//  HomeClient.swift
//  KSI-Task
//
//  Created by eslam dweeb on 09/06/2023.
//

import Foundation
import Alamofire

class HomeClient:BaseClient {
    static func getProductList(_ completionHandler:@escaping (_ sucess: ProductListDTO?,_ failure: String?,_ error: Error?)->Void) {
        performRequest(route: HomeRouter.getProductList, completion: completionHandler)
    }
}
