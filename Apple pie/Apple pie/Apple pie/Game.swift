//
//  Game.swift
//  Apple pie
//
//  Created by Gebruiker on 20-04-18.
//  Copyright © 2018 Gebruiker. All rights reserved.
//

import Foundation

struct Game {
    
    // creates variables of struct
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    // checks if letter is in word
    mutating func playerGuessed(letter: Character) {
        
        // assigns letter to guessedLetter var
        guessedLetters.append(letter)
        
        // if word doesn't contain letter decreases remaining moves
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
    
    // makes var formattedWord
    var formattedWord: String {
        
        // makes empty string
        var guessedWord = ""
        
        // iterates over letters in word
        for letter in word.characters {
            
            // if guessedLetter is letter of word it appends the letter to guessedword
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            }
            
            // otherwise prints underscore
            else {
                guessedWord += "_"
            }
        }
        
        // returns word with underscores and letters
        return guessedWord
    }
}
