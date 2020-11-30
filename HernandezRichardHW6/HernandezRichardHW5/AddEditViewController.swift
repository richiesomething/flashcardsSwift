//
//  AddEditViewController.swift
//  HernandezRichardHW5
//
//  Created by Richard Hernandez on 11/11/20.
//

import UIKit

class AddEditViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    public var purpose = "Add Flashcard"
    private var model = FlashcardsModel.shared

    @IBOutlet weak var navbar: UINavigationItem!
    @IBOutlet weak var cancel: UIBarButtonItem!
    @IBOutlet weak var save: UIBarButtonItem!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var view_label: UITextView!
    @IBOutlet weak var field_label: UITextField!
    
    @IBAction func cancel_action(_ sender: Any) {
        view_label.text = ""
        field_label.text = ""
        dismiss(animated: true, completion: nil)
    }
    
    func enableSaveButton() {
        let view = view_label.text ?? ""
        let field = field_label.text ?? ""
        save.isEnabled = view.count > 0 && field.count > 0
    }
    
    @IBAction func answerChanged(_ textField: UITextField) {
        enableSaveButton()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        enableSaveButton()
    }
    
    @IBAction func save_action(_ sender: Any) {
        
        let question = view_label.text ?? ""
        let answer = field_label.text ?? ""
    
        print("before adding count")
        print(model.numberOfFlashcards())
        
        model.insert(question: question, answer: answer)
        
        print("after adding count")
        print(model.numberOfFlashcards())

        
        view_label.text = ""
        field_label.text = ""
        
        dismiss(animated: true, completion: nil)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            view_label.resignFirstResponder()
            field_label.becomeFirstResponder()
            return false  // does not change the text in textView
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        field_label.resignFirstResponder()
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first

        if field_label.isFirstResponder && touch?.view != field_label {
            field_label.resignFirstResponder()
        }
        else if view_label.isFirstResponder && touch?.view != view_label {
            view_label.resignFirstResponder()
        }
        super.touchesBegan(touches, with: event)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navbar.title = purpose
        
        save.isEnabled = false
        view_label.delegate = self
        field_label.delegate = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
