//
//  UserProfileSignOutViewController.swift
//  SimpleApp
//
//  Created by akshay on 11/25/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import UIKit
import GoogleSignIn

class UserProfileSignOutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Signout"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOut(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signOut()
        let signInScreen = self.storyboard?.instantiateViewController(withIdentifier: "GoogleSignInViewController") as! GoogleSignInViewController
        signInScreen.modalPresentationStyle = .fullScreen
        self.present(signInScreen, animated:true)
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
