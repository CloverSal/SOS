//
//  Extensions.swift
//  SOS
//
//  Created by Ga Wai Lau on 14/02/2018.
//  Copyright © 2018 Ga Wai Lau. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    //MARK: Constraints
    func addConstraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDictionary = [String : UIView]()
        
        //Returns a sequence of pairs (n, x), where n represents a consecutive integer starting at zero, and x represents an element of the sequence.
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
