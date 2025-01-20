//
//  Extracters.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

class Extracters {
    static func extractPokemonId(from url: String) -> String? {
        let components = url.split(separator: "/")
        return components.last.map(String.init)
    }
}
