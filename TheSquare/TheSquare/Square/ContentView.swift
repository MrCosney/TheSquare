//
//  SquareView.swift
//  TheSquare
//
//  Created by Nikita Kuzmin on 02.11.2024.
//

import UIKit

final class ContentView: UIView {
    // MARK: - Subviews
    
    private let squareView: UIView = SquareView()
    
    // MARK: - Lyfecycle
    
    required init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private

private extension ContentView {
    func addSubviews() {
        addSubview(squareView)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            squareView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            squareView.centerYAnchor.constraint(equalTo: centerYAnchor),
            squareView.widthAnchor.constraint(equalToConstant: 125),
            squareView.heightAnchor.constraint(equalToConstant: 125)
        ])
    }
}
