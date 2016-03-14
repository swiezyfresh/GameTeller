//
//  LoadingViewController.swift
//  GameTeller
//
//  Created by Krystian Gontarek on 12.02.2016.
//  Copyright © 2016 DevCrew. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet weak var circleView: CircleView!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var welcomeTimer : NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CALLING DESIGN FUNCTIONS
        
        self.view.basicBackgroundConfig(UIColor(hex: mainDark))
        circleView.viewController = self
        
        // Hide welcomeLabel
        self.welcomeLabel.alpha = 0
        
    }
    
    override func viewDidAppear(animated: Bool) {
        circleView.animateTo(1.0)
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        circleView.alpha = 0
        welcomeLabel.alpha = 1.0
        welcomeTimer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "closeViewController", userInfo: nil, repeats: false)
    }
    
    func closeViewController() {
        welcomeLabel.alpha = 0
        self.performSegueWithIdentifier("toAppSegue", sender: self)
    }


    
}

extension LoadingViewController {
    
    // DESIGN EXTENSION
    
    // Personalized Design Setup Functions
    

    
}