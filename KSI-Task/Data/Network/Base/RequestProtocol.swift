//
//  RequestProtocol.swift
//  EasySchools
//
//  Created by eslam dweeb on 14/05/2023.
//

import Foundation
import Alamofire

protocol TargetType:URLRequestConvertible{
    var queryies:[URLQueryItem]? {get}
    var host: String {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var bodyParameters: Parameters? {get}
    var DataDic:Codable? {get}
    var headers: [String: String]? {get}
    var authToken:String{get}
}

extension TargetType {

    var host: String {
        Constants.baseUrl.rawValue
    }

    var addAuthorizationToken: Bool {
        false
    }
    
    var headers: [String: String] {
        [:]
    }
    var authToken:String {
      ""
    }
    func createURLRequest() throws -> URLRequest {
        var components = URLComponents()
         components.scheme = "https"
         components.host = host
         components.path = path
         // 3

        if let queryies {
            components.queryItems = queryies
        }
         guard let url = components.url
         else { throw  NSError(
            domain: "URL ERROR",
            code: 3,
            userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]
        ) }
         // 4
         var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
         // 5
         if let headers {
         urlRequest.allHTTPHeaderFields = headers
         }
         // 6
         if addAuthorizationToken {
         urlRequest.setValue("Bearer \(authToken)",
         forHTTPHeaderField: "Authorization")
         }
         // 7
         urlRequest.setValue("application/json",
         forHTTPHeaderField: "Content-Type")
         // 8
         if let bodyParameters {
         urlRequest.httpBody = try JSONSerialization.data(
         withJSONObject: bodyParameters)
         }
        if let DataDic {
            do {
                urlRequest.httpBody = try JSONEncoder().encode(DataDic)
            }catch (let error){
                print(error)
            }
        }
         return urlRequest
    }
}

