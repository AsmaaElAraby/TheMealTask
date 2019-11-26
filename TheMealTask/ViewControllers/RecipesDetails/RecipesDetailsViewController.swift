//
//  RecipesDetailsViewController.swift
//  TheMealTask
//
//  Created by Asmaa Mostafa on 25/11/2019.
//  Copyright © 2019 AsmaaElaraby. All rights reserved.
//

import UIKit
import MBProgressHUD

class RecipesDetailsViewController: UITableViewController {
    
    static let identifier = "RecipesDetailsViewController"
    
    var selectedMealId: String? = nil
    private var repo: MealsRepoProtocol!
    private var mealDetails: MealGeneralInfo? = nil {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        
        initPrerequisite()
        MBProgressHUD.showAdded(to: view, animated: true)
        if let selectedMealId = selectedMealId {
            _ = repo.getMealDetails(mealId: selectedMealId)
                .done  { [weak self] mealDetails in
                    self?.mealDetails = mealDetails
                    guard self != nil else { return }
                    MBProgressHUD.hide(for: self!.view, animated: false)
            }.catch { error in
                self.displayAlertWith(alertMessage: (error is CustomError) ? (error as! CustomError).errorMessage : error.localizedDescription,
                alertActions: [(title: Localization.General.OkActionTitle, style: .cancel, action: nil)], viewController: self)
                MBProgressHUD.hide(for: self.view, animated: false)
            }
        } else {
            fatalError("If you may check that you'r passing the meal id correctly")
        }
    }
    
    private func initPrerequisite() {
        
        tableView.register(UINib(nibName: RecipeDetailsImageTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: RecipeDetailsImageTableViewCell.cellIdentifier)
        tableView.register(UINib(nibName: RecipeDetailsInstructionsTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: RecipeDetailsInstructionsTableViewCell.cellIdentifier)
        tableView.register(UINib(nibName: RecipeDetailsIngradientTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: RecipeDetailsIngradientTableViewCell.cellIdentifier)
        tableView.separatorStyle = .none
        
        repo = MealsRepo()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return mealDetails != nil ? 1 : 0
        case 1:
            return mealDetails?.totalIngredients.count ?? 0
        case 2:
            return mealDetails?.instructionsAsSteps.count ?? 0
        default:
            fatalError("please check the cells again")
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 350
        case 1:
            return 32
        case 2:
            return UITableView.automaticDimension
        default:
            fatalError("please check the cells again")
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        case 1:
            return mealDetails != nil ? Localization.ScreenMealDetails.IngrediantsHeader : ""
        case 2:
            return mealDetails != nil ? Localization.ScreenMealDetails.InstructionsHeader : ""
        default:
            fatalError("please check the cells again")
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeDetailsImageTableViewCell") as! RecipeDetailsImageTableViewCell
            cell.bindData(mealDetails!, parent: self)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeDetailsIngradientTableViewCell") as! RecipeDetailsIngradientTableViewCell
            cell.bindData("\(mealDetails!.totalMeasurments[indexPath.row]) \(mealDetails!.totalIngredients[indexPath.row])")
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeDetailsInstructionsTableViewCell") as! RecipeDetailsInstructionsTableViewCell
            cell.bindData(mealDetails!.instructionsAsSteps[indexPath.row])
            return cell
        default:
            fatalError("please check the cells again")
        }
    }
}

