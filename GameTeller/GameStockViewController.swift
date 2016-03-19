//
//  GameStockViewController.swift
//  GameTeller
//
//  Created by Krystian Gontarek on 13.02.2016.
//  Copyright © 2016 DevCrew. All rights reserved.
//

import UIKit

class GameStockViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataService = DataService()
    
    var gamesArray : [Game]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Calling Design Function
        self.navigationController?.configureBarGradient()
        self.view.basicBackgroundConfig(UIColor(hex: mainDark))
        tableViewColor(UIColor.clearColor())
        
        // TableView setup
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // Access all games from database
        self.gamesArray = dataService.getAllGames()
    }
    
}

extension GameStockViewController : UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - TableView Initialize Functions
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesArray!.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Connecting Cell to SingleGameCell Class
        
        let gameCell = tableView.dequeueReusableCellWithIdentifier("SingleGame") as! SingleGameCell
        let game = gamesArray![indexPath.row]
        
        gameCell.gameRateView.game = game
        gameCell.gameStatsView.game = game
        
        // Cell Layout
        gameCell.gameBGImageView.image = game.image
        
        // Animating Cell Bars
        gameCell.layoutIfNeeded()
        gameCell.gameStatsView.animateBars()
        
        //Printing Test Values
        gameCell.gameStatsView.printSizes()
        
        return gameCell
    }
    
}

extension GameStockViewController {
    
    // DESIGN EXTENSION
    
    // Personalized Design Setup Functions
    
    func tableViewColor(color: UIColor) {
        self.tableView.backgroundColor = color
    }
    
}
