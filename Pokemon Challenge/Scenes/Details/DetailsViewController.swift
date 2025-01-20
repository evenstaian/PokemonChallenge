//
//  DetailsViewController.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private let detailsViewModel: DetailsViewmodeling
    
    init(detailsViewModel: DetailsViewmodeling) {
        self.detailsViewModel = detailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.detailsViewModel.viewDidLoad()
        
        self.detailsViewModel.onDetailsUpdated = { [weak self] details in
            print(details)
        }
    }
    
}

extension DetailsViewController: ViewCode {
    func setupViews() {
        // TODO
    }
    
    func setupConstraints() {
        // TODO
    }
    
}
