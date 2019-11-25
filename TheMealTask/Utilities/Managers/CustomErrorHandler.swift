//
//  CustomErrorHandler.swift
//  TheMealTask
//
//  Created by Asmaa Mostafa on 24/11/2019.
//  Copyright © 2019 AsmaaElaraby. All rights reserved.
//

import Foundation

enum CustomErrorCode: Int {
    case timeout = 524
    case generalError = 500
}

struct CustomError: Error {
    var errorCode: CustomErrorCode = .generalError
    var serverErrorCode: Int?
    var errorMessage: String {
        return ErrorHandler.errorMesage(forErrorCode: errorCode)
    }
}

class ErrorHandler {

    class func errorMesage(forErrorCode error: CustomErrorCode) -> String {
        switch error {
        case .timeout:
            return "timeout"
        default:
            return "GeneralError"
        }
    }
}
