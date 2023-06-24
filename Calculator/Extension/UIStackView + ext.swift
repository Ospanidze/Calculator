//
//  UIStackView + ext.swift
//  Calculator
//
//  Created by Айдар Оспанов on 23.06.2023.
//

import UIKit

extension UIStackView {
    
    func styleStackView(spacing: CGFloat, aligment: UIStackView.Alignment, axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, userInteraction: Bool) -> Self {
        self.spacing = spacing
        self.alignment = aligment
        self.axis = axis
        self.distribution = distribution
        self.isUserInteractionEnabled = userInteraction
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    func setlayoutMargins(top: CGFloat, left: CGFloat, right: CGFloat, bottom: CGFloat) -> Self {
        self.layoutMargins = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        self.isLayoutMarginsRelativeArrangement = true
        return self
    }
}
