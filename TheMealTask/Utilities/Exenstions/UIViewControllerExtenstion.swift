//
//  GeneralAlert.swift
//  TheMealTask
//
//  Created by Asmaa Mostafa on 25/11/2019.
//  Copyright © 2019 AsmaaElaraby. All rights reserved.
//

import UIKit

typealias AlertActionInfo = (title: String, style: UIAlertAction.Style, action: ((UIAlertAction) -> Void)?)
extension UIViewController {
    
    func displayAlertWith(alertTitle: String = "", alertMessage: String = "", alertStyle: UIAlertController.Style = .alert, alertActions: [AlertActionInfo], viewController: UIViewController, sourceRect: CGRect? = nil, sourceView: UIView? = nil, animated: Bool = true, completion: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: alertStyle)
        
        for (title, style, action) in alertActions {
            alert.addAction(UIAlertAction(title: title, style: style, handler: action))
        }
        viewController.present(alert, animated: true, completion: nil)
    }
}
