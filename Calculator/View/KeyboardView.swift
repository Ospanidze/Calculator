//
//  KeyboardView.swift
//  Calculator
//
//  Created by Айдар Оспанов on 23.06.2023.
//

import UIKit

enum KeyboardSymbol: String, CaseIterable {
    case ac = "A/C"
    case plusMinus = "+/-"
    case percent = "%"
    case division = "/"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case multiplication = "*"
    case four = "4"
    case five = "5"
    case six = "6"
    case minus = "-"
    case one = "1"
    case two = "2"
    case three = "3"
    case plus = "+"
    case zero = "0"
    case demical
    case sum = "="
}

final class KeyboardView: UIView {
    
    weak var delegate: KeyboardDelegate?
    
    private var buttons: [UIButton] = []
    
    private let buttonInRow = 4
    
    private let containerStackView = UIStackView()
        .styleStackView(
            spacing: 17,
            aligment: .fill,
            axis: .horizontal,
            distribution: .fillProportionally,
            userInteraction: true
        )
    
    private let mainStackView = UIStackView()
        .styleStackView(
            spacing: 17,
            aligment: .fill,
            axis: .vertical,
            distribution: .fillEqually,
            userInteraction: true
        )
        .setlayoutMargins(top: 10, left: 12, right: 12, bottom: 10)
    
    private let lastStackView = UIStackView()
        .styleStackView(
            spacing: 17,
            aligment: .fill,
            axis: .horizontal,
            distribution: .fillEqually,
            userInteraction: true
        )
    
    private let zeroStackView = UIStackView()
        .styleStackView(
            spacing: 0,
            aligment: .fill,
            axis: .horizontal,
            distribution: .fillEqually,
            userInteraction: true
        )
    
    private lazy var decimalSeparatorButton = KeyboardButton(
        model: ModelKeyboardButton(
            title: Locale.current.decimalSeparator ?? "",
            font: UIFont.systemFont(ofSize: 30),
            backgroundColor: .white,
            titleColor: .black
        ),
        type: .demical)
        .setTarget(
            method: #selector(buttonAction),
            target: self,
            event: .touchUpInside
        )
    
    private lazy var zeroButton = KeyboardButton(
        model: ModelKeyboardButton(
            title: KeyboardSymbol.zero.rawValue,
            font: UIFont.systemFont(ofSize: 30),
            backgroundColor: .white,
            titleColor: .black
        ),
        type: .zero)
        .setTarget(
            method: #selector(buttonAction),
            target: self,
            event: .touchUpInside
        )
    
    private lazy var sumButton = KeyboardButton(
        model: ModelKeyboardButton(
            title: KeyboardSymbol.sum.rawValue,
            font: UIFont.systemFont(ofSize: 30),
            backgroundColor: .orange,
            titleColor: .black
        ),
        type: .sum)
        .setTarget(
            method: #selector(buttonAction),
            target: self,
            event: .touchUpInside
        )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        createPostionButtons()
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createButton(type: KeyboardSymbol) -> UIButton {
        let button: KeyboardButton
        
        let title = type.rawValue
        
        switch type {
        case .multiplication, .plus, .minus, .division:
            button = KeyboardButton(model: ModelKeyboardButton(
                title: title,
                font: UIFont.systemFont(ofSize: 30, weight: .heavy),
                backgroundColor: .white,
                titleColor: .black
            ), type: type)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            
        default:
            button = KeyboardButton(model: ModelKeyboardButton(
                title: title,
                font: UIFont.systemFont(ofSize: 30, weight: .bold),
                backgroundColor: .white,
                titleColor: .black
            ), type: type)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        }
        
        return button
    }
    
    @objc private func buttonAction(sender: KeyboardButton) {
        delegate?.onAction(type: sender.typeButton)
    }
    
    private func createStackViewNumber(element: UIButton) {
        
        if buttons.count < buttonInRow {
            buttons.append(element)
        } else {
            
            let stackView = UIStackView()
                .styleStackView(
                    spacing: 17,
                    aligment: .fill,
                    axis: .horizontal,
                    distribution: .fillEqually,
                    userInteraction: true
                )
            
            buttons.forEach { button in
                stackView.addArrangedSubview(button)
            }
            
            mainStackView.addArrangedSubview(stackView)
            buttons.removeAll()
            buttons.append(element)
        }
    }
    
    private func createPostionButtons () {
        
        for symbol in KeyboardSymbol.allCases {
            let symbolButton = createButton(type: symbol)
            createStackViewNumber(element: symbolButton)
        }
    }
    
    private func addSubviews() {
        addSubview(mainStackView)
        containerStackView.addArrangedSubview(zeroStackView)
        containerStackView.addArrangedSubview(lastStackView)
        mainStackView.addArrangedSubview(containerStackView)
        zeroStackView.addArrangedSubview(zeroButton)
        lastStackView.addArrangedSubview(decimalSeparatorButton)
        lastStackView.addArrangedSubview(sumButton)
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
        NSLayoutConstraint.activate([
            zeroButton.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 0.45)
        ])
    }
        
}
