//
//  RecipesDetailsViewController.swift
//  TheMealTask
//
//  Created by Asmaa Mostafa on 25/11/2019.
//  Copyright © 2019 AsmaaElaraby. All rights reserved.
//

import UIKit

class RecipesDetailsViewController: UITableViewController {
    
    override func viewDidLoad() {
        
        tableView.register(UINib(nibName: "WeatherSummaryTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherSummaryTableViewCell")
    }
}
