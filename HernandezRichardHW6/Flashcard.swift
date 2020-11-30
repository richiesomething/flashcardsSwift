//
//  Flashcard.swift
//  HernandezRichardHW5
//
//  Created by Richard Hernandez on 10/25/20.
//

import Foundation

struct Flashcard: Equatable {
    private var question: String
    private var answer: String
    
    init(question: String, answer: String) {
        self.question = question
        self.answer = answer
    }
    
    func getQuestion() -> String{
        return self.question
    }
    
    func getAnswer() -> String {
        return self.answer
    }
}
