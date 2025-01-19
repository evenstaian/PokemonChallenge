//
//  DetailsFactory.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import UIKit

enum DetailsFactory {
    static func makeModule(pokemon: Species) -> UIViewController {
        let controller = DetailsViewController()
        return controller
    }
}
