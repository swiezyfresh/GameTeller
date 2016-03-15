//
//  GameStatsView.swift
//  GameTeller
//
//  Created by Krystian Gontarek on 15.03.2016.
//  Copyright © 2016 DevCrew. All rights reserved.
//

import UIKit

@IBDesignable class GameStatsView : UIView {
    
    var gameTitleLabel : GTLabel?
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    // MARK: - Inspectable Properties
    
    @IBInspectable var gameTLTextColor: UIColor = UIColor.whiteColor() {
        
        didSet {
            gameTitleLabel?.textColor = gameTLTextColor
        }
        
    }
    
    @IBInspectable var gameTLBGColor: UIColor = UIColor(hex: titleBGGrey) {
        
        didSet {
            gameTitleLabel?.backgroundColor = gameTLBGColor
        }
        
    }
    
    override func prepareForInterfaceBuilder() {
        gameTitleLabel?.text = "Test Game"
    }
    
    
    func setup() {
        
        // MARK: - UIComponents Design Setup
        
        gameTitleLabel = GTLabel()
        
        // Text
        gameTitleLabel?.text = "Test"
        gameTitleLabel?.textColor = gameTLTextColor
        
        // Background
        gameTitleLabel?.backgroundColor = gameTLBGColor
        
        // Insets
        gameTitleLabel?.leftInset = 5
        gameTitleLabel?.rightInset = 5
        
        // MARK: - UIComponents Constraints Setup
        
        // Adding UIComponents to view
        
        gameTitleLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(gameTitleLabel!)
        
        // GameTitleLabel
        
        let titleXCenter = gameTitleLabel?.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor)
        let titleYCenter = gameTitleLabel?.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor)
        
        //
        
        
        // Activating all constraints
        
        let allConstraints = [titleXCenter!, titleYCenter!]
        
        NSLayoutConstraint.activateConstraints(allConstraints)
        
    }
    
}
