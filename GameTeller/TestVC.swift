//
//  TestVC.swift
//  GameTeller
//
//  Created by Krystian Gontarek on 19.03.2016.
//  Copyright © 2016 DevCrew. All rights reserved.
//

import UIKit

class TestVC: UIViewController {

    @IBOutlet weak var testView: GameStatsView!

    
    override func viewDidAppear(animated: Bool) {
        testView.animateBars()
    }
    
}
