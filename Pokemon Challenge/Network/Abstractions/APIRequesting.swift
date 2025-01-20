//
//  APIRequesting.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

protocol APIRequesting {
    func getSpecies(offset: Int?, limit: Int?, completion: @escaping (Result<SpeciesResponse, NetworkErrors>) -> Void)
    func getSpeciesDetails(id: Int, completion: @escaping (Result<SpeciesDetails, NetworkErrors>) -> Void)
    func getEvolutionChain(urlString: String, completion: @escaping (Result<EvolutionChainDetails, NetworkErrors>) -> Void)
}
