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
    let evolvesTo: [ChainLink]?
}
