//
//  DetailsHeaderComponent.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import UIKit

class DetailsHeaderComponent: UIView {
    private let imageSize: CGFloat = 120
    private let headerHeight: CGFloat = 152
    
    private lazy var pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = imageSize / 2
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemGray6
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with pokemon: Species) {
        nameLabel.text = pokemon.name.capitalized
        if let id = pokemon.id {
            let imageStore = ImageStore()
            let imageUrlString = "\(ApiConstants.imagesURL)\(id).png"
            if let imageUrl = URL(string: imageUrlString) {
                imageStore.fetch(for: imageUrl) { [weak self] imageData, _ in
                    DispatchQueue.main.async {
                        self?.pokemonImageView.image = imageData
                    }
                }
            }
        }
    }
}

extension DetailsHeaderComponent: ViewCode {
    func setupViews() {
        backgroundColor = .systemBackground
        addSubview(pokemonImageView)
        addSubview(nameLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: headerHeight),
            
            pokemonImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            pokemonImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            pokemonImageView.widthAnchor.constraint(equalToConstant: imageSize),
            pokemonImageView.heightAnchor.constraint(equalToConstant: imageSize),
            
            nameLabel.leadingAnchor.constraint(equalTo: pokemonImageView.trailingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: pokemonImageView.centerYAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}

