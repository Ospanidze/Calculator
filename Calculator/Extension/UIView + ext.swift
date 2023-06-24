//
//  UIView + ext.swift
//  Calculator
//
//  Created by Айдар Оспанов on 24.06.2023.
//

import UIKit

extension UIView {
    
    func getInnerShadow(_ innerShadow: CALayer) {
        innerShadow.frame = bounds
        let radius = layer.cornerRadius
        
        let path = UIBezierPath(
            roundedRect: innerShadow.bounds.insetBy(dx: 2, dy: 2),
            cornerRadius: radius
        )
        
        let cutout = UIBezierPath(
            roundedRect: innerShadow.bounds,
            cornerRadius: radius
        ).reversing()
        
        path.append(cutout)
        
        innerShadow.shadowPath = path.cgPath
        innerShadow.masksToBounds = true
        innerShadow.shadowColor = UIColor.black.cgColor
        innerShadow.shadowOffset = CGSize(width: 0, height: 3)
        innerShadow.shadowOpacity = 5
        innerShadow.shadowRadius = 3
        innerShadow.cornerRadius = radius
    }
}

