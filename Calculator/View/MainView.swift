//
//  MainView.swift
//  Calculator
//
//  Created by Айдар Оспанов on 24.06.2023.
//

import UIKit

final class MainView: UIView {
    
    let displayView = DisplayView()
    let solarPanelView = SolarPanelView()
    let keyboardView = KeyboardView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle, compatibleWith: .current)
        label.text = "RADIA"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray6
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(displayView)
        addSubview(solarPanelView)
        addSubview(titleLabel)
        addSubview(keyboardView)
    }
}

extension MainView {
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            displayView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            displayView.heightAnchor.constraint(equalToConstant: 110),
            displayView.centerXAnchor.constraint(equalTo: centerXAnchor),
            displayView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            solarPanelView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            solarPanelView.heightAnchor.constraint(equalToConstant: 40),
            solarPanelView.rightAnchor.constraint(equalTo: displayView.rightAnchor),
            solarPanelView.topAnchor.constraint(equalTo: displayView.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: solarPanelView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: displayView.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            keyboardView.topAnchor.constraint(equalTo: solarPanelView.bottomAnchor, constant: 20),
            keyboardView.widthAnchor.constraint(equalTo: widthAnchor),
            keyboardView.centerXAnchor.constraint(equalTo: centerXAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
