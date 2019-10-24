//
//  offcampus3_ViewController.swift
//  SimpleApp
//
//  Created by Kevin Hom on 10/19/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import UIKit

class offcampus3_ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        <#code#>
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func listHobbiesTextFIeld(_ sender: Any) {
    }
    
    
    @IBOutlet weak var additionalinfoTextView: UITextView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func wakeuptimePicker(_ sender: UIDatePicker) {
        datePicker.	datePickerMode = UIDatePicker.Mode.Time
    }
    
}
