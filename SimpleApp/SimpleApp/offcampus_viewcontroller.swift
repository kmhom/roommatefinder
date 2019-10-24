//
//  aboutme_viewcontroller.swift
//  SimpleApp
//
//  Created by Kevin Hom on 10/19/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import UIKit

class offcampus_viewcontroller: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource, UITableViewController{
    
    @IBOutlet weak var carPickerField: UIPickerView!
    @IBOutlet weak var accomodationPickerField: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func budgetSliderField(_ sender: Any) {
    }
    
    @IBAction func campus_distantSliderField(_ sender: Any) {
    }
    
    @IBAction func nextButton(_ sender: Any) {
    }
    
    @IBAction func bedtimePicker(_ sender: Any) {
    }
    
    //ignore this stuff, I was trying to get the PickerView working
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return housingdataSource[row]
    }
       
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return housingdataSource.count
    }
    
    
    
    //MARK: Housing Question Table View/Cells
     private let housingdataSource = ["Apartment", "House", "Townhouse", "Condo"]
    @IBOutlet weak var housingTable: UITableView!
    @IBOutlet weak var apartmentCell: UITableViewCell!
    @IBOutlet weak var townhouseCell: UITableViewCell!
    @IBOutlet weak var houseCell: UITableViewCell!
    @IBOutlet weak var condoCell: UITableViewCell!
    
    
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
