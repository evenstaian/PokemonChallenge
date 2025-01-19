//
//  PokemonsViewModel.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//


// To respect Dependency Injection I created this abstraction, to not implement concret class ViewModel
protocol PokemonsViewmodeling : AnyObject {
    func viewDidLoad()
}

class PokemonsViewModel: PokemonsViewmodeling {
    
    private let service: PokemonsServicing
    
    init(service: PokemonsServicing){
        self.service = service
    }
    
    func viewDidLoad() {
        service.getSpecies(offset: nil, limit: nil) { result in
            print("## Result of Pokemons: \(result)")
        }
    }
}
