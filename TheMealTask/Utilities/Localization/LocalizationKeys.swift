//
//  Constants.swift
//  TheMealTask
//
//  Created by Asmaa Mostafa on 25/11/2019.
//  Copyright © 2019 AsmaaElaraby. All rights reserved.
//

import Foundation

class Localization {
    
    //MARK: - Error Messages -
    class Error {
        class var GeneralError: String { return "GeneralError".localizedString() }
        class var NetworkError: String { return "NetworkError".localizedString() }
    }
    
    //MARK: - General -
    class General {
        class var OkActionTitle: String { return "OkActionTitle".localizedString() }
    }
    
    //MARK: - Screen titles -
    
    class ScreenTitles {
        class var RecipesListScreen: String { return "Recipes".localizedString() }
    }
    
    //MARK: - Screen Meal Details  -
    
    class ScreenMealDetails {
        class var IngrediantsHeader: String { return "IngrediantsHeader".localizedString() }
        class var InstructionsHeader: String { return "InstructionsHeader".localizedString() }
    }
}
