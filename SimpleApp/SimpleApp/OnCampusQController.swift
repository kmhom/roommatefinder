//
// Roommate questionnaire for on-campus users
//

import Foundation
import DropDown

import UIKit

class OnCampusQController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Outlets - storyboard views
    
    // Drop-down lists
    @IBOutlet weak var DormView: UIView!
    @IBOutlet weak var HobbyView: UIView!
    @IBOutlet weak var SuiteView: UIView!
    
    // Time pickers
    @IBOutlet weak var BedView: UIDatePicker!
    @IBOutlet weak var WakeView: UIDatePicker!
    
    // Buttons
    @IBOutlet weak var GuestsYesView: UIButton!
    @IBOutlet weak var GuestsNoView: UIButton!
    
    // Sliders
    @IBOutlet weak var ShySliderView: UISlider!
    @IBOutlet weak var SelfishSliderView: UISlider!
    @IBOutlet weak var CleanSliderView: UISlider!
    @IBOutlet weak var NoiseSliderView: UISlider!
    
    // Instance variables to hold the dropdown objects
    var DormListObj = DropDown()
    var HobbyListObj = DropDown()
    var SuiteListObj = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DormListObj.anchorView = DormView
        HobbyListObj.anchorView = HobbyView
        SuiteListObj.anchorView = SuiteView
        
        // Populate the drop-down objects with possible user selections
        DormListObj.dataSource = ["Casa Italiana", "Campisi Hall", "Dunne Hall", "Finn Hall", "Graham Hall", "McLaughlin-Walsh Hall", "Nobili Hall", "Sanfilippo Hall", "Sobrato Hall", "Swig Hall", "University Villas"]
        SuiteListObj.dataSource = ["Suite", "Double"]
        HobbyListObj.dataSource = ["Video games", "Reading", "etc"] // Need to finalize this list
        
        // Update dropdowns to display the user's selections
        DormListObj.selectionAction = { [unowned self] (index: Int, item: String) in
        print("Selected item: \(item)")
        }
        SuiteListObj.selectionAction = { [unowned self] (index: Int, item: String) in
        print("Selected item: \(item)")
        }
        HobbyListObj.selectionAction = { [unowned self] (index: Int, item: String) in
        print("Selected item: \(item)")
        }
    }
}
