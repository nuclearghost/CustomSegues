//
//  FirstCustomSegue.swift
//  CustomSegues
//
//  Created by Mark Meyer on 3/13/15.
//  Copyright (c) 2015 Sharethrough. All rights reserved.
//

import UIKit

class FirstCustomSegue: UIStoryboardSegue {

    override func perform() {
        var firstVCView = self.sourceViewController.view as UIView!
        var secondVCView = self.destinationViewController.view as UIView!

        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height

        secondVCView.frame = CGRectMake(0.0, screenHeight, screenWidth, screenHeight)

        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(secondVCView, aboveSubview: firstVCView)

        // Animate the transition.
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0.0, -screenHeight)
            secondVCView.frame = CGRectOffset(secondVCView.frame, 0.0, -screenHeight)

            }) { (Finished) -> Void in
                self.sourceViewController.presentViewController(self.destinationViewController as UIViewController,
                    animated: false,
                    completion: nil)
        }
    }
}
