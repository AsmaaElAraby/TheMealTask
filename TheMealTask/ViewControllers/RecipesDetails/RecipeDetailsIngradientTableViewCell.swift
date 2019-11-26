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

    func bindData(_ instruction: String) {
        
        ingradientLabel.text = instruction
    }
    
}
