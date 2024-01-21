//
//  UIView+Extensions.swift
//  FinVista
//
//  Created by Adam Scott on 2024-01-19.
//

import Foundation
import UIKit

protocol TappableView {
    func viewTapped(target: Any, action: Selector)
}

extension UIView: TappableView {
    
    func viewTapped(target: Any, action: Selector) {
        let gestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(gestureRecognizer)
        self.isUserInteractionEnabled = true
    }
}
