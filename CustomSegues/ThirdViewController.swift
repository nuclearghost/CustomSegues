//
//  ThirdViewController.swift
//  CustomSegues
//
//  Created by Mark Meyer on 3/13/15.
//  Copyright (c) 2015 Sharethrough. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        var swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showFirstViewController")
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    func showFirstViewController() {
        self.performSegueWithIdentifier("idSecondSegueUnwind", sender: self)
    }
}
