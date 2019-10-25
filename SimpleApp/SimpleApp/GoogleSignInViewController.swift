//
//  GoogleSignInViewController.swift
//  SimpleApp
//
//  Created by akshay on 10/21/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import UIKit
import GoogleSignIn

class GoogleSignInViewController: UIViewController{
    
    @IBOutlet weak var googleLogoImage: UIImageView!
    @IBOutlet weak var signInButton: UIButton!
    @IBAction func googleSignIn(sender: AnyObject) {
      GIDSignIn.sharedInstance().signIn()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }

}
