//
//  MealsRepo.swift
//  TheMealTask
//
//  Created by Asmaa Mostafa on 24/11/2019.
//  Copyright © 2019 AsmaaElaraby. All rights reserved.
//

import Foundation
import PromiseKit

protocol MealsRepoProtocol {
    func getMeals(page: Int) -> Promise<MealsListResponse>
    func getMealDetails(mealId: String) -> Promise<MealGeneralInfo>
}

struct MealsRepo: MealsRepoProtocol {

    func getMeals(page: Int) -> Promise<MealsListResponse> {
        return Promise { seal in
            APIManager.beginRequest(withTargetType: MealEndPoint.self, andTarget: MealEndPoint.mealList(sortRegex: "a", pageNumber: page), responseModel: MealsListResponse.self) { (data, error) in
                guard let data = data as? MealsListResponse else {
                    seal.reject(error!)
                    return
                }
                seal.fulfill(data)
            }
        }
    }
    
    func getMealDetails(mealId: String) -> Promise<MealGeneralInfo> {
        return Promise { seal in
            APIManager.beginRequest(withTargetType: MealEndPoint.self, andTarget: MealEndPoint.mealDetails(id: mealId), responseModel: MealsListResponse.self) { (data, error) in
                guard let data = data as? MealsListResponse else {
                    seal.reject(error!)
                    return
                }
                seal.fulfill(data.meals.first!)
            }
        }
    }
}
