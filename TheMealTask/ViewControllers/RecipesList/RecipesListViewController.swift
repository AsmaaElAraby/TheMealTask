//
//  ViewController.swift
//  TheMealTask
//
//  Created by Asma on 11/20/19.
//  Copyright © 2019 AsmaaElaraby. All rights reserved.
//

import UIKit
import MBProgressHUD

class RecipesListViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var recipesCollectionView: UICollectionView!
    
    private let refreshControl = UIRefreshControl()
    private var repo: MealsRepoProtocol!
    private var collectionViewHandler: RecipesCollectionViewDataHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipesCollectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshScreenData), for: .valueChanged)
        
        initPrerequisite()
        loadScreenData()
    }
    
    private func initPrerequisite() {
        recipesCollectionView.register(UINib(nibName: "RecipeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RecipeCollectionViewCell")
        
        repo = MealsRepo()
        collectionViewHandler = RecipesCollectionViewDataHandler(viewController: self, delegate: self)
        recipesCollectionView.dataSource = collectionViewHandler
        recipesCollectionView.delegate = collectionViewHandler
    }
    
    private func localize() {
        titleLabel.text = Localization.ScreenTitles.RecipesListScreen
    }
    
    private func loadScreenData() {
        MBProgressHUD.showAdded(to: view, animated: true)
        _ = repo.getMeals(page: 0)
            .done  { [weak self] mealsList in
                self?.collectionViewHandler.updateDataSource(mealsList.meals)
                self?.recipesCollectionView.reloadData()
                guard self != nil else { return }
                MBProgressHUD.hide(for: self!.view, animated: false)
        }.catch { error in
            
            self.displayAlertWith(alertMessage: (error is CustomError) ? (error as! CustomError).errorMessage : error.localizedDescription,
                                  alertActions: [(title: Localization.General.OkActionTitle, style: .cancel, action: nil)], viewController: self)
            MBProgressHUD.hide(for: self.view, animated: false)
        }
    }
    
    @objc private func refreshScreenData(_ sender: Any) {
        refreshControl.endRefreshing()
        loadScreenData()
    }
}

extension RecipesListViewController: RecipesCollectionViewDataHandlerProtocol {
    func didSelectMeal(mealId: String) {
        let storyboard = UIStoryboard(name: Storyboards.main.rawValue, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "RecipesDetailsViewController") as? RecipesDetailsViewController else {
            fatalError("Double check for the requested viewController of type RecipesDetailsViewController in storyboard with id \(Storyboards.main.rawValue)")
        }
        viewController.selectedMealId = mealId
        self.present(viewController, animated: true, completion: nil)
    }
}
