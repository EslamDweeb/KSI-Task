//
//  HomeRouter.swift
//  KSI-Task
//
//  Created by eslam dweeb on 09/06/2023.
//

import Foundation
import Alamofire

enum HomeRouter:TargetType {
    case getProductList
    
    var queryies: [URLQueryItem]?{
        switch self{
        default:
            return nil
        }
    }
    
    var baseURL: String {
        switch self{
        default:
            return Constants.baseUrl.rawValue
        }
    }
    
    var path: String{
        switch self{
        case .getProductList:
            return "/9677ed07-93eb-42a6-9e26-5a9cbbca658f"
        }
    }
    
    var method:HTTPMethod{
        switch self{
        case .getProductList:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self{
        default:
            return nil
        }
    }
    
    var DataDic: Codable?{
        switch self{
        default:
            return nil
        }
    }
    
    var headers: [String : String]?{
        switch self{
        default:
            return nil
        }
    }
    
    
}
