//
//  UIViewExtension.swift
//  TheMealTask
//
//  Created by Asmaa Mostafa on 25/11/2019.
//  Copyright © 2019 AsmaaElaraby. All rights reserved.
//

import UIKit

extension UIView {
    func setShadow(shadowOffset: CGSize = CGSize(width: 0.3, height: 1.3),
                   shadowColor: UIColor = .black, shadowRadius: CGFloat = 1.5, shadowOpacity: Float = 0.65, cornerRadius: CGFloat = 5) {
        layer.shadowOffset = shadowOffset
        layer.shadowColor = shadowColor.cgColor
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        layer.masksToBounds = false
    }
}
