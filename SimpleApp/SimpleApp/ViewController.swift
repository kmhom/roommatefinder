//
//  ViewController.swift
//  SimpleApp
//
//  Created by Kevin Hom on 10/9/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    //MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        guard let nameText = nameTextField.text
            else {return}
        guard let ageText = ageTextField.text
            else {return}
        guard let genderText = genderTextField.text
            else {return}
        guard let majorText = majorTextField.text
            else {return}
        guard let yearText = yearTextField.text
            else{return}
        guard let emailTextField = emailTextField.text
            else{return}
        guard let locationTextField = locationTextField.text
            else{return}
        
        if(nameTextField.text?.isEmpty ?? true || ageTextField.text?.isEmpty ?? true || genderTextField.text?.isEmpty ?? true || majorTextField.text?.isEmpty ?? true || yearTextField.text?.isEmpty ?? true ||
            emailTextField.text?.isEmpty ?? true ||
            locationTextField.text?.isEmpty ?? true){
            
            let alert = UIAlertController(title: "Please fill in the missing fields", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {action in print("Ok action clicked")}))
            
            self.present(alert, animated: true)
            return
        }
        
        let basicInfoJSON:[String: Any] = [
            "Name": nameText,
            "Age": ageText,
            "Gender": genderText,
            "Major": majorText,
            "Year": yearText
        ]
        print(basicInfoJSON)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func uploadprofilePicture(_ sender: Any) {
    }
    
    
}
