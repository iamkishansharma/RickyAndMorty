//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Kishan Kr Sharma on 5/5/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...){
        views.forEach({
            self.addSubview($0)
        })
    }
}
