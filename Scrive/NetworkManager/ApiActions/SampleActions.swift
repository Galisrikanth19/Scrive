//
//  SampleActions.swift
//  Created by Srikanth on 19/07/23.

import Foundation
import Alamofire

struct SampleActions {
    func sampleRequest(WithHTTPHeaders httpheaders: HTTPHeaders? = nil,
                      WithParameters parameters: Parameters? = nil,
                      WithCompletionCallback completionCallback: @escaping(Data?) -> Void,
                      WithSuccessCallback successCallback: @escaping(ApiResponse?) -> Void,
                      WithFailureCallback failureCallback: @escaping(String?) -> Void) {
        ApiManager.shared.request(WithUrlStr: ApiEndPoints.login.endPoint,
                                  WithHttpMethod: .post,
                                  WithHeaders: httpheaders,
                                  WithParameters: parameters,
                                  WithCompletionCallback: completionCallback,
                                  WithSuccessCallback: successCallback,
                                  WithFailureCallback: failureCallback)
    }
}
