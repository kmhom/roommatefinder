//
//  ViewController.swift
//  SimpleApp
//
//  Created by Kevin Hom on 10/9/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController{
    
    //protocol member
    var jsonPassedThroughViews: [String : Any] = [:]
    var jsonDelegate: JSONTransferDelegateProtocol? = nil
//    var basicInfoJSON: [String: Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    //MARK: Properties
    
    @IBOutlet weak var settingsButton: UIButton!
    @IBAction func settingsAction(_ sender: Any) {
        let signOutAlert = UIAlertController(title: "Would you like to signout?", message: nil, preferredStyle: .alert)
        signOutAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler:
            {
                action in
                print("Yes clicked")
        
        GIDSignIn.sharedInstance()?.signOut()
                self.performSegue(withIdentifier: "backToSignIn", sender: self)
                
                
                
       
        }))
        signOutAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {action in print("No clicked")}))
        
        self.present(signOutAlert, animated: true)
        return
    }
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
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
        
        if(nameTextField.text?.isEmpty ?? true || ageTextField.text?.isEmpty ?? true || genderTextField.text?.isEmpty ?? true || majorTextField.text?.isEmpty ?? true || yearTextField.text?.isEmpty ?? true){
            
            let alert = UIAlertController(title: "Please fill in the missing fields", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {action in print("Ok action clicked")}))
            
            self.present(alert, animated: true)
            return
        }
        
        jsonPassedThroughViews = [
            "Name": nameText,
            "Age": ageText,
            "Gender": genderText,
            "Major": majorText,
            "Year": yearText
        ]
        print(jsonPassedThroughViews)
        let onCampusVC = self.storyboard?.instantiateViewController(withIdentifier: "OnCampusVC") as! OnCampusAboutMeViewController
        onCampusVC.modalPresentationStyle = .fullScreen
        onCampusVC.jsonFromPreviousPage = jsonPassedThroughViews
        
        present(onCampusVC, animated:true)
        
    }
}
