//
//  FlashcardsModel.swift
//  HernandezRichardHW5
//
//  Created by Richard Hernandez on 10/25/20.
//

import Foundation

class FlashcardsModel : NSObject, FlashcardsDataModel {
    
    private var flashcards = [Flashcard] ()
    
    private var currentIndex : Int? = 0
    
    var questionDisplayed : Bool = true
    
    var emptyFlashcards : Flashcard? = Flashcard(question: "There are no more flashcards.", answer: "Please add more flashcards.")

    
    override init() {
        super.init()
        flashcards.append(Flashcard(question: "What is the capitol of Mexico?", answer: "Mexico City"))
        flashcards.append(Flashcard(question: "What is the capitol of Colombia?", answer: "Bogota"))
        flashcards.append(Flashcard(question: "What is the capitol of Venezuela?", answer: "Caracas"))
        flashcards.append(Flashcard(question: "What is the capitol of Spain?", answer: "Madrid"))
        flashcards.append(Flashcard(question: "What is the capitol of France?", answer: "Paris"))
    
        self.currentIndex = 0;
        
        self.questionDisplayed = true
    }
    
    static let shared = FlashcardsModel()
    
    func numberOfFlashcards() -> Int {
        return flashcards.count
    }
    
    func randomFlashcard() -> Flashcard? {
        if flashcards.count == 0 {
            return emptyFlashcards
        }
        
        var i = Int.random(in: 0..<flashcards.count)
        if (flashcards.count != 0) {
            while (i == currentIndex) {
                i = Int.random(in: 0..<flashcards.count)
            }
        }
        
        self.currentIndex = i
        return flashcards[i]
    }
    
    func nextFlashcard() -> Flashcard? {
        if flashcards.count == 0 {
            return emptyFlashcards
        }
        
        currentIndex! += 1
        if (currentIndex == flashcards.count) {
            currentIndex = 0
            
        }
        return flashcards[currentIndex!]
    }
    
    func previousFlashcard() -> Flashcard? {
        if flashcards.count == 0 {
            return emptyFlashcards
        }
        
        currentIndex! -= 1
        if (currentIndex == -1) {
            currentIndex = flashcards.count - 1
            
        }
        return flashcards[currentIndex!]
    }
    
    func insert(question: String, answer: String) {
        flashcards.append(Flashcard(question: question, answer: answer))
        
        for i in 0..<flashcards.count {
            print(flashcards[i].getQuestion())
        }
    }
    
    func currentFlashcard() -> Flashcard? {
        if flashcards.count == 0 {
            return emptyFlashcards
        }
        return flashcards[currentIndex!]
    }
    
    func flashcard(at index: Int) -> Flashcard? {
        if (0 <= index && index < flashcards.count) {
            return flashcards[index]
        }
        return nil
    }
    
    func removeFlashcard(at index: Int) {
        if (0 <= index && index < flashcards.count) {
            flashcards.remove(at: index)
            if (index < currentIndex! || index == flashcards.count - 1) {
                currentIndex! -= 1
            }
        }
        if (flashcards.count == 0) {
            currentIndex = 0
        }
    }

}
