//
//  EvolutionChainDetails.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import Foundation

struct EvolutionChainDetails: Decodable {
    let chain: ChainLink
}

struct ChainLink: Decodable {
    let species: Species
    let evolvesTo: [ChainLink]
    let evolutionDetails: [EvolutionDetails]?
    
    enum CodingKeys: String, CodingKey {
        case species
        case evolvesTo = "evolves_to"
        case evolutionDetails = "evolution_details"
    }
}

struct EvolutionDetails: Decodable {
    let minLevel: Int?
    let trigger: Trigger
    
    enum CodingKeys: String, CodingKey {
        case minLevel = "min_level"
        case trigger
    }
}

struct Trigger: Decodable {
    let name: String
}
