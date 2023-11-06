//
//  SettingsViewController.swift
//  MyApps
//
//  Created by Andrey Vanakoff on 08/10/2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var websiteNameTF: UITextField!
    @IBOutlet weak var websiteURLTV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
    }
    

}
