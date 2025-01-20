//
//  PokemonsViewController.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import UIKit

class PokemonsViewController: UIViewController {
    
    private let viewModel: PokemonsViewModel
    private let pokemonsCollectionDataSource = PokemonCollectionDataSource()
    
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
    
    init(viewModel: PokemonsViewModel){
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
        
        self.viewModel.viewDidLoad()
    }
    
    private func setupClicks() {
        pokemonsCollectionDataSource.didClick = { pokemon in
            self.viewModel.goToDetails(pokemon: pokemon)
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
        NSLayoutConstraint.activate([
            headerComponent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            listComponent.topAnchor.constraint(equalTo: headerComponent.bottomAnchor),
            listComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
