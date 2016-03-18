//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    
    @IBOutlet weak var hangManImage: UIImageView!
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
    
    var incorrectGuesses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadNewGame()
        /*else if Array(arrayLiteral: wordReveal.text)[currentPosition-1] != "_"{
            
        }*/
        
        
    }
    
    func loadNewGame(){
        characterAdded = []
        incorrectGuesses = 0
        hangManImage.image = UIImage(named: "hangman1.png")
        A.enabled = true
        B.enabled = true
        C.enabled = true
        D.enabled = true
        E.enabled = true
        F.enabled = true
        G.enabled = true
        H.enabled = true
        I.enabled = true
        J.enabled = true
        K.enabled = true
        L.enabled = true
        M.enabled = true
        N.enabled = true
        O.enabled = true
        P.enabled = true
        Q.enabled = true
        R.enabled = true
        S.enabled = true
        T.enabled = true
        U.enabled = true
        V.enabled = true
        W.enabled = true
        X.enabled = true
        Y.enabled = true
        Z.enabled = true
        
        
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
                wordLabel += "-"
                /*if currentPosition != stringLength{
                    wordLabel += "_ "
                }
                else{
                    wordLabel += "_"
                }*/
            }
            
        }
        
        wordReveal.text = wordLabel
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
        button.enabled = false
        
        if !phrase.containsString(button.currentTitle!){
            incorrectGuesses += 1
            let nameImage = "hangman\(incorrectGuesses + 1).png"
            hangManImage.image = UIImage(named: nameImage)
            if incorrectGuesses == 6{
                var numberGamesPlayed: Int = defaults.objectForKey("numberGamesPlayed") as! Int
                var numberGamesLost: Int = defaults.objectForKey("numberGamesLost") as! Int
                numberGamesPlayed++
                numberGamesLost++
                defaults.setObject(numberGamesPlayed, forKey: "numberGamesPlayed")
                defaults.setObject(numberGamesLost, forKey: "numberGamesLost")
                
                let alert = UIAlertController(title: "You Lost!", message: "The phrase was:\n \(phrase)", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "New Game", style: UIAlertActionStyle.Default, handler: { action in self.loadNewGame()}))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        else{
            var wordLabel = ""
            
            for character in phrase.characters{
                var charWordLabel = wordReveal.text![wordReveal.text!.startIndex.advancedBy(0)]
                currentPosition += 1
                
                if character == " "{
                    wordLabel += " "
                }
                else{
                    if String(character)==button.currentTitle{
                        //wordLabel = String(wordLabel.characters.dropLast())
                        print(wordLabel)
                        /*if wordLabel.characters.last==" " && wordLabel.substringToIndex(wordLabel.endIndex.predecessor()).characters.last == "_"{
                            wordLabel = String(wordLabel.characters.dropLast())
                        }*/
                        
                        wordLabel += String(character)
                        characterAdded.append(character)
                    }
                    else if (characterAdded.contains(character)){
                        //wordLabel = String(wordLabel.characters.dropLast())
                        /*if wordLabel.characters.last==" " && wordLabel.substringToIndex(wordLabel.endIndex.predecessor()).characters.last == "_"{
                            wordLabel = String(wordLabel.characters.dropLast())
                        }*/
                        
                        wordLabel += String(character)
                    }
                    else{
                        wordLabel += "-"
                        /*if currentPosition != stringLength{
                            wordLabel += "_ "
                        }
                        else{
                            wordLabel += "_"
                        }*/
                    }
                }
            }
            
            wordReveal.text = wordLabel
            button.enabled = false
            
            var allLettersGuessed = true
            
            for character in wordReveal.text!.characters{
                if character == "-"{
                    allLettersGuessed = false
                }
            }
            
            if allLettersGuessed == true{
                var numberGamesPlayed: Int = defaults.objectForKey("numberGamesPlayed") as! Int
                var numberGamesWon: Int = defaults.objectForKey("numberGamesWon") as! Int
                numberGamesPlayed++
                numberGamesWon++
                defaults.setObject(numberGamesPlayed, forKey: "numberGamesPlayed")
                defaults.setObject(numberGamesWon, forKey: "numberGamesWon")
                
                let alert = UIAlertController(title: "You Won!", message: "The phrase was:\n \(phrase)", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "New Game", style: UIAlertActionStyle.Default, handler: { action in self.loadNewGame()}))
                self.presentViewController(alert, animated: true, completion: nil)
            }
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
