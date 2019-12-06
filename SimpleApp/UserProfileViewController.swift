//
//  UserProfileViewController.swift
//  SimpleApp
//
//  Created by akshay on 11/26/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {

    @IBOutlet var hobbiesTextView: UITextView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var majorLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hobbiesTextView?.layer.borderWidth = 1
        self.hobbiesTextView?.layer.borderColor = UIColor.gray.cgColor

        // Do any additional setup after loading the view.
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
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
