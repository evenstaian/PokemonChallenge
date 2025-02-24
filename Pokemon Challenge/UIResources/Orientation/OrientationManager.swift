//
//  OrientationManager.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 20/01/25.
//

import UIKit

extension UIViewController {
    public func updateConstraintsWithOrientation(_ portraitConstraints:[NSLayoutConstraint], _ landscapeConstraints:[NSLayoutConstraint]) {
        var orientation : UIInterfaceOrientation = UIInterfaceOrientation.portrait
        
        if UIDevice.current.orientation.isLandscape {
            orientation = .landscapeLeft
        }
        
        if orientation.isLandscape {
                NSLayoutConstraint.deactivate(portraitConstraints)
                NSLayoutConstraint.activate(landscapeConstraints)
                self.view.layoutIfNeeded()
            self.updateViewConstraints()
            } else {
                NSLayoutConstraint.deactivate(landscapeConstraints)
                NSLayoutConstraint.activate(portraitConstraints)
                self.updateViewConstraints()
                self.view.layoutIfNeeded()
            }
        }
    
    public func isPortrait() -> Bool{
        return UIDevice.current.orientation.isPortrait
    }
}
