//
//  ViewController.swift
//  HernandezRichardHW5
//
//  Created by Richard Hernandez on 10/25/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var flashcardLabel: UILabel!
    private var model = FlashcardsModel.shared
    var flashcard : Flashcard? = nil
    
    @objc func singleTapModel(_ sender: UITapGestureRecognizer) {
        flashcardLabel.textColor = UIColor.orange
        model.questionDisplayed = true
        
        flashcard = model.randomFlashcard()!
        flashcardLabel.text = flashcard!.getQuestion()

    }
    
    @objc func doubleTapModel(_ sender: UITapGestureRecognizer) {
        model.questionDisplayed = !model.questionDisplayed
        flashcardLabel.text = !model.questionDisplayed ? flashcard!.getAnswer() : flashcard!.getQuestion()
        flashcardLabel.textColor = model.questionDisplayed ? UIColor.orange : UIColor.green
    }
    
    @objc func rightSwipeModel(_ sender: UISwipeGestureRecognizer) {
        flashcardLabel.textColor = UIColor.orange
        model.questionDisplayed = true

        flashcard = model.nextFlashcard()!
        flashcardLabel.text = flashcard!.getQuestion()
    }
    
    @objc func leftSwipeModel(_ sender: UISwipeGestureRecognizer) {
        flashcardLabel.textColor = UIColor.orange
        model.questionDisplayed = true

        flashcard = model.previousFlashcard()!
        flashcardLabel.text = flashcard!.getQuestion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        flashcard = model.currentFlashcard()
        flashcardLabel.text = flashcard?.getQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        flashcard = model.randomFlashcard()!
        flashcardLabel.text = flashcard!.getQuestion()

        let singleTap = UITapGestureRecognizer(target: self, action: #selector(singleTapModel))
        view.addGestureRecognizer(singleTap)

        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapModel))
        doubleTap.numberOfTapsRequired = 2
        singleTap.require(toFail: doubleTap)
        view.addGestureRecognizer(doubleTap)

        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipeModel))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)

        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipeModel))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)

    }


}

