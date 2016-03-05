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
    
    @IBOutlet weak var multiplayerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func multiplayerButtonPressed(sender: AnyObject) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Start Game", message: "Enter phrase to be guessed:", preferredStyle: .Alert)
        
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
