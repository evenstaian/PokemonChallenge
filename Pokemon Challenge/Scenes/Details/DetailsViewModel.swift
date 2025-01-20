//
//  DetailsViewModel.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

// To respect Dependency Injection I created this abstraction, to not implement concret class ViewModel
protocol DetailsViewmodeling : AnyObject {
    var onDetailsUpdated: ((SpeciesDetails) -> Void)? { get set }
    func viewDidLoad()
    func getSpeciesDetails(id: Int?)
}

class DetailsViewModel: DetailsViewmodeling {
    let pokemon: Species
    let service: DetailsServicing
    var onDetailsUpdated: ((SpeciesDetails) -> Void)?
    
    init(pokemon: Species, service: DetailsService){
        self.pokemon = pokemon
        self.service = service
    }
    
    func viewDidLoad() {
        getSpeciesDetails(id: self.pokemon.id)
    }
    
    func getSpeciesDetails(id: Int?) {
        guard let id else { return }
        
        self.service.getSpeciesDetails(id: id) { result in
            switch result {
            case .success(let response):
                self.onDetailsUpdated?(response)
            case .failure(let error):
                print("Error fetching pokemon details: \(error)")
            }
        }
    }
}
