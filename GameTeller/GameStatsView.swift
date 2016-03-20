//
//  GameStatsView.swift
//  GameTeller
//
//  Created by Krystian Gontarek on 15.03.2016.
//  Copyright © 2016 DevCrew. All rights reserved.
//

import UIKit

@IBDesignable class GameStatsView : UIView {
    
    var gameTitleLabel : GTLabel? = GTLabel()
    var gameLikesBar : UILabel? = UILabel()
    var gameDislikesBar : UILabel? = UILabel()
    var likesBarWidth : NSLayoutConstraint?
    var dislikesBarWidth : NSLayoutConstraint?
    var game: Game? {
        
        didSet {
            gameTitleLabel!.text = game?.name
        }
        
    }
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupLayout()
    }
    
    // MARK: - Update UIComponents Constraints
    
    override func updateConstraints() {
        setupConstraints()
        super.updateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        animateBars()
        printValues()
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
    
    // MARK: - Preparing UIComponents values for interface builder
    
    override func prepareForInterfaceBuilder() {
        gameTitleLabel?.text = "Test Game"
        gameLikesBar?.text = "70%"
        gameDislikesBar?.text = "30%"
    }
    
    // MARK: - UIComponents Design Setup
    
    func setupLayout() {
        
        // Text
        gameTitleLabel?.text = game?.name
        gameTitleLabel?.textColor = gameTLTextColor
        
        gameLikesBar?.text = ""
        gameLikesBar?.textColor = gameLBTextColor
        gameDislikesBar?.text = ""
        gameDislikesBar?.textColor = gameDBTextColor
        
        // Background
        gameTitleLabel?.backgroundColor = gameTLBGColor
        gameLikesBar?.backgroundColor = UIColor(hex: lightGreen2)
        gameDislikesBar?.backgroundColor = UIColor(hex: dislikeRed)
        
        // Alignment
        gameTitleLabel?.textAlignment = .Center
        gameLikesBar?.textAlignment = .Center
        gameDislikesBar?.textAlignment = .Center
        
        // Insets
        gameTitleLabel?.leftInset = 5
        gameTitleLabel?.rightInset = 5
        
    }
    
    // MARK: - UIComponents Constraints Setup

    func setupConstraints() {
        
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
            
            likesBarWidth = gameLikesBar?.widthAnchor.constraintEqualToConstant(0)
            dislikesBarWidth = gameDislikesBar?.widthAnchor.constraintEqualToConstant(0)
            
        #else
            
            // Declaring static widths of bars for interface builder
            
            likesBarWidth = gameLikesBar?.widthAnchor.constraintEqualToConstant(250)
            dislikesBarWidth = gameDislikesBar?.widthAnchor.constraintEqualToConstant(150)
            
        #endif
        
        
        // Activating all constraints
        
        let allConstraints = [titleXCenter!, titleTop!, likesBarBot!, likesBarLeft!, likesBarWidth!, dislikesBarWidth!, dislikesBarRight!, dislikesBarBot!, likesBarTop!, dislikesBarTop!]
        
        NSLayoutConstraint.activateConstraints(allConstraints)
        
        self.layoutIfNeeded()

    }
    
    // MARK: - UIComponents Animation Functions
    
    func animateBars() {
        
        // Declaring widths of bars for animation completed
        
        let likesBarWidthPercentages = self.bounds.size.width * CGFloat(game!.likesPercentage / 100)
        likesBarWidth?.constant = likesBarWidthPercentages
        
        let dislikesBarWidthPercentages = self.bounds.size.width * CGFloat(game!.dislikesPercentage / 100)
        dislikesBarWidth?.constant = dislikesBarWidthPercentages
        
        // Animating the width
        
        UIView.animateWithDuration(1.0, delay: 0.5, options: [], animations: {
            self.layoutIfNeeded()
            }, completion: nil)
    }
    
    // MARK: - Printing screen sizes
    
    func updateValues() {
        gameLikesBar?.text = "\(game!.likesPercentageText)"
        gameDislikesBar?.text = "\(game!.dislikesPercentageText)"
        
    }
    
    func printValues() {
        
        let likesBarWidthPercentages = self.bounds.size.width * CGFloat(game!.likesPercentage / 100)
        let dislikesBarWidthPercentages = self.bounds.size.width * CGFloat(game!.dislikesPercentage / 100)
        
        print("Likes: \(likesBarWidthPercentages)")
        print("Dislikes: \(dislikesBarWidthPercentages)")
        print("Frame: \(self.frame.size.width)")
        print("Bounds: \(self.bounds.size.width)")
        print("Screen: \(UIScreen.mainScreen().bounds.size.width)")
        
    }
    
}
