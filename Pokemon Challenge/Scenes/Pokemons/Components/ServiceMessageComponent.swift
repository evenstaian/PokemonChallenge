//
//  ServiceMessageComponent.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 20/01/25.
//

import UIKit

class ServiceMessageComponent: UICollectionReusableView, ViewCode {
    
    let kMessageLabelFontSize : CGFloat = 12
    let kMessageLabelTopMargin : CGFloat = 20
    let kMessageLabelLeadingMargin : CGFloat = 20
    let kMessageLabelTrailingMargin : CGFloat = -20
    let kMessageLabelBottomMargin : CGFloat = -20
    let kMessageLabelHeight : CGFloat = 50
    
    lazy var messageLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: kMessageLabelFontSize)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(messageLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: kMessageLabelTopMargin),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: kMessageLabelLeadingMargin),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: kMessageLabelTrailingMargin),
            messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: kMessageLabelBottomMargin),
            messageLabel.heightAnchor.constraint(equalToConstant: kMessageLabelHeight)
        ])
    }
}
