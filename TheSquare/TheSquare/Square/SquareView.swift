//
//  SquareView.swift
//  TheSquare
//
//  Created by Nikita Kuzmin on 02.11.2024.
//

import UIKit

final class SquareView: UIView {
    
    // MARK: - Properties
    
    private enum Constants {
        static let animationDuration: CGFloat = 2.0
        static let mainGradientColor: UIColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        static let secondaryGradientColor: UIColor = #colorLiteral(red: 1, green: 0.80711025, blue: 0, alpha: 1)
    }
    
    // MARK: - Subviews
    
    private let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [Constants.mainGradientColor.cgColor, Constants.secondaryGradientColor.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        return layer
    }()
    
    private let gradientAnimation: CABasicAnimation = {
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = [Constants.mainGradientColor.cgColor, Constants.secondaryGradientColor.cgColor]
        animation.toValue = [Constants.secondaryGradientColor.cgColor, Constants.mainGradientColor.cgColor]
        animation.duration = Constants.animationDuration
        animation.repeatCount = .infinity
        animation.autoreverses = true
        return animation
    }()
    
    // MARK: - Lyfecycle
    
    required init() {
        super.init(frame: .zero)
        addSublayers()
        setupUI()
        setupAnimatedShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}

// MARK: - Private

private extension SquareView {
    func addSublayers() {
        gradientLayer.add(gradientAnimation, forKey: "gradientAnimation")
        layer.addSublayer(gradientLayer)
    }
    
    func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        gradientLayer.cornerRadius = 16.0
    }
    
    func setupAnimatedShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: -7, height: -7)
        layer.shadowRadius = 7
 
        UIView.animate(
            withDuration: Constants.animationDuration,
            delay: 0,
            options: [.repeat, .autoreverse],
            animations: { self.layer.shadowOffset = CGSize(width: 7, height: 7) }
        )
    }
}

