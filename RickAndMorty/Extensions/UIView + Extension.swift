//
//  UIView + Extension.swift
//  RickAndMorty
//
//  Created by Ivan Rybkin on 07.11.2024.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}


