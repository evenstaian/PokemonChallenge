//
//  SpeciesDetails.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

struct SpeciesDetails: Decodable {
    let name: String
    let evolution_chain: EvolutionChain
}

struct EvolutionChain: Decodable {
    let url: String
}
