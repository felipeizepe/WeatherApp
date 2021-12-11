//
//  NetworkRequest.swift
//  
//
//  Created by Felipe Izepe on 10/12/21.
//

import Foundation
import Alamofire

public struct NetworkRequest {

    var url: URL
    var method: HTTPMethod

    public init(url: URL,
                method: HTTPMethod) {
        self.url = url
        self.method = method
    }
}

public enum Response {

    case success(Data)
    case error(ResponseStatus, Error?, Data?)

    static func responseFor(alamoResponse: AFDataResponse<Data?>) -> Response {
        let code: Int = alamoResponse.response?.statusCode ?? -1
        let responseStatus: ResponseStatus = ResponseStatus.statusFor(statusCode: code)

        guard responseStatus == .success, alamoResponse.error == nil else {
            return .error(responseStatus,
                          alamoResponse.error,
                          alamoResponse.data)

        }

        guard let data = alamoResponse.data else {
            return .error(.noData,
                          alamoResponse.error,
                          alamoResponse.data)
        }

        return .success(data)
    }
}

public enum ResponseStatus {
    
    case success
    case empty
    case notFound
    case unprocessable
    case tooManyrequest
    case unauthorized
    case forbidden
    case conflict
    case parseError
    case internalServerError
    case unkown
    case noData
    case incorrectPath

    static func statusFor(statusCode: Int) -> ResponseStatus {
        switch statusCode {
        case 200..<300:
            return .success
        case 401:
            return .unauthorized
        case 403:
            return.forbidden
        case 404:
            return .notFound
        case 409:
            return .conflict
        case 422:
            return .unprocessable
        case 429:
            return .tooManyrequest
        case 500:
            return .internalServerError
        case 999:
            return .parseError
        default:
            return unkown
        }
    }
}
