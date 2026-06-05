//
//  MarginGuides.swift
//  1-Examples
//
//  Created by Akshat Chaturvedi on 05/06/26.
//  Copyright © 2026 Jonathan Rasmusson. All rights reserved.
//

import Foundation
import UIKit

class MarginGuides: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews() {
        
        // create controls
        let leadingGuide = UILayoutGuide()
        let okButton = makeButton(withText: "Ok", color: UIColor.darkBlue)
        let middleGuide = UILayoutGuide()
        let cancelButton = makeButton(withText: "Cancel", color: UIColor.darkGreen)
        let trailingGuide = UILayoutGuide()
        
        // add subviews & layoutguide
        
        view.addSubview(okButton)
        view.addSubview(cancelButton)
        view.addLayoutGuide(leadingGuide)
        view.addLayoutGuide(middleGuide)
        view.addLayoutGuide(trailingGuide)
        
    //    | leadingGudide | okbutton | middleGuide | cancelButton | Trailing guide
        
        // setup constraints
        
        let margins = view.layoutMarginsGuide // represent views margins
        
        // leading guide
        
        margins.leadingAnchor.constraint(equalTo: leadingGuide.leadingAnchor).isActive = true
        leadingGuide.trailingAnchor.constraint(equalTo: okButton.leadingAnchor).isActive = true
        
        // middle guide
        okButton.trailingAnchor.constraint(equalTo: middleGuide.leadingAnchor).isActive = true
        middleGuide.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor).isActive = true
        
        // trailing guide
        
        cancelButton.trailingAnchor.constraint(equalTo: trailingGuide.leadingAnchor).isActive = true
        trailingGuide.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        // ok button equal width
        
        // we have never set the width , so does it comes from
        // So the buttons get their width from their intrinsic content size.
        
        okButton.widthAnchor.constraint(equalTo: cancelButton.widthAnchor).isActive = true
        
        // spacer equal widths
        
        // Since equality constraints are bidirectional, these statements are equivalent:
        // leadingGuide.width = middleGuide.width
       //  middleGuide.width = leadingGuide.width
        
//        How do the guides get their widths?
//
//        Suppose:
//
//        Layout margins leave 20 pts on each side.
//        View width = 390 pts.
//        Available width:
//
//        390 - 20 - 20
//        = 350 pts
        // x + 90 + x + 90 + x = 350
        leadingGuide.widthAnchor.constraint(equalTo: middleGuide.widthAnchor).isActive = true
        leadingGuide.widthAnchor.constraint(equalTo: trailingGuide.widthAnchor).isActive = true
        
        // vertical positions
        
        leadingGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        middleGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        trailingGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        okButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cancelButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // giving layout guide as default height
        
        leadingGuide.heightAnchor.constraint(equalToConstant: 1).isActive = true
        middleGuide.heightAnchor.constraint(equalTo: leadingGuide.heightAnchor).isActive = true
        trailingGuide.heightAnchor.constraint(equalTo: leadingGuide.heightAnchor).isActive = true
        
        
    }
}
