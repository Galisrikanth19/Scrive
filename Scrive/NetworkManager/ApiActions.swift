//
//  ApiActions.swift
//  Created by Srikanth on 16/03/23.

import Foundation
import Alamofire

struct ApiActions {
    static let sample = SampleActions()
    static let common = CommonActions()
}

struct SampleActions {
    func sampleGetRequest(parameters: Parameters? = nil,
                          headers: HTTPHeaders? = nil,
                          WithCompletionCallback completionCallback: @escaping(AnyObject) -> Void,
                          WithSuccessCallback successCallback: @escaping(ApiResponseObject<ApiResponse>) -> Void,
                          WithFailureCallback failureCallback: @escaping(String) -> Void) {
        APIManager.shared.get(WithUrlStr: ApiEndPoints.login.url,
                              WithHeaders: headers,
                              WithParameters: parameters,
                              WithCompletionCallback: completionCallback,
                              WithSuccessCallback: successCallback,
                              WithFailureCallback: failureCallback)
    }
    
    func samplePostRequest(parameters: Parameters? = nil,
                           headers: HTTPHeaders? = nil,
                           WithCompletionCallback completionCallback: @escaping(AnyObject) -> Void,
                           WithSuccessCallback successCallback: @escaping(ApiResponseObject<ApiResponse>) -> Void,
                           WithFailureCallback failureCallback: @escaping(String) -> Void) {
        APIManager.shared.post(WithUrlStr: ApiEndPoints.login.url,
                               WithHeaders: headers,
                               WithParameters: parameters,
                               WithCompletionCallback: completionCallback,
                               WithSuccessCallback: successCallback,
                               WithFailureCallback: failureCallback)
    }
}

struct CommonActions {
    func loginRequest(parameters: Parameters? = nil,
                      headers: HTTPHeaders? = nil,
                      WithCompletionCallback completionCallback: @escaping(AnyObject) -> Void,
                      WithSuccessCallback successCallback: @escaping(ApiResponseObject<ApiResponse>) -> Void,
                      WithFailureCallback failureCallback: @escaping(String) -> Void) {
        APIManager.shared.post(WithUrlStr: ApiEndPoints.login.url,
                               WithHeaders: headers,
                               WithParameters: parameters,
                               WithCompletionCallback: completionCallback,
                               WithSuccessCallback: successCallback,
                               WithFailureCallback: failureCallback)
    }
}
