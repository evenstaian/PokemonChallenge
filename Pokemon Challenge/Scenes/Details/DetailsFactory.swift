//
//  DetailsFactory.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import UIKit

enum DetailsFactory {
    static func makeModule(pokemon: Species) -> UIViewController {
        let API = ApiRequests()
        let service = DetailsService(API: API)
        let viewModel = DetailsViewModel(pokemon: pokemon, service: service)
        let controller = DetailsViewController(detailsViewModel: viewModel)
        return controller
    }
}
