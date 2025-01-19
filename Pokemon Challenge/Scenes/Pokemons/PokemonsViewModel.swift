//
//  PokemonsViewModel.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//


// To respect Dependency Injection I created this abstraction, to not implement concret class ViewModel
protocol PokemonsViewmodeling: AnyObject {
    func viewDidLoad()
    var onPokemonsUpdated: (([Species]) -> Void)? { get set }
}

class PokemonsViewModel: PokemonsViewmodeling {
    
    private let service: PokemonsServicing
    var onPokemonsUpdated: (([Species]) -> Void)?
    
    init(service: PokemonsServicing){
        self.service = service
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
}
