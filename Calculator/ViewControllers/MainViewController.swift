//
//  ViewController.swift
//  Calculator
//
//  Created by Айдар Оспанов on 22.06.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private var service: CalcService?
    
    fileprivate var mainView: MainView {
        guard let view = self.view as? MainView else {
            return MainView()
        }
        return view
    }
    
    //private let keyboardView = KeyboardView()

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .white
        service = CalcService(displayView: self)
        mainView.keyboardView.delegate = self
        //mainView.displayView.setValue(value: service?.currentValue ?? "0")
    }
    
    override func loadView() {
        super.loadView()
        view = MainView(frame: UIScreen.main.bounds)
    }
    
    func updateDisplay(text: String) {
        DispatchQueue.main.async { [weak self] in
            self?.mainView.displayView.setValue(value: text)
        }
    }
}

extension MainViewController: KeyboardDelegate {
    func onAction(type: KeyboardSymbol) {
        //mainView.displayView.setValue(value: type.rawValue)
        switch type {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            service?.numberAction(numberStr: type.rawValue)
            //print(type.rawValue)
        case .sum:
            service?.makeResult()
        case .plus:
            service?.addition()
        case .minus:
            service?.substraction()
        case .multiplication:
            service?.multiplication()
        case .division:
            service?.division()
        case .ac:
            service?.acAction()
        case .plusMinus:
            service?.changeSign()
        case .demical:
            service?.dot()
        case .percent:
            service?.percent()
        }
    }
    
    
}

