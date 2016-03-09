//
//  StatisticsTableViewController.swift
//  Hangman
//
//  Created by Gauthier Dieppedalle on 3/6/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class StatisticsTableViewController: UITableViewController {

    @IBOutlet weak var numberGamesPlayedLabel: UILabel!
    
    @IBOutlet weak var numberGamesWonLabel: UILabel!
    
    @IBOutlet weak var numberGamesLostLabel: UILabel!
    
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("You selected cell number: \(indexPath.row)!")
        
        if indexPath.row == 0{
            let numberGamesPlayed = 0
            let numberGamesWon = 0
            let numberGamesLost = 0
            
            defaults.setObject(numberGamesPlayed, forKey: "numberGamesPlayed")
            defaults.setObject(numberGamesWon, forKey: "numberGamesWon")
            defaults.setObject(numberGamesLost, forKey: "numberGamesLost")
            numberGamesPlayedLabel.text = "\(numberGamesPlayed)"
            numberGamesWonLabel.text = "\(numberGamesWon)"
            numberGamesLostLabel.text = "\(numberGamesLost)"
        }
        
    }
    
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 0{
            tableView.cellForRowAtIndexPath(indexPath)!.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.1)
        }
    }
    
    override func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)!.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numberGamesPlayed: Int = defaults.objectForKey("numberGamesPlayed") as! Int
        let numberGamesWon: Int = defaults.objectForKey("numberGamesWon") as! Int
        let numberGamesLost: Int = defaults.objectForKey("numberGamesLost") as! Int
        
        numberGamesPlayedLabel.text = "\(numberGamesPlayed)"
        numberGamesWonLabel.text = "\(numberGamesWon)"
        numberGamesLostLabel.text = "\(numberGamesLost)"
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
