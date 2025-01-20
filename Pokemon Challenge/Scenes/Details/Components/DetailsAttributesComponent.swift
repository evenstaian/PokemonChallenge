//
//  DetailsAttributesComponent.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import UIKit

class DetailsAttributesComponent: UIView {
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.text = "Learn more about this amazing Pokémon!"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with details: SpeciesDetails) {
        contentStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        contentStack.addArrangedSubview(messageLabel)
        
        addAttribute(title: "Base Happiness", value: "\(details.base_happiness)")
        addAttribute(title: "Capture Rate", value: "\(details.capture_rate)")
        addAttribute(title: "Color", value: details.color.name.capitalized)
        addAttribute(title: "Egg Groups", value: details.egg_groups.map { $0.name.capitalized }.joined(separator: ", "))
        addAttribute(title: "Growth Rate", value: details.growth_rate.name.capitalized)
        addAttribute(title: "Habitat", value: details.habitat.name.capitalized)
        
        if details.is_legendary {
            addAttribute(title: "Type", value: "Legendary")
        } else if details.is_mythical {
            addAttribute(title: "Type", value: "Mythical")
        } else {
            addAttribute(title: "Type", value: "Normal")
        }
        
        if let englishGenus = details.genera.first(where: { $0.language.name == "en" }) {
            addAttribute(title: "Classification", value: englishGenus.genus)
        }
    }
    
    private func addAttribute(title: String, value: String) {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        titleLabel.textColor = .secondaryLabel
        titleLabel.text = title
        
        let valueLabel = UILabel()
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        valueLabel.textColor = .label
        valueLabel.text = value
        
        container.addSubview(titleLabel)
        container.addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            
            valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            valueLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
        
        contentStack.addArrangedSubview(container)
    }
}

extension DetailsAttributesComponent: ViewCode {
    func setupViews() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        
        addSubview(scrollView)
        scrollView.addSubview(contentStack)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentStack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            contentStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            contentStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            contentStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            contentStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
    }
}

