//
//  RecipesCollectionViewDataHandler.swift
//  TheMealTask
//
//  Created by Asmaa Mostafa on 24/11/2019.
//  Copyright © 2019 AsmaaElaraby. All rights reserved.
//

import UIKit

protocol RecipesCollectionViewDataHandlerProtocol {
    func didSelectItem(index: Int)
}

class RecipesCollectionViewDataHandler: NSObject {
    
    fileprivate var viewController: UIViewController!
    fileprivate var delegate: RecipesCollectionViewDataHandlerProtocol!
    fileprivate var collectionViewData = [MealGeneralInfo]()
    
    fileprivate var cellWidth: CGFloat?
    fileprivate var cellHeight: CGFloat?
    
    init(viewController: UIViewController, delegate: RecipesCollectionViewDataHandlerProtocol) {
        self.viewController = viewController
        self.delegate = delegate
    }
    
    func updateDataSource(_ collectionViewData: [MealGeneralInfo]) {
        self.collectionViewData = collectionViewData
    }
    
    fileprivate func getCellRatio(collectionView: UICollectionView) -> CGSize {
        if cellWidth == nil {
            cellWidth = (collectionView.frame.size.width - 8)/2
        }
        if cellHeight == nil {
            cellHeight = (collectionView.frame.size.height - 8)/3
        }
        return CGSize(width: cellWidth!, height: cellHeight!)
    }
}

extension RecipesCollectionViewDataHandler: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCollectionViewCell", for: indexPath) as? RecipeCollectionViewCell else {
            fatalError("If you may register the cell in the collectionview")
        }
        cell.bindData(collectionViewData[indexPath.row] )
        return cell
    }
}

extension RecipesCollectionViewDataHandler: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return getCellRatio(collectionView: collectionView)
    }
}
