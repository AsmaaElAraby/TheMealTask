//
//  RecipeDetailsIngradientTableViewCell.swift
//  TheMealTask
//
//  Created by Asmaa Mostafa on 25/11/2019.
//  Copyright © 2019 AsmaaElaraby. All rights reserved.
//

import UIKit

class RecipeDetailsIngradientTableViewCell: UITableViewCell {

    @IBOutlet weak var ingradientLabel: UILabel!

    static let cellIdentifier = "RecipeDetailsIngradientTableViewCell"

    func bindData(_ instruction: String) {
        
        ingradientLabel.text = instruction
        selectionStyle = .none
    }
    
}
