//
//  PokemonsFactory.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import UIKit

enum PokemonsFactory {
    static func makeModule() -> UIViewController {
        let API = MockAPIRequests()
        let service = PokemonsService(API: API)
        let viewModel = PokemonsViewModel(service: service)
        let controller = PokemonsViewController(viewModel: viewModel)
        return controller
    }
}
