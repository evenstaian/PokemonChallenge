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
        let coordinator = PokemonsCoordinator()
        let viewModel = PokemonsViewModel(service: service, coordinator: coordinator)
        let controller = PokemonsViewController(viewModel: viewModel)
        coordinator.controller = controller
        return controller
    }
}
