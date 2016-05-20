//
//  ViewController.swift
//  FoodLogger
//
//  Created by Ronny Mathew on 5/19/16.
//  Copyright © 2016 Betaturf. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties/Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Delegating Text Field
        nameTextField.delegate = self
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Resigning first responder status
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(textField: UITextField) {
        //Setting label name to entered text after editing
        nameLabel.text = textField.text
        textField.text = ""
    }
    
    // MARK: Actions
    @IBAction func resetButton(sender: UIButton) {
        nameLabel.text = "Default Text"
    }
    

}

