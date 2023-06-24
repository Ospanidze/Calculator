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

    var currentNumber = "0"
    var firstNumber = 0.0
    var secondNumber = 0.0
    var resultNumber = ""
    var currentOperation: Operation = .noAction
    let displayView: MainViewController
    
    init(displayView: MainViewController) {
        self.displayView = displayView
    }
    
    func numberAction(numberStr: String) {
        if currentNumber != "0" {
            currentNumber.append(numberStr)
            displayView.updateDisplay(text: currentNumber)
        } else {
            currentNumber = numberStr
            displayView.updateDisplay(text: currentNumber)
        }
    }

    func makeCalculation(operation: Operation) {
        if currentOperation != .noAction {
            if !currentNumber.isEmpty {
                secondNumber = Double(currentNumber) ?? 0
                switch operation {
                case .addition:
                    resultNumber = String(firstNumber + secondNumber)
                case .substraction:
                    resultNumber = String(firstNumber - secondNumber)
                case .multiplication:
                    resultNumber = String(firstNumber * secondNumber)
                case .division:
                    resultNumber = secondNumber != 0
                    ? String(firstNumber / secondNumber)
                    : "Error"
                default:
                    break
                }
                
                if let number = Double(resultNumber) {
                    firstNumber =  number
                    if firstNumber.truncatingRemainder(dividingBy: 1) == 0 {
                        resultNumber = String(Int(Double(resultNumber) ?? 0 ))
                    }
                }
                
                currentNumber = resultNumber
                currentOperation = .noAction
                displayView.updateDisplay(text: currentNumber)
            }
        } else {
            firstNumber = Double(currentNumber) ?? 0
            currentNumber = ""
            displayView.updateDisplay(text: currentNumber)
            currentOperation = operation
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
        currentNumber = "0"
        firstNumber = 0.0
        secondNumber = 0.0
        resultNumber = ""
        currentOperation = .noAction
        displayView.updateDisplay(text: currentNumber)
    }
    
    func changeSign() {
        var temp = currentNumber
        
        if temp.contains("-") {
            let sign = ["-"]
            temp = String(temp.filter{ !sign.contains(String($0)) })
            currentNumber = temp
            displayView.updateDisplay(text: temp)
        } else {
            temp = "-" + currentNumber
            currentNumber = temp
            displayView.updateDisplay(text: temp)
        }
    }
    
    func dot() {
        if currentNumber.contains(".") {
            return
        } else {
            currentNumber += "."
            displayView.updateDisplay(text: currentNumber)
        }
    }
    
    func percent() {
        currentNumber = String((Double(currentNumber) ?? 0) / 100)
        resultNumber = currentNumber
        firstNumber = Double(resultNumber) ?? 0
        displayView.updateDisplay(text: currentNumber)
    }
}
