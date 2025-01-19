//
//  PokemonsViewModel.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//


// To respect Dependency Injection I created this abstraction, to not implement concret class ViewModel
protocol PokemonsViewmodeling: AnyObject {
    var onPokemonsUpdated: (([Species]) -> Void)? { get set }
    func viewDidLoad()
    func goToDetails(pokemon: Species)
}

class PokemonsViewModel: PokemonsViewmodeling {
    
    private let service: PokemonsServicing
    private let coordinator: PokemonsCoordinating
    var onPokemonsUpdated: (([Species]) -> Void)?
    
    init(service: PokemonsServicing, coordinator: PokemonsCoordinating){
        self.service = service
        self.coordinator = coordinator
    }
    
    func viewDidLoad() {
        service.getSpecies(offset: nil, limit: nil) { [weak self] result in
            switch result {
            case .success(let response):
                self?.onPokemonsUpdated?(response.results)
            case .failure(let error):
                print("Error fetching pokemons: \(error)")
            }
        }
    }
    
    func goToDetails(pokemon: Species) {
        self.coordinator.goToDetails(pokemon: pokemon)
    }
}
