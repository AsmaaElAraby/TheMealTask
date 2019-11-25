//
//  MealProvider.swift
//  TheMealTask
//
//  Created by Asmaa Mostafa on 24/11/2019.
//  Copyright © 2019 AsmaaElaraby. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum MealEndPoint {
    case mealList(sortRegex: String, pageNumber: Int)
    case mealDetails(id: String)
}

extension MealEndPoint: TargetType {
    
    var baseURL: URL {
        guard let baseURL = URL(string: BASEURL) else {
            fatalError("If you may check the base server url")
        }
        return baseURL
    }
    
    var path: String {
        switch self {
        case .mealList(_, _):
            return "search.php"
        case .mealDetails(_):
            return "lookup.php"
        }
    }
    
    var method: Alamofire.HTTPMethod {
            return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .mealList(let sortRegex, let pageNumber):
            return .requestParameters(parameters: ["f": sortRegex, "page": pageNumber], encoding: URLEncoding.default)
        case .mealDetails(let id):
            return  .requestParameters(parameters: ["i": id], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return defaultHeaders()
    }
}
