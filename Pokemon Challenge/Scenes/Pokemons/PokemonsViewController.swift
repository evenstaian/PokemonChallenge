//
//  PokemonsViewController.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import UIKit

class PokemonsViewController: UIViewController {
    
    private let viewModel: PokemonsViewmodeling
    private let pokemonsCollectionDataSource = PokemonCollectionDataSource()
    
    private var portraitConstraints : [NSLayoutConstraint]?
    private var landscapeConstraints : [NSLayoutConstraint]?
    
    private lazy var headerComponent: HeaderComponent = {
        let header = HeaderComponent()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    private lazy var listComponent: ListComponent = {
        let list = ListComponent()
        list.collectionView.delegate = pokemonsCollectionDataSource
        list.collectionView.dataSource = pokemonsCollectionDataSource
        list.translatesAutoresizingMaskIntoConstraints = false
        return list
    }()
    
    init(viewModel: PokemonsViewmodeling){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupClicks()
        
        viewModel.onPokemonsUpdated = { [weak self] pokemons in
            self?.pokemonsCollectionDataSource.updatePokemons(pokemons)
            self?.listComponent.collectionView.reloadData()
            self?.listComponent.refresher.endRefreshing()
        }
        
        viewModel.onRequestError = { [weak self] errorMessage in
            self?.showErrorAlert(message: errorMessage)
        }
        
        self.viewModel.viewDidLoad()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        if let portraitConstraints = portraitConstraints, let landscapeConstraints = landscapeConstraints {
            coordinator.animate { [weak self] _ in
                self?.updateConstraintsWithOrientation(portraitConstraints, landscapeConstraints)
            }
        }
    }
    
    private func setupClicks() {
        pokemonsCollectionDataSource.didClick = { pokemon in
            self.viewModel.goToDetails(pokemon: pokemon)
        }
        
        pokemonsCollectionDataSource.didListFinishScroll = {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.viewModel.getSpecies(offset: nil, limit: nil)
            }
        }
        
        listComponent.refresher.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    }
    
    @objc private func handleRefresh() {
        viewModel.viewDidLoad()
    }
}

extension PokemonsViewController: ViewCode {
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(headerComponent)
        view.addSubview(listComponent)
    }
    
    func setupConstraints() {
        portraitConstraints = [
            headerComponent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            listComponent.topAnchor.constraint(equalTo: headerComponent.bottomAnchor),
            listComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        landscapeConstraints = [
            headerComponent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            headerComponent.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            listComponent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listComponent.leadingAnchor.constraint(equalTo: headerComponent.trailingAnchor),
            listComponent.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            listComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        if let _ = portraitConstraints, let _ = landscapeConstraints {
            updateConstraintsWithOrientation(portraitConstraints!, landscapeConstraints!)
        }
    }
}

extension PokemonsViewController {
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok, gotcha!", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
