//
//  PokemonsViewController.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import UIKit

class PokemonsViewController: UIViewController {
    
    private let viewModel: PokemonsViewModel
    
    init(viewModel: PokemonsViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
    }
}

extension PokemonsViewController: ViewCode {
    func setupViews() {
        // TODO
    }
    
    func setupConstrants() {
        // TODO
    }
    
}
