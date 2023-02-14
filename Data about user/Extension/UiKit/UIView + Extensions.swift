//
//  UIView + Extensions.swift
//  Data about user
//
//  Created by user on 14.02.2023.
//

import UIKit

extension UIView {
    func addView(_ view: UIView) {
        view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false

    }
}
