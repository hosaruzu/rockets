//
//  UIView+Ext.swift
//  rockets
//
//  Created by Artem Tebenkov on 30.07.2024.
//

import UIKit

extension UIView {
    func addSubviews(views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
