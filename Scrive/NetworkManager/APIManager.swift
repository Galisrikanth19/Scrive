//
//  APIManager.swift
//  Created by Srikanth on 17/03/23.

import Foundation
import Alamofire

class APIManager {
    static let shared = APIManager()
    private init() { }
    
    func request<T: Decodable>(WithUrlStr urlStr: String,
                               WithHttpMethod httpMethod: HTTPMethod,
                               WithHeaders httpHeaders: HTTPHeaders? = nil,
                               WithParameters parameters: Parameters? = nil,
                               WithCompletionCallback completionCallback: @escaping(Data?) -> Void,
                               WithSuccessCallback successCallback: @escaping(T?) -> Void,
                               WithFailureCallback failureCallback: @escaping(String?) -> Void) {
        //Removing all cached responses if any
        URLCache.shared.removeAllCachedResponses()
        
        //Adding HttpHeaders
        var httpHeaders: HTTPHeaders? = httpHeaders
        if httpHeaders == nil {
            httpHeaders = HTTPHeaders()
        }
        guard var httpHeaders = httpHeaders else { return }
        if let accessToken = AppSingleton.shared.accessToken {
            httpHeaders[ApiParamKeys.authorization] = "Bearer \(accessToken)"
        }
        
        //Setting ParameterEncoding
        var encoding:ParameterEncoding!
        if httpMethod == .get {
            encoding = URLEncoding.Destination.methodDependent as? ParameterEncoding ?? URLEncoding.default
        } else {
            encoding = JSONEncoding.default
        }
        
        AF.request(urlStr, method: httpMethod, parameters: parameters, encoding: encoding, headers: httpHeaders).responseDecodable(of: T.self) { (afDataResponse) in
            //Debug response
            self.debugResponse(WithResponse: afDataResponse)
            
            //Calling callback as request processed
            completionCallback(afDataResponse.data)
            
            switch(afDataResponse.result) {
            case .success:
                successCallback(afDataResponse.value)
            case .failure(let error):
                failureCallback(error.errorDescription)
            }
        }
    }
    
    private func debugResponse<T: Decodable>(WithResponse response: AFDataResponse<T>) {
        print("\n\n")
        print("*************************************************************************************")
        print("Requested URL -> \(response.request?.url?.absoluteString ?? "")")
        print("StatusCode -> \(response.response?.statusCode ?? 0)")
        
        print("\n")
        print("AllHTTPHeaderFields -> ")
        if let allHTTPHeaderFieldsArr = response.request?.allHTTPHeaderFields {
            for key in allHTTPHeaderFieldsArr.keys {
                print("\(key): \(allHTTPHeaderFieldsArr[key] ?? "")")
            }
        }
        
        if (response.request?.httpMethod ?? "") == "GET" {
            print("\n")
            print("HttpMethod -> GET")
        } else if (response.request?.httpMethod ?? "") == "POST" {
            print("\n")
            print("HttpMethod -> POST")
            if let responseData = response.request?.httpBody {
                if let json = try? JSONSerialization.jsonObject(with: responseData, options: .mutableContainers),
                   let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
                    print("Parameters -> ")
                    print(String(decoding: jsonData, as: UTF8.self))
                } else {
                    assertionFailure("Malformed JSON")
                }
            }
        }
        
        if let responseData = response.data {
            do {
                let json = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                print("\n")
                print("Response -> ")
                print(String(decoding: jsonData, as: UTF8.self))
                print("*************************************************************************************")
                print("\n\n")
            } catch let parsingError as NSError {
                print("\n")
                print("Error -> ")
                print(parsingError.localizedDescription)
                print("*************************************************************************************")
                print("\n\n")
            }
        } else {
            print("\n")
            print("Error -> ")
            print(response.error!.asAFError?.localizedDescription ?? "")
            print("*************************************************************************************")
            print("\n\n")
        }
    }
}
