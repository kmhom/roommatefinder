//
//  aboutme_viewcontroller.swift
//  SimpleApp
//
//  Created by Kevin Hom on 10/19/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import UIKit

class offcampus_viewcontroller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBOutlet weak var housingPickerField: UIPickerView!
    @IBOutlet weak var carPickerField: UIPickerView!
    @IBOutlet weak var accomodationPickerField: UIPickerView!
    
    
    @IBAction func budgetSliderField(_ sender: Any) {
    }
    
    @IBAction func campus_distantSliderField(_ sender: Any) {
    }
    
    @IBAction func nextButton(_ sender: Any) {
    }
    
    @IBAction func bedtimeSliderField(_ sender: Any) {
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
