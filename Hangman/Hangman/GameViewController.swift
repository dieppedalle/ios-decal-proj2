//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var wordReveal: UILabel!
    @IBOutlet weak var A: UIButton!
    
    @IBOutlet weak var B: UIButton!
    
    @IBOutlet weak var C: UIButton!
    
    @IBOutlet weak var D: UIButton!

    @IBOutlet weak var E: UIButton!
    
    @IBOutlet weak var F: UIButton!
    
    @IBOutlet weak var G: UIButton!
    
    @IBOutlet weak var H: UIButton!
    
    @IBOutlet weak var I: UIButton!
    
    @IBOutlet weak var J: UIButton!
    
    @IBOutlet weak var K: UIButton!
    
    @IBOutlet weak var L: UIButton!
    
    @IBOutlet weak var M: UIButton!
    
    @IBOutlet weak var N: UIButton!
    
    @IBOutlet weak var O: UIButton!
    
    @IBOutlet weak var P: UIButton!
    
    @IBOutlet weak var Q: UIButton!
    
    @IBOutlet weak var R: UIButton!
    
    @IBOutlet weak var S: UIButton!
    
    @IBOutlet weak var T: UIButton!
    
    @IBOutlet weak var U: UIButton!
    
    @IBOutlet weak var V: UIButton!
    
    @IBOutlet weak var W: UIButton!
    
    @IBOutlet weak var X: UIButton!
    
    @IBOutlet weak var Y: UIButton!
    
    @IBOutlet weak var Z: UIButton!
    
    //var charactersPhrase = [Character]()
    var phrase: String = ""
    var characterAdded = [Character]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let hangmanPhrases = HangmanPhrases()
        phrase = hangmanPhrases.getRandomPhrase()
        
        var wordLabel = ""
        
        let stringLength = phrase.characters.count
        var currentPosition = 0
        
        for character in phrase.characters{
            currentPosition += 1
            if character == " "{
                wordLabel += " "
            }
            else{
                if currentPosition != stringLength{
                    wordLabel += "_ "
                }
                else{
                    wordLabel += "_"
                }
            }
            
        }
        
        wordReveal.text = wordLabel
        /*else if Array(arrayLiteral: wordReveal.text)[currentPosition-1] != "_"{
            
        }*/
        
        print(wordReveal.text![wordReveal.text!.startIndex.advancedBy(0)])
        //print(Array(arrayLiteral: wordReveal.text!)[0])
        print(phrase)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(button : UIButton)
    {
        print(button.currentTitle!)
        
        var currentPosition = 0
        let stringLength = phrase.characters.count
        var wordLabel = ""
        
        
        for character in phrase.characters{
            var charWordLabel = wordReveal.text![wordReveal.text!.startIndex.advancedBy(0)]
            currentPosition += 1
            
            if character == " "{
                wordLabel += " "
            }
            else{
                if String(character)==button.currentTitle{
                    wordLabel += String(character)
                    characterAdded.append(character)
                }
                else if (characterAdded.contains(character)){
                    wordLabel += String(character)
                }
                else{
                    if currentPosition != stringLength{
                        wordLabel += "_ "
                    }
                    else{
                        wordLabel += "_"
                    }
                }
            }
        }
        
        wordReveal.text = wordLabel
        button.enabled = false
        
        var allLettersGuessed = true
        
        for character in wordReveal.text!.characters{
            if character == "_"{
                allLettersGuessed = false
            }
        }
        
        if allLettersGuessed == true{
            let alert = UIAlertController(title: "Congratulations", message: "You Won!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "New Game", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
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
