//
//  PokemonsCoordinator.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import UIKit

protocol PokemonsCoordinating: AnyObject {
    var controller: UIViewController? { get }
    func goToDetails(pokemon: Species)
}

class PokemonsCoordinator: PokemonsCoordinating {
    weak var controller: UIViewController?
    
    func goToDetails(pokemon: Species) {
        let detailsViewController = DetailsFactory.makeModule(pokemon: pokemon)
        self.controller?.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
