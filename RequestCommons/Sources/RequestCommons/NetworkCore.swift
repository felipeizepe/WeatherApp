//
//  NetworkCore.swift
//  
//
//  Created by Felipe Izepe on 10/12/21.
//

import Foundation
import Alamofire

public protocol NetworkCoreProtocol {

    func performRequest(_ request: NetworkRequest, completion: @escaping (Response) -> Void)
}

public class NetworkCore: NetworkCoreProtocol {

    public func performRequest(_ request: NetworkRequest, completion: @escaping (Response) -> Void) {
        AF.request(request.url.absoluteString,method: request.method)
            .validate(statusCode: 200..<300)
            .response { response in
                let modeledResponse = Response.responseFor(alamoResponse: response)
                completion(modeledResponse)
            }
    }
}
