//
//  APIManager.swift
//  TheMealTask
//
//  Created by Asmaa Mostafa on 24/11/2019.
//  Copyright © 2019 AsmaaElaraby. All rights reserved.
//

import Foundation
import Moya

typealias RequestCompletionHandler = (Codable?, CustomError?) -> ()
class APIManager {

    class func beginRequest<T: Codable, ProvidertType: TargetType>(withTargetType targetType: ProvidertType.Type, andTarget target: ProvidertType, responseModel model: T.Type, andHandler handler: @escaping RequestCompletionHandler) {
        
        let provider = MoyaProvider<ProvidertType> ()
        provider.request(target) { (result) in
            switch result {
            case let .success(moyaResponse):
                guard moyaResponse.statusCode == 200 else {
                    var customError: CustomError = CustomError(errorCode: .generalError , serverErrorCode: moyaResponse.statusCode)
                    if let customErrorCode = CustomErrorCode(rawValue: moyaResponse.statusCode) {
                        customError.errorCode = customErrorCode
                    }
                    handler(nil, customError)
                    return
                }
                
                guard let result = String(data: moyaResponse.data, encoding: .utf8), let resultDecoded = T.decode(json: result, asA: T.self) else {
                    let customError: CustomError = CustomError(errorCode: .generalError, serverErrorCode: nil)
                    handler(nil, customError)
                    return
                }
                
                handler(resultDecoded, nil)
                break
            case let .failure(error):
                print(error.localizedDescription)
                let customError: CustomError = CustomError(errorCode: .generalError, serverErrorCode: result.error?.response?.statusCode)
                handler(nil, customError)
                break
            }
        }
    }
}
