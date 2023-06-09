//
//  RequestClient.swift
//  EasySchools
//
//  Created by eslam dweeb on 14/05/2023.
//

import Alamofire
import UIKit

class CustomInterceptor:RequestInterceptor{
    private let retryLimit = 3
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        if let statusCode = request.response?.statusCode
            ,statusCode == 401,request.retryCount < retryLimit {
            //handelAuth()
        }
        else{
            completion(.doNotRetry)
        }
    }
    //    private func handelAuth(){
    //        UserDefaults.standard.setValue(nil, forKey: Constants.userToken.rawValue)
    //        UserDefaults.standard.set(false, forKey: Constants.isLogin.rawValue)
    //        UserDefaults.standard.setValue(nil, forKey: Constants.userName.rawValue)
    //        UserDefaults.standard.setValue(nil, forKey: Constants.userEmail.rawValue)
    //        UserDefaults.standard.setValue(nil, forKey: Constants.userPhone.rawValue)
    //
    //        DispatchQueue.main.async {
    //            let delegate = UIApplication.shared.delegate as? AppDelegate
    //            //            let navVC = UINavigationController(rootViewController:LoginVC.loadController())
    //            //            navVC.navigationBar.isHidden = true
    //            //            delegate?.window?.rootViewController = navVC
    //            delegate?.appCoordinator.start()
    //        }
    //    }
}

class BaseClient {
    @discardableResult
    static func `performRequest`<T:Decodable,E:Decodable>(route:URLRequestConvertible, decoder: JSONDecoder = JSONDecoder(), completion:  @escaping (_ sucess: T?,_ failure: E?,_ error: Error?)->Void) -> DataRequest {
        return AF.request(route,
                          interceptor: CustomInterceptor()).validate(statusCode: 200..<300)
        
            .responseDecodable (decoder: decoder){ (response: DataResponse<T,AFError>) in
                print("Status Code:",response.response?.statusCode as Any)
                switch response.result {
                case.success(_):
                    if response.response?.statusCode == 204 {
                        completion(nil, nil,nil)
                    }else{
                        do {
                            guard let data = response.data else{return}
                            print("DATA: ",String(data: data, encoding: .utf8) ?? "")
                            let dataJson = try decoder.decode(T.self, from: data)
                            completion(dataJson,nil,nil)
                        } catch let error {
                            completion(nil, nil,error)
                        }
                    }
                case .failure(let error):
                    /// Handle request failure
                    if response.response?.statusCode == 400 ||  response.response?.statusCode == 422{
                        do {
                            guard let data = response.data else{return}
                            print(String(data: data, encoding: .utf8) ?? "")
                            let dataJson = try decoder.decode(E.self, from: data)
                            completion(nil,dataJson,nil)
                        } catch let error {
                            /// Handle json decode error
                            completion(nil, nil,error)
                        }
                    }else{
                        print("Error>>>>>>>>",error)
                        print(response.request?.url as Any)
                        completion(nil,nil,error)
                    }
                }
            }
    }
    @discardableResult
    static func `uploadRequest`<T:Decodable,E:Decodable>(multiPart:MultipartFormData,route:URLRequestConvertible, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (_ sucess: T?,_ failure: E?,_ error: Error?)->Void) -> DataRequest {
        
        return AF.upload(multipartFormData: multiPart, with: route)
            .validate(statusCode: 200..<300)
            .responseDecodable (decoder: decoder){ (response: DataResponse<T,AFError>) in
                switch response.result {
                case.success(_):
                    do {
                        guard let data = response.data else{return}
                        print("DATA: ",String(data: data, encoding: .utf8) ?? "")
                        let dataJson = try decoder.decode(T.self, from: data)
                        completion(dataJson,nil,nil)
                    } catch let error {
                        completion(nil, nil,error)
                    }
                case .failure(let error):
                    /// Handle request failure
                    if response.response?.statusCode == 400 {
                        do {
                            guard let data = response.data else{return}
                            print(String(data: data, encoding: .utf8) ?? "")
                            let dataJson = try decoder.decode(E.self, from: data)
                            completion(nil,dataJson,nil)
                        } catch let error {
                            /// Handle json decode error
                            completion(nil, nil,error)
                        }
                    }else{
                        completion(nil,nil,error)
                    }
                }
            }
    }
}
