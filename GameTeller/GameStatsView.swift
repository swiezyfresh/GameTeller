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
    var gameLikesBar : UILabel?
    
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
    
    @IBInspectable var gameLBTextColor: UIColor = UIColor.whiteColor() {
    
        didSet {
            gameLikesBar?.textColor = gameLBTextColor
        }
        
    }
    
    override func prepareForInterfaceBuilder() {
        gameTitleLabel?.text = "Test Game"
        gameLikesBar?.text = "70%"
    }
    
    
    func setup() {
        
        // MARK: - UIComponents Design Setup
        
        gameTitleLabel = GTLabel()
        gameLikesBar = UILabel()
        
        // Text
        gameTitleLabel?.text = "Test"
        gameTitleLabel?.textColor = gameTLTextColor
        
        gameLikesBar?.text = "70%"
        gameLikesBar?.textColor = gameLBTextColor
        
        // Background
        gameTitleLabel?.backgroundColor = gameTLBGColor
        
        gameLikesBar?.backgroundColor = UIColor(hex: lightGreen2)
        
        // Insets
        gameTitleLabel?.leftInset = 5
        gameTitleLabel?.rightInset = 5
        
        
        // MARK: - UIComponents Constraints Setup
        
        
        // Adding UIComponents to view
        
        gameTitleLabel?.translatesAutoresizingMaskIntoConstraints = false
        gameLikesBar?.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(gameTitleLabel!)
        self.addSubview(gameLikesBar!)
        
        
        // Adding constraints to UIComponents
        
        // GameTitleLabel
        
        let titleTop = gameTitleLabel?.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: 5)
        let titleXCenter = gameTitleLabel?.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor)
        
        // GameLikesBar
        
        let likesBarTop = gameLikesBar?.topAnchor.constraintEqualToAnchor(gameTitleLabel?.bottomAnchor, constant: 7)
        let likesBarLeft = gameLikesBar?.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: 0)
        let likesBarBot = gameLikesBar?.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor, constant: 0)

        let likesBarWidthPercentages = self.bounds.size.width * 0.7
        let likesBarWidth = gameLikesBar?.widthAnchor.constraintEqualToConstant(likesBarWidthPercentages)
        
        print(likesBarWidthPercentages)
        
        // Activating all constraints
        
        let allConstraints = [titleXCenter!, titleTop!, likesBarBot!, likesBarLeft!, likesBarTop!, likesBarWidth!]
        
        NSLayoutConstraint.activateConstraints(allConstraints)
        
    }
    
}
