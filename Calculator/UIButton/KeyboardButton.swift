//
//  KeyboardButton.swift
//  Calculator
//
//  Created by Айдар Оспанов on 23.06.2023.
//

import UIKit

enum ShadowType: String {
    case innerShadow = "innerShadow"
    case topShadow = "topShadow"
    case bottomShadow = "bottomShadow"
}
 
struct ModelKeyboardButton {
    let title: String
    let font: UIFont
    let backgroundColor: UIColor
    let titleColor: UIColor
}

final class KeyboardButton: UIButton {
    
    let typeButton: KeyboardSymbol
    
    override var isHighlighted: Bool {
        didSet {
            switch isHighlighted {
            case true:
                setHiddenLayer(inner: false, top: true, bottom: true)
            case false:
                setHiddenLayer(inner: true, top: false, bottom: false)
            }
        }
    }
    
    private let innerShadow = CALayer()
    
    private var stateShadow = false
    
    init(model: ModelKeyboardButton, type: KeyboardSymbol) {
        typeButton = type
        super.init(frame: .zero)
        setConfiguration(model: model)
        layer.insertSublayer(innerShadow, at: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
        
        if !stateShadow {
            addDropShadow()
            addInsertShadow()
            stateShadow = true
        }
    }
    
    private func setConfiguration(model: ModelKeyboardButton) {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = model.backgroundColor
        contentMode = .scaleAspectFill
        setTitle(model.title, for: .normal)
        setTitleColor(model.titleColor, for: .normal)
        setTitleColor(model.titleColor.withAlphaComponent(0.7), for: .highlighted)
        titleLabel?.font = model.font
    }
    
    private func createShadowLayer(color: UIColor, offset: CGSize, opacity: Float, radius: CGFloat) -> CAShapeLayer {
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: frame.height / 2).cgPath
        shadowLayer.fillColor = backgroundColor?.cgColor
        shadowLayer.masksToBounds = false
        shadowLayer.shadowColor = color.cgColor
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowOffset = offset
        shadowLayer.shadowRadius = radius
        return shadowLayer
    }
    
    private func addDropShadow() {
        let topLayer = createShadowLayer(
            color: .white,
            offset: CGSize(width: -2, height: -2),
            opacity: 15,
            radius: 4
        )
        topLayer.name = ShadowType.topShadow.rawValue
        
        let bottomLayer = createShadowLayer(
            color: .systemGray5,
            offset: CGSize(width: 2, height: 4),
            opacity: 12,
            radius: 4
        )
        bottomLayer.name = ShadowType.bottomShadow.rawValue
        
        layer.insertSublayer(topLayer, at: 0)
        layer.insertSublayer(bottomLayer, at: 0)
    }
    
    private func addInsertShadow() {
        innerShadow.name = ShadowType.innerShadow.rawValue
        innerShadow.isHidden = true
        innerShadow.backgroundColor = backgroundColor?.cgColor
        innerShadow.frame = bounds
        
        getInnerShadow(innerShadow)
    }
    
    private func setHiddenLayer(inner: Bool, top: Bool, bottom: Bool) {
        
        alpha = 1
        layer.sublayers?.forEach({ layer in
            switch layer.name {
            case ShadowType.innerShadow.rawValue:
                layer.isHidden = inner
            case ShadowType.topShadow.rawValue:
                layer.isHidden = top
            default:
                layer.isHidden = bottom
            }
        })
    }
    
}
