//
//  ViewController.swift
//  Apple pie
//
//  Created by Gebruiker on 20-04-18.
//  Copyright © 2018 Gebruiker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // list of words used
    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program", "swimming", "saterday", "football", "beltbuckel", "diving"]
    // number of "lives"
    let incorrectMovesAllowed = 7
    
    // var that keeps track of number of wins
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    
    // keeps track of number of loses
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    // outlets of labels, image and buttons
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // currentGame is var form struct Game
    var currentGame: Game!
    
    
    // creates a new round
    func newRound() {
        // checks if there are words left to play
        if !listOfWords.isEmpty {
            
            // word to guess is first of (remaining) list
            let newWord = listOfWords.removeFirst()
            
            // fills in var's of game struct
            currentGame = Game(word: newWord,
            incorrectMovesRemaining: incorrectMovesAllowed,
            guessedLetters: [])
            
            // enables buttons
            enableLetterButtons(true)
            
            // updates
            updateUI()
        }
        else {
            // if all words are use doesn't enable buttons
            enableLetterButtons(false)
        }
    }
    
    // function that has a bool as input
    func enableLetterButtons(_ enable: Bool) {
        // iterates over all letters
        for button in letterButtons {
            // enables or disables all buttons
            button.isEnabled = enable
        }
    }
    
    // updates game play
    func updateUI() {
        
        // creates a string
        var letters = [String]()
        
        // gets guessedWord
        for letter in currentGame.formattedWord.characters {
            letters.append(String(letter))
        }
        
        // puts spaces between letters
        let wordWithSpacing = letters.joined(separator: " ")
        
        // assigns wordwithspacing to label
        correctWordLabel.text = wordWithSpacing
        
        // keeps scoreLabel up to date
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        
        // updates version of tree shown
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    // gives actions when button is pressed
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        // disables button
        sender.isEnabled = false
        
        // saves letter from button and lowercases it
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        
        // gives letter to playerGuessed func and updates
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    func updateGameState() {
        
        // increases losses
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        }
            
        // increases winnings
        else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        }
        // updates in all other cases
        else {
            updateUI()
        }
    }
    
    // makes sure tree is showed when screen is first loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

