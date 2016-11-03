
//
//  ViewController.swift
//  DataBindings-demo
//
//  Created by Nikolas Burk on 02/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

enum inputState {
    case button
    case field
}

class ViewController: UIViewController {
    
    var inputState: inputState = .button
    
    var lastButtonText: String = "Hello"
    
    @IBOutlet weak var stateSegmentedControl: UISegmentedControl!
    @IBOutlet weak var greetingsLabel: UILabel!
    @IBOutlet weak var greetingsTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet var greetingButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.addTarget(self, action: #selector(updateGreetingsLabel), for: UIControlEvents.editingChanged)
        greetingsTextField.addTarget(self, action: #selector(updateGreetingsLabel), for: UIControlEvents.editingChanged)
    }
    
    @IBAction func stateChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.inputState = .button
            updateGreetingsLabel()
        } else if sender.selectedSegmentIndex == 1 {
            self.inputState = .field
            updateGreetingsLabel()
        }
    }
    
    @IBAction func greetingsButtonPressed(_ sender: UIButton) {
        switch inputState {
        case .button:
            if let text = sender.titleLabel?.text {
                lastButtonText = text
                updateGreetingsLabel()
            }
        default:
            return
        }
    }
    
    func updateGreetingsLabel() {
        switch inputState {
        case .button:
            if let name = nameTextField?.text! {
                greetingsLabel.text = lastButtonText + ", " + name
            }
        case .field:
            if let name = nameTextField?.text! {
                if let greeting = greetingsTextField?.text! {
                    greetingsLabel.text = greeting + ", " + name
                }
            }
        }
    }
}

