//
//  DataService.swift
//  GameTeller
//
//  Created by Krystian Gontarek on 11.03.2016.
//  Copyright © 2016 DevCrew. All rights reserved.
//

import UIKit

class DataService {
    
    // MARK: - Fake Database Games
    
    func getAllGames() -> [Game] {
    
        let game1 = Game()
        game1.name = "TestShooter"
        game1.likesNumber = 213
        game1.dislikesNumber = 71
        game1.topic = "Modern Warfare"
        game1.type = "FPS"
        game1.image = UIImage(named: "TestBGImage")
        
        let game2 = Game()
        game2.name = "Call Of Duty: Advanced Warfare"
        game2.likesNumber = 213
        game2.dislikesNumber = 71
        game2.topic = "Advanced Warfare"
        game2.type = "FPS"
        game2.image = UIImage(named: "CoD:AW")
        
        let game3 = Game()
        game3.name = "Battlefield 4"
        game3.likesNumber = 213
        game3.dislikesNumber = 71
        game3.topic = "Military"
        game3.type = "FPS"
        game3.image = UIImage(named: "battlefield4")
        
        let game4 = Game()
        game4.name = "Skyrim"
        game4.likesNumber = 213
        game4.dislikesNumber = 71
        game4.topic = "BEST GAME EVER"
        game4.type = "RPG"
        game4.image = UIImage(named: "SkyrimWallpaper")
        
        let game5 = Game()
        game5.name = "The Witcher 3: Wild Hunt"
        game5.likesNumber = 213
        game5.dislikesNumber = 71
        game5.topic = "Fantasy"
        game5.type = "RPG"
        game5.image = UIImage(named: "Witcher3")
    
        
        let games = [game1, game2, game3, game4, game5]
        
        return games
    }
    
}
