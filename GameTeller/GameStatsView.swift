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
    var gameDislikesBar : UILabel?
    
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
    
    @IBInspectable var gameDBTextColor: UIColor = UIColor.whiteColor() {
        
        didSet {
            gameDislikesBar?.textColor = gameDBTextColor
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
        gameDislikesBar = UILabel()
        
        // Text
        gameTitleLabel?.text = "Test"
        gameTitleLabel?.textColor = gameTLTextColor
        
        gameLikesBar?.text = "70%"
        gameLikesBar?.textColor = gameLBTextColor
        gameDislikesBar?.text = "30%"
        gameDislikesBar?.textColor = gameDBTextColor
        
        // Background
        gameTitleLabel?.backgroundColor = gameTLBGColor
        
        gameLikesBar?.backgroundColor = UIColor(hex: lightGreen2)
        
        gameDislikesBar?.backgroundColor = UIColor(hex: dislikeRed)
        
        gameDislikesBar?.alpha = 0
        
        // Alignment
        
        gameTitleLabel?.textAlignment = .Center
        gameLikesBar?.textAlignment = .Center
        gameDislikesBar?.textAlignment = .Center
        
        // Insets
        gameTitleLabel?.leftInset = 5
        gameTitleLabel?.rightInset = 5
        
        
        // MARK: - UIComponents Constraints Setup
        
        
        // Adding UIComponents to view
        
        gameTitleLabel?.translatesAutoresizingMaskIntoConstraints = false
        gameLikesBar?.translatesAutoresizingMaskIntoConstraints = false
        gameDislikesBar?.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(gameTitleLabel!)
        self.addSubview(gameLikesBar!)
        self.addSubview(gameDislikesBar!)
        
        // Adding constraints to UIComponents
        
        
        // GameTitleLabel
        
        let titleTop = gameTitleLabel?.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: 5)
        let titleXCenter = gameTitleLabel?.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor)
        
        // GameLikesBar
        
        let likesBarTop = gameLikesBar?.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: 37)
        let likesBarLeft = gameLikesBar?.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: 0)
        let likesBarBot = gameLikesBar?.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor, constant: 0)
        
        // GameDislikesBar
        
        let dislikesBarTop = gameDislikesBar?.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: 37)
        let dislikesBarRight = gameDislikesBar?.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor, constant: 0)
        let dislikesBarBot = gameDislikesBar?.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor, constant: 0)

        
        #if !TARGET_INTERFACE_BUILDER
            
            let likesBarWidthPercentages = self.bounds.size.width * 0.7
            let likesBarWidth = gameLikesBar?.widthAnchor.constraintEqualToConstant(likesBarWidthPercentages)
            
            let dislikesBarWidthPercentages = self.bounds.size.width * 0.3
            let dislikesBarWidth = gameDislikesBar?.widthAnchor.constraintEqualToConstant(dislikesBarWidthPercentages)
            
            print(self.bounds.size.width)
            print(UIScreen.mainScreen().bounds.size.width)
            print(likesBarWidthPercentages)
            print(dislikesBarWidthPercentages)
            
        #else
            
            let likesBarWidth = gameLikesBar?.widthAnchor.constraintEqualToConstant(250)
            let dislikesBarWidth = gameDislikesBar?.widthAnchor.constraintEqualToConstant(150)

        #endif
        
        
        // Activating all constraints
        
        let allConstraints = [titleXCenter!, titleTop!, likesBarBot!, likesBarLeft!, likesBarWidth!, dislikesBarWidth!, dislikesBarRight!, dislikesBarBot!, likesBarTop!, dislikesBarTop!]
        
        NSLayoutConstraint.activateConstraints(allConstraints)
        
        self.layoutIfNeeded()
        
    }
    
}
