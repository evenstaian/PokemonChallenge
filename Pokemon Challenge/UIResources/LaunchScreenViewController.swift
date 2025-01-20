//
//  LaunchScreenViewController.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 20/01/25.
//

import UIKit

class LaunchScreenViewController: UIViewController, ViewCode {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "pokemon-logo"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        return imageView
    }()

    var onFinishAnimation: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateLogo()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(logoImageView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 0.5)
        ])
    }
    
    private func animateLogo() {
        UIView.animate(withDuration: 0.7, delay: 0.3, options: .curveEaseInOut) {
            self.logoImageView.transform = .identity
        } completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.onFinishAnimation?()
            }
        }
    }
}
