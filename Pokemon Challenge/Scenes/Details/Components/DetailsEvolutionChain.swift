//
//  DetailsEvolutionChain.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import UIKit

class DetailsEvolutionChain: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Evolution Chain"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with chain: ChainLink) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        addPokemonToChain(pokemon: chain.species)
        
        var currentLink = chain
        while let nextEvolution = currentLink.evolvesTo.first {
            let levelText = nextEvolution.evolutionDetails?.first?.minLevel != nil ? 
                "Lvl \(nextEvolution.evolutionDetails!.first!.minLevel!)" : "???"
            addArrow(withText: levelText)
            
            addPokemonToChain(pokemon: nextEvolution.species)
            currentLink = nextEvolution
        }
    }
    
    private func addPokemonToChain(pokemon: Species) {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if let id = Extracters.extractPokemonId(from: pokemon.url) {
            let imageStore = ImageStore()
            let imageUrlString = "\(ApiConstants.imagesURL)\(id).png"
            if let imageUrl = URL(string: imageUrlString) {
                imageStore.fetch(for: imageUrl) { [weak self] imageData, _ in
                    DispatchQueue.main.async {
                        imageView.image = imageData
                    }
                }
            }
        }
        
        let nameLabel = UILabel()
        nameLabel.text = pokemon.name.capitalized
        nameLabel.font = .systemFont(ofSize: 14, weight: .medium)
        nameLabel.textAlignment = .center
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(imageView)
        container.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: container.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            nameLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            
            container.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        stackView.addArrangedSubview(container)
    }
    
    private func addArrow(withText text: String) {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let arrowLabel = UILabel()
        arrowLabel.text = "→"
        arrowLabel.font = .systemFont(ofSize: 24, weight: .bold)
        arrowLabel.textColor = .white
        arrowLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let levelLabel = UILabel()
        levelLabel.text = text
        levelLabel.font = .systemFont(ofSize: 12)
        levelLabel.textAlignment = .center
        levelLabel.textColor = .white
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(arrowLabel)
        container.addSubview(levelLabel)
        
        NSLayoutConstraint.activate([
            arrowLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: -10),
            arrowLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            
            levelLabel.topAnchor.constraint(equalTo: arrowLabel.bottomAnchor),
            levelLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            
            container.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        stackView.addArrangedSubview(container)
    }
}

extension DetailsEvolutionChain: ViewCode {
    func setupViews() {
        backgroundColor = .black.withAlphaComponent(0.7)
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(blurView)
        
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: topAnchor),
            blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        addSubview(titleLabel)
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
}

