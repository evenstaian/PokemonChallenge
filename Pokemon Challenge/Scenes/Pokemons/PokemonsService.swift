//
//  PokemonsService.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import Foundation

struct SpeciesResponse: Decodable {
    let count: Int
    let results: [Species]
}

struct Species: Decodable {
    let name: String
    let url: String
}

protocol PokemonsServicing {
    var API: APIRequesting {get set}
    func getSpecies(offset: Int?, limit: Int?, completion: @escaping (Result<SpeciesResponse, NetworkError>) -> Void)
}

class PokemonsService: PokemonsServicing {
    var API: APIRequesting
    
    init(API: APIRequesting){
        self.API = API
    }
    
    func getSpecies(offset: Int?, limit: Int?, completion: @escaping (Result<SpeciesResponse, NetworkError>) -> Void) {
        self.API.getSpecies(offset: offset, limit: limit) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
