//
//  GameRate.swift
//  GameTeller
//
//  Created by Krystian Gontarek on 17.02.2016.
//  Copyright © 2016 DevCrew. All rights reserved.
//

import UIKit

@IBDesignable class GameRateView : UIView {
    
    // MARK: - UIComponents Properties
    
    var gameTitleLabel : GTLabel! = GTLabel()
    var likeButton : UIButton! = UIButton()
    var skipButton : UIButton! = UIButton()
    var dislikeButton : UIButton! = UIButton()
    var game: Game? {
        
        didSet {
            gameTitleLabel.text = game?.name
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
    
    override func updateConstraints() {
        setupConstraints()
        super.updateConstraints()
    }
    
    // Interface builder defeault values for UI elements
    
    override func prepareForInterfaceBuilder() {
        self.gameTitleLabel.text = "Game"
    }
    
    // MARK: - UIComponents coloristic properties
    
    @IBInspectable var likeButtonBGColor : UIColor = UIColor(hex: lightGreen1) {
        didSet{
            likeButton.backgroundColor = likeButtonBGColor
        }
    }
    @IBInspectable var dislikeButtonBGColor : UIColor = UIColor(hex: dislikeRed) {
        didSet{
            dislikeButton.backgroundColor = dislikeButtonBGColor
        }
    }
    
    @IBInspectable var skipButtonBGColor : UIColor = UIColor.whiteColor() {
        didSet{
            skipButton.backgroundColor = skipButtonBGColor
        }
    }
    
    @IBInspectable var skipTextColor : UIColor = UIColor(hex: lightGreen2) {
        didSet{
            skipButton.setTitleColor(skipTextColor, forState: .Normal)
        }
    }
    
    @IBInspectable var gameTitleTextColor : UIColor = UIColor.whiteColor() {
        didSet{
            gameTitleLabel.textColor = gameTitleTextColor
        }
    }
    
    @IBInspectable var gameTitleBGColor : UIColor = UIColor(hex: titleBGGrey) {
        didSet{
            gameTitleLabel.backgroundColor = gameTitleBGColor
        }
    }
    
    // MARK: - UIComponents Design Configuration
    func setupLayout() {
        
        // Basic UIComponents Setup - text, background, insets, color, cornerRadius, highlight
        
        // Text
        
        gameTitleLabel.text = game?.name
        likeButton.setTitle("Like", forState: .Normal)
        skipButton.setTitle("Skip", forState: .Normal)
        dislikeButton.setTitle("Dislike", forState: .Normal)
        
        // Color
        
        likeButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        skipButton.setTitleColor(skipTextColor, forState: .Normal)
        dislikeButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        gameTitleLabel.textColor = gameTitleTextColor

        // Background
        
        gameTitleLabel.backgroundColor = gameTitleBGColor
        likeButton.backgroundColor = likeButtonBGColor
        skipButton.backgroundColor = skipButtonBGColor
        dislikeButton.backgroundColor = dislikeButtonBGColor
        
        // Insets
        
        gameTitleLabel.textAlignment = .Center
        gameTitleLabel.leftInset = 5
        gameTitleLabel.rightInset = 5
        
        // cornerRadius
        
        likeButton.layer.cornerRadius = 8
        dislikeButton.layer.cornerRadius = 8
        skipButton.layer.cornerRadius = 8
        
        // Highlight
        
        skipButton.setTitleColor(UIColor.blueColor(), forState: .Highlighted)
        dislikeButton.setTitleColor(UIColor.blueColor(), forState: .Highlighted)

    }
    
    // MARK: - UIComponents Constraints
    func setupConstraints() {
        
        gameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        dislikeButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding UIComponents to the view
        
        self.addSubview(gameTitleLabel)
        self.addSubview(likeButton)
        self.addSubview(skipButton)
        self.addSubview(dislikeButton)
        
        // GameTitleLabel
        
        let topTitle = gameTitleLabel.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: 5)
        let centerXTitle = gameTitleLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor)
        
        // LikeButton
        
        let topLike = likeButton.topAnchor.constraintEqualToAnchor(gameTitleLabel.bottomAnchor, constant: 5)
        let leftLike = likeButton.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: 0)
        
        // SkipButton
        
        let leftSkip = skipButton.leadingAnchor.constraintEqualToAnchor(likeButton.trailingAnchor, constant: 10)
        let rightSkip = skipButton.trailingAnchor.constraintEqualToAnchor(dislikeButton.leadingAnchor, constant: -10)
        let topSkip = skipButton.topAnchor.constraintEqualToAnchor(likeButton.topAnchor)
        let widthSkip = skipButton.widthAnchor.constraintEqualToConstant(60)
        
        // DislikeButton
        
        let topDislike = dislikeButton.topAnchor.constraintEqualToAnchor(likeButton.topAnchor)
        let rightDislike = dislikeButton.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor, constant: 0)
        let widthDislike = dislikeButton.widthAnchor.constraintEqualToAnchor(likeButton.widthAnchor)
        
        // All constraints array
        
        let allConstraints = [topTitle!, centerXTitle!, topLike!, leftLike!, leftSkip!, rightSkip!, topSkip!, widthSkip!, topDislike!, rightDislike!, widthDislike!]
        
        // Activate all constraints
        
        NSLayoutConstraint.activateConstraints(allConstraints)
    }
    
}
