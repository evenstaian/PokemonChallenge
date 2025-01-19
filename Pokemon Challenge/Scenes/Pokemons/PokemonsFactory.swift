//
//  PokemonsFactory.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import UIKit

enum PokemonsFactory {
    static func makeModule() -> UIViewController {
        let viewModel = PokemonsViewModel()
        let controller = PokemonsViewController(viewModel: viewModel)
        return controller
    }
}
