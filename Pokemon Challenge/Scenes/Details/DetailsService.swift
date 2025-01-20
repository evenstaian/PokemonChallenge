//
//  DetailsService.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//
import Foundation

protocol DetailsServicing {
    var API: APIRequesting {get set}
    func getSpeciesDetails(id: Int, completion: @escaping (Result<SpeciesDetails, NetworkErrors>) -> Void)
    func getEvolutionChainDetails(urlString: String, completion: @escaping (Result<EvolutionChainDetails, NetworkErrors>) -> Void)
}

class DetailsService: DetailsServicing {
    var API: any APIRequesting
    
    init(API: any APIRequesting) {
        self.API = API
    }
    
    func getSpeciesDetails(id: Int, completion: @escaping (Result<SpeciesDetails, NetworkErrors>) -> Void) {
        self.API.getSpeciesDetails(id: id) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
    
    func getEvolutionChainDetails(urlString: String, completion: @escaping (Result<EvolutionChainDetails, NetworkErrors>) -> Void) {
        self.API.getEvolutionChain(urlString: urlString) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}

