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
    func sampleRequest(WithHTTPHeaders httpheaders: HTTPHeaders? = nil,
                      WithParameters parameters: Parameters? = nil,
                      WithCompletionCallback completionCallback: @escaping(Data?) -> Void,
                      WithSuccessCallback successCallback: @escaping(ApiResponse?) -> Void,
                      WithFailureCallback failureCallback: @escaping(String?) -> Void) {
        APIManager.shared.request(WithUrlStr: ApiEndPoints.login.url,
                                  WithHttpMethod: .post,
                                  WithHeaders: httpheaders,
                                  WithParameters: parameters,
                                  WithCompletionCallback: completionCallback,
                                  WithSuccessCallback: successCallback,
                                  WithFailureCallback: failureCallback)
    }
}

struct CommonActions {
    func loginRequest(WithHTTPHeaders httpheaders: HTTPHeaders? = nil,
                      WithParameters parameters: Parameters? = nil,
                      WithCompletionCallback completionCallback: @escaping(Data?) -> Void,
                      WithSuccessCallback successCallback: @escaping(ApiResponse?) -> Void,
                      WithFailureCallback failureCallback: @escaping(String?) -> Void) {
        APIManager.shared.request(WithUrlStr: ApiEndPoints.login.url,
                                  WithHttpMethod: .post,
                                  WithHeaders: httpheaders,
                                  WithParameters: parameters,
                                  WithCompletionCallback: completionCallback,
                                  WithSuccessCallback: successCallback,
                                  WithFailureCallback: failureCallback)
    }
}
