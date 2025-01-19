//
//  DetailsViewModel.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

// To respect Dependency Injection I created this abstraction, to not implement concret class ViewModel
protocol DetailsViewmodeling : AnyObject {
    func viewDidLoad()
}

class DetailsViewModel: DetailsViewmodeling {
    func viewDidLoad() {
        // TODO
    }
}
