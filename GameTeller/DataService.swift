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
        game1.likesNumber = 592
        game1.dislikesNumber = 521
        game1.topic = "Modern Warfare"
        game1.type = "FPS"
        game1.image = UIImage(named: "TestBGImage")
        
        let game2 = Game()
        game2.name = "Call Of Duty: Advanced Warfare"
        game2.likesNumber = 7823
        game2.dislikesNumber = 1209
        game2.topic = "Advanced Warfare"
        game2.type = "FPS"
        game2.image = UIImage(named: "CoD:AW")
        
        let game3 = Game()
        game3.name = "Battlefield 4"
        game3.likesNumber = 200
        game3.dislikesNumber = 500
        game3.topic = "Military"
        game3.type = "FPS"
        game3.image = UIImage(named: "battlefield4")
        
        let game4 = Game()
        game4.name = "Skyrim"
        game4.likesNumber = 500
        game4.dislikesNumber = 0
        game4.topic = "BEST GAME EVER"
        game4.type = "RPG"
        game4.image = UIImage(named: "SkyrimWallpaper")
        
        let game5 = Game()
        game5.name = "The Witcher 3: Wild Hunt"
        game5.likesNumber = 95
        game5.dislikesNumber = 5
        game5.topic = "Fantasy"
        game5.type = "RPG"
        game5.image = UIImage(named: "Witcher3")
        
        let game6 = Game()
        game6.name = "TestShooter"
        game6.likesNumber = 592
        game6.dislikesNumber = 521
        game6.topic = "Modern Warfare"
        game6.type = "FPS"
        game6.image = UIImage(named: "TestBGImage")
        
        let game7 = Game()
        game7.name = "Call Of Duty: Advanced Warfare"
        game7.likesNumber = 7823
        game7.dislikesNumber = 1209
        game7.topic = "Advanced Warfare"
        game7.type = "FPS"
        game7.image = UIImage(named: "CoD:AW")
        
        let game8 = Game()
        game8.name = "Battlefield 4"
        game8.likesNumber = 200
        game8.dislikesNumber = 500
        game8.topic = "Military"
        game8.type = "FPS"
        game8.image = UIImage(named: "battlefield4")
        
        let game9 = Game()
        game9.name = "Skyrim"
        game9.likesNumber = 500
        game9.dislikesNumber = 0
        game9.topic = "BEST GAME EVER"
        game9.type = "RPG"
        game9.image = UIImage(named: "SkyrimWallpaper")
        
        let game10 = Game()
        game10.name = "The Witcher 3: Wild Hunt"
        game10.likesNumber = 95
        game10.dislikesNumber = 5
        game10.topic = "Fantasy"
        game10.type = "RPG"
        game10.image = UIImage(named: "Witcher3")
    
        
        let games = [game1, game2, game3, game4, game5, game6, game7, game8, game9, game10]
        
        return games
    }
    
}
