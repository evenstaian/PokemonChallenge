//
//  DetailsViewController.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private let detailsViewModel: DetailsViewmodeling
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var headerComponent: DetailsHeaderComponent = {
        let view = DetailsHeaderComponent()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var attributesComponent: DetailsAttributesComponent = {
        let view = DetailsAttributesComponent()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var evolutionChainComponent: DetailsEvolutionChain = {
        let view = DetailsEvolutionChain()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(detailsViewModel: DetailsViewmodeling) {
        self.detailsViewModel = detailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        
        headerComponent.configure(with: (detailsViewModel as! DetailsViewModel).pokemon)
        
        self.detailsViewModel.viewDidLoad()
        
        self.detailsViewModel.onDetailsUpdated = { [weak self] details in
            self?.attributesComponent.configure(with: details)
        }
        
        self.detailsViewModel.onEvolutionChainDetailsUpdated = { [weak self] evolutionChainDetails in
            self?.evolutionChainComponent.configure(with: evolutionChainDetails.chain)
        }
    }
}

extension DetailsViewController: ViewCode {
    func setupViews() {
        view.addSubview(scrollView)
        view.addSubview(evolutionChainComponent)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(headerComponent)
        contentView.addSubview(attributesComponent)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: evolutionChainComponent.topAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: attributesComponent.bottomAnchor, constant: 16),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            headerComponent.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerComponent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerComponent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            attributesComponent.topAnchor.constraint(equalTo: headerComponent.bottomAnchor, constant: 24),
            attributesComponent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            attributesComponent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            attributesComponent.bottomAnchor.constraint(equalTo: evolutionChainComponent.topAnchor, constant: -16),
            
            evolutionChainComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            evolutionChainComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            evolutionChainComponent.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            evolutionChainComponent.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
}
