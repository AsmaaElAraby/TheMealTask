//
//  RecipeDetailsInstructionsTableViewCell.swift
//  TheMealTask
//
//  Created by Asmaa Mostafa on 25/11/2019.
//  Copyright © 2019 AsmaaElaraby. All rights reserved.
//

import UIKit

class RecipeDetailsInstructionsTableViewCell: UITableViewCell {

    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var circle: UIView!

    static let cellIdentifier = "RecipeDetailsInstructionsTableViewCell"

    func bindData(_ instruction: String) {
        
        instructionLabel.text = instruction
        circle.layer.cornerRadius = 6
        selectionStyle = .none
    }
}
