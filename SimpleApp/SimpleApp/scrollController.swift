//
//  scrollController.swift
//  SimpleApp
//
//  Created by Kevin Hom on 10/30/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import UIKit

class scrollController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    //MARK: Multiple Choice TableView
    @IBOutlet weak var housingChoice: UITableView!
    @IBOutlet weak var haveCar: UITableView!
    @IBOutlet weak var haveidealAccomodation: UITableView!
    @IBOutlet weak var guestOften: UITableView!
    @IBOutlet weak var doesShare: UITableView!
    @IBOutlet weak var isMessy: UITableView!
    @IBOutlet weak var havePet: UITableView!
    
    //MARK: Time UIDatePicker
    @IBAction func sleepTime(_ sender: Any) {
    }
    
    @IBAction func wakeTime(_ sender: Any) {
    }
    
    //MARK: UISlider
    @IBAction func maxBudget(_ sender: Any) {
    }
    
    @IBAction func distfromCampus(_ sender: Any) {
    }
    
    @IBAction func isExtroverted(_ sender: Any) {
    }
    
    //MARK: User Writing UITextView
    @IBOutlet weak var listHobbies: UITextView!
    @IBOutlet weak var additionInfo: UITextView!
    
    //MARK: Buttons
    
    
    @IBAction func submitInfo(_ sender: Any) {
    }
}
