//
//  SolarPanelView.swift
//  Calculator
//
//  Created by Айдар Оспанов on 24.06.2023.
//

import UIKit

final class SolarPanelView: UIView {
    
    private let innerShadow = CALayer()
    
    private let radius: CGFloat = 6
    private let borderWidth: CGFloat = 0.7
    private let borderColor: UIColor = .brown
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addSubviews()
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
        backgroundColor = .black
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
    
    private func addSubviews() {
        layer.addSublayer(innerShadow)
    }
    
}

