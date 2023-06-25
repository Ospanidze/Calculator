//
//  String + ext.swift
//  Calculator
//
//  Created by Айдар Оспанов on 26.06.2023.
//

import Foundation

extension String {
    
    func convertTextInDouble() -> Double {
        let textWithoutSpaces = self.replacingOccurrences(of: " ", with: "")
        guard let number = Formatter
            .formatterFromDouble
            .number(from: textWithoutSpaces) as? Double else {
            return 0
        }
        return number
    }
}
