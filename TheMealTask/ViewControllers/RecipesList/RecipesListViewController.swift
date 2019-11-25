//
//  ViewController.swift
//  TheMealTask
//
//  Created by Asma on 11/20/19.
//  Copyright © 2019 AsmaaElaraby. All rights reserved.
//

import UIKit

class RecipesListViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var recipesCollectionView: UICollectionView!
        
    private var repo: MealsRepoProtocol!
    private var collectionViewHandler: RecipesCollectionViewDataHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPrerequisite()
        
        _ = repo.getMeals(page: 0)
            .done  { [weak self] mealsList in
                self?.collectionViewHandler.updateDataSource(mealsList.meals)
                self?.recipesCollectionView.reloadData()
        }.catch { error in
            print(error.localizedDescription)
        }
    }
    
    private func initPrerequisite() {
        recipesCollectionView.register(UINib(nibName: "RecipeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RecipeCollectionViewCell")

        repo = MealsRepo()
        collectionViewHandler = RecipesCollectionViewDataHandler(viewController: self, delegate: self)
        recipesCollectionView.dataSource = collectionViewHandler
        recipesCollectionView.delegate = collectionViewHandler
    }
}

extension RecipesListViewController: RecipesCollectionViewDataHandlerProtocol {
    func didSelectItem(index: Int) {
        
    }
}
