//
//  PokemonsService.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import Foundation

protocol PokemonsServicing {
    var API: APIRequesting {get set}
    func getSpecies(offset: Int?, limit: Int?, completion: @escaping (Result<SpeciesResponse, NetworkErrors>) -> Void)
}

class PokemonsService: PokemonsServicing {
    var API: APIRequesting
    
    init(API: APIRequesting){
        self.API = API
    }
    
    func getSpecies(offset: Int?, limit: Int?, completion: @escaping (Result<SpeciesResponse, NetworkErrors>) -> Void) {
        self.API.getSpecies(offset: offset, limit: limit) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
