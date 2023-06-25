//
//  Formatter + ext.swift
//  Calculator
//
//  Created by Айдар Оспанов on 26.06.2023.
//

import Foundation

extension Formatter {
    
    static let formatter = NumberFormatter()
    
    static let formatterFromDouble: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.maximumIntegerDigits = 10
        formatter.minimumIntegerDigits = 5
        formatter.maximumFractionDigits = 9
        formatter.maximumFractionDigits = 3
        return formatter
    }()
}

extension Numeric {
    
    var formatterForm: String {
        Formatter.formatterFromDouble.string(for: self) ?? ""
    }
}
