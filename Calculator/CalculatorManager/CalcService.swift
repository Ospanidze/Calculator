//
//  CalcService.swift
//  Calculator
//
//  Created by Айдар Оспанов on 23.06.2023.
//

import Foundation

enum Operation {
    case noAction
    case addition
    case substraction
    case multiplication
    case division
}

class CalcService {

    var currentValue = "0"
    var firstNumber = 0.0
    var secondNumber = 0.0
    var result = ""
    var currentOperation: Operation = .noAction
    let displayView: MainViewController
    
    init(displayView: MainViewController) {
        self.displayView = displayView
    }
    
    func numberAction(numberStr: String) {
        if currentValue != "0" {
            currentValue.append(numberStr)
            displayView.updateDisplay(text: currentValue)
        } else {
            currentValue = numberStr
            displayView.updateDisplay(text: currentValue)
        }
    }

    func makeCalculation(operation: Operation) {
        if currentOperation != .noAction {
            if !currentValue.isEmpty {
                secondNumber = Double(currentValue) ?? 0
                switch operation {
                case .addition:
                    result = String(firstNumber + secondNumber)
                case .substraction:
                    result = String(firstNumber - secondNumber)
                case .multiplication:
                    result = String(firstNumber * secondNumber)
                case .division:
                    result = String(firstNumber / secondNumber)
                default:
                    break
                }
                
                firstNumber = Double(result) ?? 0
                if firstNumber.truncatingRemainder(dividingBy: 1) == 0 {
                    result = String(Int(firstNumber))
                }
                
                currentValue = result
                displayView.updateDisplay(text: currentValue)
                
                currentOperation = .noAction
            } 
        } else {
            firstNumber = Double(currentValue) ?? 0
            displayView.updateDisplay(text: currentValue)
            
            if operation == .noAction {
                displayView.updateDisplay(text: currentValue)
            } else {
                currentValue = ""
                currentOperation = operation
            }
        }
    }

    func addition() {
        makeCalculation(operation: .addition)
    }

    func substraction() {
        makeCalculation(operation: .substraction)
    }

    func multiplication() {
        makeCalculation(operation: .multiplication)
    }

    func division() {
        makeCalculation(operation: .division)
    }

    func makeResult() {
        makeCalculation(operation: currentOperation)
    }

    func acAction() {
        currentValue = "0"
        firstNumber = 0.0
        secondNumber = 0.0
        result = ""
        currentOperation = .noAction
        displayView.updateDisplay(text: currentValue)
    }
    
    func changeSign() {
        var temp = currentValue
        
        if temp.contains("-") {
            let sign = ["-"]
            temp = String(temp.filter{ !sign.contains(String($0)) })
            currentValue = temp
            displayView.updateDisplay(text: temp)
        } else {
            temp = "-" + currentValue
            currentValue = temp
            displayView.updateDisplay(text: temp)
        }
    }
    
    func dot() {
        if currentValue.contains(".") {
            return
        } else {
            currentValue += "."
            displayView.updateDisplay(text: currentValue)
        }
    }
    
    func percent() {
        currentValue = String((Double(currentValue) ?? 0) / 100)
        result = currentValue
        firstNumber = Double(result) ?? 0
        displayView.updateDisplay(text: currentValue)
    }
}
