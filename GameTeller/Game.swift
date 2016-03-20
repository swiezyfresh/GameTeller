//
//  Game.swift
//  GameTeller
//
//  Created by Krystian Gontarek on 11.03.2016.
//  Copyright © 2016 DevCrew. All rights reserved.
//

import UIKit

class Game {
    
    var name : String?
    
    var likesNumber : Int?
    var dislikesNumber : Int?
    
    var likesPercentage : Float {
        if let likes = self.likesNumber, dislikes = self.dislikesNumber {
            return (Float(likes) / (Float(likes) + Float(dislikes))) * 100
            // 50 / (50 + 50) * 100 = 0.5 * 100 = 50
        }
        
        return 0
    }
    
    var dislikesPercentage : Float {
        if let likes = self.likesNumber, dislikes = self.dislikesNumber {
            return (Float(dislikes) / (Float(likes) + Float(dislikes))) * 100
        }
        
        return 0
    }
    
    var likesPercentageText : String {
        
        return likesPercentage >= 10 ? "\(String(format: "%.0f", likesPercentage))%" : ""
        
    }
    
    var dislikesPercentageText : String {
        return dislikesPercentage >= 10 ? "\(String(format: "%.0f", dislikesPercentage))%" : ""
    }
    
    var image : UIImage?
    
    var type : String?
    var topic : String?
    
}