//
//  TestVC.swift
//  GameTeller
//
//  Created by Krystian Gontarek on 19.03.2016.
//  Copyright © 2016 DevCrew. All rights reserved.
//

import UIKit

class TestVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let gameCell = tableView.dequeueReusableCellWithIdentifier("SingleGame") as! SingleGameCell
        gameCell.gameStatsView.printSizes()
        return gameCell
    }
    
    
}
