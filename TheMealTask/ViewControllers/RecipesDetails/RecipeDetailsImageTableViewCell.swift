//
//  RecipeDetailsImageTableViewCell.swift
//  TheMealTask
//
//  Created by Asmaa Mostafa on 25/11/2019.
//  Copyright © 2019 AsmaaElaraby. All rights reserved.
//

import UIKit
import SDWebImage

class RecipeDetailsImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    
    static let cellIdentifier = "RecipeDetailsImageTableViewCell"
    private var parent: UIViewController? = nil
    
    func bindData(_ data: MealGeneralInfo, parent: UIViewController) {
        
        self.parent = parent
        recipeTitleLabel.text = data.title
        recipeImageView?.sd_setImage(with: URL(string: data.mealThumb ?? ""), placeholderImage: UIImage(named: "noImagePlaceholder"))
        dismissButton.layer.cornerRadius = dismissButton.bounds.size.width/2
        selectionStyle = .none
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        parent?.dismiss(animated: true, completion: nil)
    }
}
