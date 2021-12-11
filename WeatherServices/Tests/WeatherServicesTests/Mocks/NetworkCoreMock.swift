//
//  NetworkCoreMock.swift
//  
//
//  Created by Felipe Izepe on 10/12/21.
//

import Quick
import Nimble
import RequestCommons

class NetworkCoreMock: NetworkCoreProtocol {

    var mockResponse: Response?
    var didCallPerformRequest: Bool = false

    func performRequest(_ request: NetworkRequest, completion: @escaping (Response) -> Void) {
        didCallPerformRequest = true
        guard let response = mockResponse else {
            fail("No response to mock")
            return
        }
        completion(response)
    }
}
