//
//  TextParser.swift
//  noteDecoder
//
//  Created by Holly Gummerson on 2024-11-28.
//

import Foundation
import UIKit

struct TextParser {
    
    // Define the mapping as a static property
        private static let numberToLetter: [Character: Character] = [
            "1": "Q",
            "2": "W",
            "3": "E",
            "4": "R",
            "5": "T",
            "6": "Y",
            "7": "U",
            "8": "I",
            "9": "O",
            "0": "P",
            "-": "A",
            "/": "S",
            ":": "D",
            ";": "F",
            "(": "G",
            ")": "H",
            "$": "H",
            "&": "J",
            "@": "K",
            "\"": "L",
            ".": "Z",
            ",": "C",
            "?": "B",
            "!": "N",
            "'": "M",
        ]
   
    // Takes the string and replaces all abnormal quotation characters
    func normalizeQuotes(input: String) -> String {
        let qone = input.replacingOccurrences(of: "“", with: "\"")
        let qtwo = qone.replacingOccurrences(of: "”", with: "\"")
        let qthree = qtwo.replacingOccurrences(of: "‘", with: "'")
        
        return qthree
    }
    
    // Takes a group of symbols, returns the mapped letter string
    func translateGroup(group: String) -> String {
        var word: String = ""
        
        for i in group {
            if let letter = TextParser.numberToLetter[i] {
                word.append(letter)
            }
            else {
                word.append(i)
            }
        }
        return word
    }
    
    // Takes the array of symbol strings, returns an array of translated
    func createLetterArray(symbols: [String]) -> [String] {
        var translated: [String] = []
        
        for g in symbols {
            let translatedWord = translateGroup(group: g)
            let checked = checkAndCorrectSpelling(word: translatedWord)
            translated.append(checked)
        }
        return translated
    }
    
    // Detects and replaces misspelled words in the string
    func checkAndCorrectSpelling(word: String) -> String {
        let word = word.lowercased()
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        // If a misspelled word is found
        let incorrect = misspelledRange.location != NSNotFound
        if incorrect {
            
            // Get suggestions for the misspelled word
            let suggestions = checker.guesses(forWordRange: misspelledRange, in: word, language: "en_US")
            
            // If there are suggestions, replace the misspelled word with the first suggestion
            if let suggestedWord = suggestions?.first {
                // Replace the misspelled word with the suggested word
                let correctedText = (word as NSString).replacingCharacters(in: misspelledRange, with: suggestedWord)
                return correctedText.uppercased()
            }
        }
        // Return the original text if no misspelled word is found
        return word.uppercased()
    }
   
    // Translates a string of symbols into a string of words
    // Takes input text, returns translated string
    func parse(_ text: String) -> String {
        
        let normalized = normalizeQuotes(input: text)
        let codeArray = normalized.split(separator: " ")
        let stringArray = codeArray.map { String($0) }
        let letterArray = createLetterArray(symbols: stringArray)
        
        let rejoined = letterArray.joined(separator: " ")
        return rejoined
    }
}
