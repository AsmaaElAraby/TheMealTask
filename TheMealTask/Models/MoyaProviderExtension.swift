//
//  MoyaProviderExtension.swift
//  TheMealTask
//
//  Created by Asmaa Mostafa on 24/11/2019.
//  Copyright © 2019 AsmaaElaraby. All rights reserved.
//

import Foundation
import Moya

extension TargetType {
    
    var baseURL: URL {
        if let url = URL(string: BASEURL) {
            return url
        }
        fatalError("BASE URL NOT FOUND")
    }
    
    func defaultHeaders() -> [String: String]? {
        return [kAcceptLanguageHeaderName: kAcceptLanguageHeaderValue,
                                            kContentTypeHeaderName: kContentTypeHeaderValue]
    }
    
    func defaultHeadersWithJsonContent() -> [String: String]? {
        var spacesHeaders = defaultHeaders()
        spacesHeaders?[kContentTypeHeaderName] = kJSONContentTypeHeaderValue
        return spacesHeaders
    }
    
    var headers: [String: String]? {
        return defaultHeaders()
    }
}

//MARK: - BaseURLs -
let BASEURL = "https://www.themealdb.com/api/json/v1/1/"

//let BASEURL = Bundle.main.infoDictionary!  ["URLBaseEndPoint"] as! String
let AUTHURL = Bundle.main.infoDictionary!  ["URLAuthEndPoint"] as! String
let ASSESSMENTURL = Bundle.main.infoDictionary!  ["URLAssessmentEndPoint"] as! String
let IDENTITYURL = Bundle.main.infoDictionary!  ["URLIdentityEndPoint"] as! String

//MARK: - Header Fields -
let kAcceptLanguageHeaderName = "Accept-Language"
let kContentTypeHeaderName = "Content-Type"


//MARK: - Header Values -
let kAcceptLanguageHeaderValue = "en;q=1, ar-US;q=0.9"
let kContentTypeHeaderValue = "application/x-www-form-urlencoded"
let kJSONContentTypeHeaderValue = "application/json"


