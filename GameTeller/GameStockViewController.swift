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

        // CALLING DESIGN FUNCTIONS
        
        self.navigationController?.configureBarGradient()
        self.view.basicBackgroundConfig(UIColor(hex: mainDark))
        tableViewColor(UIColor.clearColor())
        
        // Table view setup
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // Access all games from database
        self.gamesArray = dataService.getAllGames()
    }

}

extension GameStockViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesArray!.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let gameCell = tableView.dequeueReusableCellWithIdentifier("SingleGame") as! SingleGameCell
        let game = gamesArray![indexPath.row]
        gameCell.gameRateView.game = game
        
        // Cell Layout
        gameCell.gameBGImageView.image = game.image
        
        // Filling cell with data
        print(__FUNCTION__)
        gameCell.layoutIfNeeded()
        gameCell.gameStatsView.animateBars()
        
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
