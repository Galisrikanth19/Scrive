//
//  CommonActions.swift
//  Created by Srikanth on 19/07/23.

import Foundation
import Alamofire

struct CommonActions {
    func loginRequest(WithHTTPHeaders httpheaders: HTTPHeaders? = nil,
                      WithParameters parameters: Parameters? = nil,
                      WithCompletionCallback completionCallback: @escaping(Data?) -> Void,
                      WithSuccessCallback successCallback: @escaping(LoginResponseModel?) -> Void,
                      WithFailureCallback failureCallback: @escaping(String?) -> Void) {
        APIManager.shared.request(WithUrlStr: ApiEndPoints.login.url,
                                  WithHttpMethod: .post,
                                  WithHeaders: httpheaders,
                                  WithParameters: parameters,
                                  WithCompletionCallback: completionCallback,
                                  WithSuccessCallback: successCallback,
                                  WithFailureCallback: failureCallback)
    }
    
    func loginRequest(WithHTTPHeaders httpheaders: HTTPHeaders? = nil,
                      WithData data: Data? = nil,
                      WithCompletionCallback completionCallback: @escaping(Data?) -> Void,
                      WithSuccessCallback successCallback: @escaping(LoginResponseModel?) -> Void,
                      WithFailureCallback failureCallback: @escaping(String?) -> Void) {
        APIManager.shared.request(WithUrlStr: ApiEndPoints.login.url,
                                  WithHttpMethod: .post,
                                  WithHeaders: httpheaders,
                                  WithData: data,
                                  WithCompletionCallback: completionCallback,
                                  WithSuccessCallback: successCallback,
                                  WithFailureCallback: failureCallback)
    }
}
