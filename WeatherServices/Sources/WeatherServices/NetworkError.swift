//
//  NetworkError.swift
//  
//
//  Created by Felipe Izepe on 10/12/21.
//

import Foundation
import RequestCommons

public class NetworkError: Error {

    public private(set) var statusCode: ResponseStatus
    public private(set) var error: Error?
    public private(set) var data: Data?

    init(status: ResponseStatus, error: Error? = nil, data: Data? = nil) {
        self.statusCode = status
        self.error = error
        self.data = data
    }
}

