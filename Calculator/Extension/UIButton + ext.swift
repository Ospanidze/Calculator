//
//  UIButton + ext.swift
//  Calculator
//
//  Created by Айдар Оспанов on 23.06.2023.
//

import UIKit

extension UIButton {
    
    //typealias Func = () -> ()
    
    func setTarget(method methodDown: Selector, target: Any, event: UIControl.Event) -> Self {
        self.addTarget(target, action: methodDown, for: event)
        return self
    }
}
