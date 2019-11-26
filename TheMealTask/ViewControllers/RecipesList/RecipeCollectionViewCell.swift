//
//  RecipeCollectionViewCell.swift
//  TheMealTask
//
//  Created by Asmaa Mostafa on 24/11/2019.
//  Copyright © 2019 AsmaaElaraby. All rights reserved.
//

import UIKit
import SDWebImage

class RecipeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    
    static let cellIdentifier = "RecipeCollectionViewCell"

    func bindData(_ data: MealGeneralInfo) {
        
        shadowView.setShadow()
        recipeTitleLabel.text = data.title
        recipeImageView?.sd_setImage(with: URL(string: data.mealThumb ?? ""), placeholderImage: UIImage(named: "noImagePlaceholder"))
        self.containerView.layer.cornerRadius = 5
    }
}
