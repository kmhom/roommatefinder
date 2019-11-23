//
//  scrollController.swift
//  SimpleApp
//
//  Created by Kevin Hom on 10/30/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import UIKit

class scrollController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.housingOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = housingChoice.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
        
        cell.textLabel?.text = self.housingOptions[indexPath.row]
        
        return cell
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    lazy var jsonFromPreviousPage: [String : Any] = [:]
    let housingOptions: [String] = ["Apartment", "Townhouse", "Flat", "House"]
    
    let yesNO: [String] = ["Yes", "No"]
    
    let orgMessy: [String] = ["Organized", "Messy"]
    
    let cellReuseIdentifier = "cell"
    
    //MARK: Multiple Choice TableView
    @IBOutlet weak var housingChoice: UITableView!
    @IBOutlet weak var haveCar: UITableView!
    @IBOutlet weak var haveidealAccomodation: UITableView!
    @IBOutlet weak var guestOften: UITableView!
    @IBOutlet weak var doesShare: UITableView!
    @IBOutlet weak var isMessy: UITableView!
    @IBOutlet weak var havePet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.housingChoice.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        housingChoice.dataSource = self
        housingChoice.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in housingChoice: UITableView) -> Int {
        return 1
    }
    
    func housingChoice(_ housingChoice: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.housingOptions.count
    }
    
    func housingChoice(_ housingChoice: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = housingChoice.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
        
        cell.textLabel?.text = self.housingOptions[indexPath.row]
        
        return cell
    }
    
    func housingChoice(_ housingChoice: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
   
    
    
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
