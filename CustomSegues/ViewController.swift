//
//  ViewController.swift
//  CustomSegues
//
//  Created by Mark Meyer on 3/13/15.
//  Copyright (c) 2015 Sharethrough. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showSecondViewController")
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeGestureRecognizer)

        var swipeGestureRecognizer2: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showThirdViewController")
        swipeGestureRecognizer2.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeGestureRecognizer2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showSecondViewController() {
        self.performSegueWithIdentifier("idFirstSegue", sender: self)
    }

    func showThirdViewController() {
        self.performSegueWithIdentifier("idSecondSegue", sender: self)
    }

    @IBAction func returnFromSegueActions(sender: UIStoryboardSegue) {
        if sender.identifier == "idFirstSegueUnwind" {
            let originalColor = self.view.backgroundColor
            self.view.backgroundColor = UIColor.redColor()

            UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.view.backgroundColor = originalColor
            })
        }
    }

    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        if let id = identifier {
            if id == "idFirstSegueUnwind" {
                let unwindSegue = FirstCustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in

                })
                return unwindSegue
            } else if id == "idSecondSegueUnwind" {
                let unwindSegue = SecondCustomSegueUnwind(identifier: id,
                    source: fromViewController,
                    destination: toViewController,
                    performHandler: { () -> Void in

                })
                
                return unwindSegue
            }
        }

        return super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)
    }
}

