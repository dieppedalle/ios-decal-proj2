//
//  StartScreenViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit



class StartScreenViewController: UIViewController {

    var phraseToSend = ""
    var numberGamesPlayed = 0
    var numberGamesWon = 0
    var numberGamesLost = 0
    
    //construct new NSUserDefaults object
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var multiplayerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statistics: Int? = defaults.objectForKey("numberGamesPlayed") as! Int?
        
        if (statistics == nil){
            let numberGamesPlayed = 0
            let numberGamesWon = 0
            let numberGamesLost = 0
            
            defaults.setObject(numberGamesPlayed, forKey: "numberGamesPlayed")
            defaults.setObject(numberGamesWon, forKey: "numberGamesWon")
            defaults.setObject(numberGamesLost, forKey: "numberGamesLost")
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func multiplayerButtonPressed(sender: AnyObject) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Enter a pharse for a friend to guess", message: "Use only letters and spaces", preferredStyle: .Alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.text = ""
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action) -> Void in
            
        }))
        
        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Start", style: .Default, handler: { (action) -> Void in
            let textField = alert.textFields![0] as UITextField
            self.phraseToSend = textField.text!.uppercaseString
            print(self.phraseToSend)
            print("+++++++")
            
            var possibleGame = false
            
            for character in self.phraseToSend.characters{
                if character >= "A" && character <= "Z" {
                    possibleGame=true
                }
            }
            
            print(possibleGame)
            print("*******")
            
            
            if (self.phraseToSend.characters.count != 0 && possibleGame == true){
                self.performSegueWithIdentifier("loadMultiplayer", sender: self)
            }
            
            
            
        }))
        
        
        // 4. Present the alert.
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if (segue.identifier! == "loadMultiplayer"){
            let yourNextViewController = (segue.destinationViewController as! MultiplayerViewController)
            yourNextViewController.phrase = phraseToSend
        }
            
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
