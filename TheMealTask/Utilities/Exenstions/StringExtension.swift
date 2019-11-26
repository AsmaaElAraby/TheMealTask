//
//  StringExtension.swift
//  TheMealTask
//
//  Created by Asmaa Mostafa on 25/11/2019.
//  Copyright © 2019 AsmaaElaraby. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

let ArabicLanguage: String = "ar"
let EnglishLanguage: String = "en"

extension String {

    func localizedString() -> String {
        let lang = Defaults[.kSelectedLanguage]
        if let path = Bundle.main.path(forResource: lang, ofType: "lproj") {
            let bundle = Bundle(path: path)
            return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
        } else {
            return self
        }
    }

    var stripped: String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-=().!_")
        return self.filter {okayChars.contains($0) }
    }
}


