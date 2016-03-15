//
//  GameStatsView.swift
//  GameTeller
//
//  Created by Krystian Gontarek on 15.03.2016.
//  Copyright © 2016 DevCrew. All rights reserved.
//

import UIKit

@IBDesignable class GameStatsView : UIView {
    
    var gameTitleLabel : UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    // MARK: - Inspectable Properties
    
    @IBInspectable var gameTLTextColor: UIColor? = UIColor.whiteColor() {
        
        didSet {
            gameTitleLabel?.textColor = gameTLTextColor
        }
        
    }
    
    override func prepareForInterfaceBuilder() {
        gameTitleLabel?.text = "Test Game"
    }
    
    
    func setup() {
        
        gameTitleLabel = UILabel()
        gameTitleLabel?.text = "Test"
        gameTitleLabel?.textColor = UIColor.blackColor()
        
        gameTitleLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(gameTitleLabel!)
        
        let titleXCenter = gameTitleLabel?.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor)
        let titleYCenter = gameTitleLabel?.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor)
        
        let allConstraints = [titleXCenter!, titleYCenter!]
        
        NSLayoutConstraint.activateConstraints(allConstraints)
        
    }
    
}
