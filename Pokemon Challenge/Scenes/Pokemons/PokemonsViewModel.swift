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
    func getSpecies(offset: Int?, limit: Int?)
    func goToDetails(pokemon: Species)
}

class PokemonsViewModel: PokemonsViewmodeling {
    
    private let service: PokemonsServicing
    private let coordinator: PokemonsCoordinating
    var pokemons: [Species] = []
    var offset = 20
    var limit = 20
    
    var onPokemonsUpdated: (([Species]) -> Void)?
    
    init(service: PokemonsServicing, coordinator: PokemonsCoordinating){
        self.service = service
        self.coordinator = coordinator
    }
    
    func viewDidLoad() {
        offset = 0
        pokemons = []
        getSpecies(offset: offset, limit: nil)
    }
    
    func getSpecies(offset: Int?, limit: Int?) {
        self.offset = offset ?? self.offset + self.limit
        print(self.offset)
        service.getSpecies(offset: self.offset, limit: self.limit) { [weak self] result in
            switch result {
            case .success(let response):
                self?.pokemons.append(contentsOf: response.results)
                if let pokemons = self?.pokemons {
                    self?.onPokemonsUpdated?(pokemons)
                }
            case .failure(let error):
                print("Error fetching pokemons: \(error)")
            }
        }
    }
    
    func goToDetails(pokemon: Species) {
        self.coordinator.goToDetails(pokemon: pokemon)
    }
}
