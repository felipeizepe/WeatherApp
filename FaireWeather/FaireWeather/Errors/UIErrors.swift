//
//  UIErrors.swift
//  FaireWeather
//
//  Created by Felipe Izepe on 11/12/21.
//

import Foundation

public class UIError: Error {

    public private(set) var message: String

    init(type: UIErrorType) {
        message = type.messageValue()
    }
}

public enum UIErrorType{

    case invalidLattitude
    case invalidLongitude
    case invalidId

    func messageValue() -> String {
        switch self {
        case .invalidLattitude:
            return ErrorsTable.invalidLattitude.textValue()
        case .invalidLongitude:
            return ErrorsTable.invalidLongitude.textValue()
        case .invalidId:
            return ErrorsTable.invalidId.textValue()
        }
    }
}
