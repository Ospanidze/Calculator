//
//  KeyboardDelegate.swift
//  Calculator
//
//  Created by Айдар Оспанов on 24.06.2023.
//

import Foundation

protocol KeyboardDelegate: AnyObject {
    
    func onAction(type: KeyboardSymbol)
}
