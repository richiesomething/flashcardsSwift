//
//  HernandezRichardHW5Tests.swift
//  HernandezRichardHW5Tests
//
//  Created by Richard Hernandez on 10/25/20.
//

import XCTest
@testable import HernandezRichardHW5

class HernandezRichardHW5Tests: XCTestCase {
    
    private var flashcardModel: FlashcardsModel!
    
    override func setUp() {
        super.setUp()
        self.flashcardModel = FlashcardsModel()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    

    func testSingleton() throws {
        
        let model1 = FlashcardsModel.shared
        let model2 = FlashcardsModel.shared
        
        model1.insert(question: "What is the capitol of Egypt", answer: "Cairo")
        
        XCTAssertEqual(model1.numberOfFlashcards(), model2.numberOfFlashcards())
        
    }
    
    func testNumberOfFlashcards() throws {
        XCTAssertEqual(flashcardModel.numberOfFlashcards(), 5)
    }
    
    func testRandomFlashcard() throws {
        let flashcard1: Flashcard? = flashcardModel.currentFlashcard()
        let flashcard2: Flashcard? = flashcardModel.randomFlashcard()

        
        XCTAssertNotEqual(flashcard1, flashcard2)
    }
    
    func testNextFlashcard() throws {
        
        var flashcard1 = flashcardModel.currentFlashcard()
        
        while (flashcard1?.getAnswer() != "Bogota") {
            flashcard1 = flashcardModel.nextFlashcard()
        }
        
        flashcard1 = flashcardModel.nextFlashcard()
        
        XCTAssertEqual(flashcard1?.getAnswer(), "Caracas")
        
    }
    
    func testPreviousFlashcard() throws {
        var flashcard1 = flashcardModel.currentFlashcard()
        
        while (flashcard1?.getAnswer() != "Caracas") {
            flashcard1 = flashcardModel.nextFlashcard()
        }
        
        flashcard1 = flashcardModel.previousFlashcard()
        
        XCTAssertEqual(flashcard1?.getAnswer(), "Bogota")
    }
    
    func testInsert() throws {
        flashcardModel.insert(question: "What is the capitol of England?", answer: "London")
        XCTAssertEqual(flashcardModel.numberOfFlashcards(), 6)
    }
    
    func testCurrentFlashcard() throws {
        let flashcard = flashcardModel.flashcard(at: 0)
        XCTAssertEqual(flashcard?.getAnswer(), "Mexico City")
    }
    
    func testFlashcard() throws {
        let flashcard = flashcardModel.flashcard(at: 3)
        XCTAssertEqual(flashcard!.getAnswer(), "Madrid")
    }
    
    func testRemoveFlashcard() throws {
        flashcardModel.removeFlashcard(at: 4)
        XCTAssertEqual(flashcardModel.numberOfFlashcards(), 4)
    }
    
}
