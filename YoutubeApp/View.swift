//
//  View.swift
//  YoutubeApp
//
//  Created by Pradeep on 04/01/18.
//  Copyright © 2018 Siddharth. All rights reserved.
//

import UIKit

extension UIView
{
    func addConstraintsWithFormat(format : String, views : [UIView])
    {
        var viewDictionary = [String : UIView]()
        for (index, view) in views.enumerate()
        {
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDictionary["v\(index)"] = view
        }
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
    }
}