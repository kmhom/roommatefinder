//
//  GoogleSignInViewController.swift
//  SimpleApp
//
//  Created by akshay on 10/21/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import UIKit
import GoogleSignIn

class GoogleSignInViewController: UIViewController, GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
          withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabbarVC = self.storyboard?.instantiateViewController(withIdentifier: "BasicProfileViewController") as! ViewController
            tabbarVC.modalPresentationStyle = .fullScreen
            self.present(tabbarVC, animated: false, completion: nil)
        }
    }
    
    @IBOutlet weak var googleLogoImage: UIImageView!
    @IBOutlet weak var signInButton: UIButton!
    @IBAction func googleSignIn(sender: AnyObject) {
      GIDSignIn.sharedInstance().signIn()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }

}
