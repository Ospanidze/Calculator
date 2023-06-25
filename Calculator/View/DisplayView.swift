//
//  DisplayView.swift
//  Calculator
//
//  Created by Айдар Оспанов on 24.06.2023.
//

import UIKit

final class DisplayView: UIView {
    
    private let innerShadow = CALayer()
    
    private let radius: CGFloat = 10
    private let borderWidth: CGFloat = 0.7
    private let borderColor: UIColor = .brown
    
    private let displayTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .right
        textField.font = UIFont.systemFont(ofSize: 40)
        //textField.enablesReturnKeyAutomatically = true
        textField.text = "0"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        getInnerShadow(innerShadow)
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGray5
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
    
    private func addSubviews() {
        addSubview(displayTextField)
        layer.addSublayer(innerShadow)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            displayTextField.topAnchor.constraint(equalTo: topAnchor),
            displayTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            displayTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            displayTextField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension DisplayView: DisplayManager {
    func setValue(value: String) {
        if value == "-0" {
            return
        }
        displayTextField.text = value
    }
}
