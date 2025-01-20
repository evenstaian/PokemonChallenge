//
//  SpeciesDetails.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

struct SpeciesDetails: Decodable {
    let name: String
    let evolution_chain: EvolutionChain
    let base_happiness: Int
    let capture_rate: Int
    let color: PokemonColor
    let egg_groups: [EggGroup]
    let genera: [Genus]
    let growth_rate: GrowthRate
    let habitat: Habitat
    let is_legendary: Bool
    let is_mythical: Bool
}

struct EvolutionChain: Decodable {
    let url: String
}

struct PokemonColor: Decodable {
    let name: String
}

struct EggGroup: Decodable {
    let name: String
}

struct Genus: Decodable {
    let genus: String
    let language: Language
}

struct Language: Decodable {
    let name: String
}

struct GrowthRate: Decodable {
    let name: String
}

struct Habitat: Decodable {
    let name: String
}
