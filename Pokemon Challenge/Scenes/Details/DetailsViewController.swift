//
//  DetailsViewController.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private let detailsViewModel: DetailsViewmodeling
    
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
    }
    
}

extension DetailsViewController: ViewCode {
    func setupViews() {
        view.addSubview(headerComponent)
        view.addSubview(attributesComponent)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerComponent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            attributesComponent.topAnchor.constraint(equalTo: headerComponent.bottomAnchor, constant: 24),
            attributesComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            attributesComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            attributesComponent.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
}
