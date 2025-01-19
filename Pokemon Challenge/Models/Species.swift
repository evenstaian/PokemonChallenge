//
//  Species.swift
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
