//
//  HeaderComponent.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import UIKit

class HeaderComponent: UIView {
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pokemon-logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderComponent: ViewCode {
    func setupViews() {
        addSubview(logoImageView)
        backgroundColor = .white
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            logoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            logoImageView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

