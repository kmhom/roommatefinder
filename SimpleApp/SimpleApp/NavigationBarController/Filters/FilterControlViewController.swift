//
//  FilterControlViewController.swift
//  SimpleApp
//
//  Created by akshay on 11/25/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import UIKit


class FilterControlViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var filterView: UIView!
    @IBOutlet var filterOptionsPickerView: UIPickerView!
    
    let dispatchGroup = DispatchGroup()
    lazy var personArray = [GETPersonObject]()
    lazy var ageData: [String] = [String]()
    lazy var filterOptions : [String] = [String]()
    lazy var genderOptions: [String] = [String]()
    lazy var majorOptions: [String] = [String]()
    var agePickerSelection : String!
    var filterPickerSelection: String!
    var genderPickerSelection: String!
    var majorPickerSelection: String!
    var typeOfFilter: String!
    var todoEndpoint: String!
    
    lazy var firstNameTextField: UITextField = {
        var nametextfield = UITextField(frame: CGRect(x: 0, y: 0, width: 370, height: 80))
        nametextfield.placeholder = "   Enter the first name you'd like to filter by"
        let blackcolor = UIColor.black
        nametextfield.layer.borderWidth = 2.0
        nametextfield.layer.borderColor = blackcolor.cgColor
        nametextfield.textAlignment = .center
        return nametextfield
    }()
    lazy var lastNameTextField: UITextField = {
        var LNametextfield = UITextField(frame: CGRect(x: 0, y: 0, width: 370, height: 80))
        LNametextfield.placeholder = "   Enter the last name you'd like to filter by"
        let blackcolor = UIColor.black
        LNametextfield.layer.borderWidth = 2.0
        LNametextfield.layer.borderColor = blackcolor.cgColor
        LNametextfield.textAlignment = .center
        return LNametextfield
    }()
    lazy var agePickerView: UIPickerView = {
        var picker = UIPickerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        return picker
    }()
    lazy var genderPickerView: UIPickerView = {
        var picker = UIPickerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        return picker
    }()
    lazy var majorPickerView: UIPickerView = {
    var picker = UIPickerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
    return picker
    }()
    override func viewDidAppear(_ animated: Bool) {
        self.title = "Filter"
        agePickerView.delegate = self
        agePickerView.dataSource = self
        filterOptionsPickerView.delegate = self
        filterOptionsPickerView.dataSource = self
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        majorPickerView.delegate = self
        majorPickerView.dataSource = self
        ageData = ["17","18","19","20","21","22"]
        filterOptions = ["First name", "Last name", "Age", "Gender", "Major"]
        genderOptions = ["Male", "Female", "Other"]
        majorOptions = ["Anthropology","Art History","Biochemistry","Biology","Chemistry","Child Studies","Classics","Communication","Computer Science","Economics","Engineering Physics","English","Environmental Science","Environmental Studies","Ethnic Studies","History","Mathematics","French","Italian","Spanish","Music","Neuroscience","Philosophy","Physics",
            "Political Science","Psychology","Public Health Science","Religious Studies","Sociology","Studio Art","Theatre and Dance","Women's and Gender Studies", "Bioengineering", "Civil Engineering","Computer Engineering","Electrical Engineering","Electrical and Computer Engineering","General Engineering", "Mechanical Engineering","Web Design and Engineering", "Accounting","Accounting & Information Systems","Economics","Finance","Management & Entrepreneurship","Management Information Systems","Marketing"]
        majorOptions.sort()
        filterPickerSelection = filterOptions[0]
        agePickerSelection = ageData[0]
        genderPickerSelection = genderOptions[0]
        majorPickerSelection = majorOptions[0]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func filterUsersAction(_ sender: Any) {
        //make sure that textfields are not empty
        switch filterPickerSelection{
        case filterOptions[0]:
            if firstNameTextField.text?.isEmpty ?? true {return}
        case filterOptions[1]:
            if lastNameTextField.text?.isEmpty ?? true {return}
        default:
            break
        }
        
        switch filterPickerSelection{
        case filterOptions[0]:
            makeFilteredGETRequest(typeOfFilter: typeOfFilter, filter: firstNameTextField.text ?? "")
        case filterOptions[1]:
            makeFilteredGETRequest(typeOfFilter: typeOfFilter, filter: lastNameTextField.text ?? "")
        case filterOptions[2]:
            makeFilteredGETRequest(typeOfFilter: typeOfFilter, filter: agePickerSelection)
        case filterOptions[3]:
            makeFilteredGETRequest(typeOfFilter: typeOfFilter, filter: genderPickerSelection)
        case filterOptions[4]:
            makeFilteredGETRequest(typeOfFilter: typeOfFilter, filter: majorPickerSelection.replacingOccurrences(of: " ", with: ""))
        default: break
            
        }
        
        print(self.personArray)
        let filterUsersVC = self.storyboard?.instantiateViewController(withIdentifier: "FilterTableViewController") as! FilterTableViewController
       // filterUsersVC.modalPresentationStyle = .fullScreen
        filterUsersVC.personArray = self.personArray
        filterUsersVC.setUpCellItemsMember(personArray: personArray)
        self.present(filterUsersVC, animated: true)
        
    }
    func makeFilteredGETRequest(typeOfFilter: String, filter: String!){
        dispatchGroup.enter()
        switch typeOfFilter {
        case "FirstName":
             todoEndpoint =  "https://scuroommatefinder.herokuapp.com/api/users/searchByFirstName/"
        case "LastName":
            todoEndpoint = "https://scuroommatefinder.herokuapp.com/api/users/filter/searchByLastName/"
        case "Age":
            todoEndpoint = "https://scuroommatefinder.herokuapp.com/api/users/filter/searchByAge/"
        case "Gender":
            todoEndpoint = "https://scuroommatefinder.herokuapp.com/api/users/filter/searchByGender/"
        case "Major":
            todoEndpoint = "https://scuroommatefinder.herokuapp.com/api/users/filter/searchByMajor"
        default: break
        }
        todoEndpoint += filter
        todoEndpoint = todoEndpoint.replacingOccurrences(of: "\"", with: "")
        todoEndpoint = String(todoEndpoint)
        print(todoEndpoint!)
        guard let url = URL(string: todoEndpoint!) else{
                print("Error: cannot create URL")
            return
            }
             var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            let task = session.dataTask(with: urlRequest){
                (data, response, error) in
                guard error == nil else {
                    print("Error calling GET")
                    print(error!)
                    return
                }
               let responseDataString = String(data: data!, encoding:  String.Encoding.utf8)?.replacingOccurrences(of: "\\", with: "")
                print("response data: ")
                print(responseDataString!)
                
                let data = responseDataString?.data(using: .utf8)!
                print("printing data")
                print(data)
                do{
                    if let jsonArray = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String:Any]]{
                          print("this is the jsonArray: \(jsonArray)")
                        self.personArray = self.parseThroughArray(JSONArray: jsonArray)
                        print("this is the  final personArray to used through delegates \(self.personArray)")
                    }else {print("bad json")}
                } catch let error as NSError{
                    print(error)
                }
                var jsonError: NSError?
                do{
                    print("Error: \(jsonError)")
                }
                print("second leave within post")
                self.dispatchGroup.leave()
            }
            task.resume()
        dispatchGroup.wait()
    }
    
    func setupConstraints(filterPickerSelection: String){
        switch filterPickerSelection{
        case "First name":
            agePickerView.removeFromSuperview()
            lastNameTextField.removeFromSuperview()
            genderPickerView.removeFromSuperview()
            majorPickerView.removeFromSuperview()
            filterView.addSubview(firstNameTextField)
            typeOfFilter = "FirstName"
        case "Last name":
            firstNameTextField.removeFromSuperview()
            agePickerView.removeFromSuperview()
            genderPickerView.removeFromSuperview()
            majorPickerView.removeFromSuperview()
            filterView.addSubview(lastNameTextField)
            typeOfFilter = "LastName"
        case "Age":
            firstNameTextField.removeFromSuperview()
            lastNameTextField.removeFromSuperview()
            genderPickerView.removeFromSuperview()
            majorPickerView.removeFromSuperview()
            filterView.addSubview(agePickerView)
            typeOfFilter = "Age"
        case "Gender":
            firstNameTextField.removeFromSuperview()
            lastNameTextField.removeFromSuperview()
            agePickerView.removeFromSuperview()
            majorPickerView.removeFromSuperview()
            filterView.addSubview(genderPickerView)
            typeOfFilter = "Gender"
        case "Major":
            firstNameTextField.removeFromSuperview()
            lastNameTextField.removeFromSuperview()
            agePickerView.removeFromSuperview()
            genderPickerView.removeFromSuperview()
            filterView.addSubview(majorPickerView)
            typeOfFilter = "Major"
        default:
            break
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == agePickerView{
            return ageData.count
        }
        else if pickerView == filterOptionsPickerView{
            return filterOptions.count
        }
        else if pickerView == genderPickerView{
            return genderOptions.count
        }
        else if pickerView == majorPickerView{
            return majorOptions.count
        }
        else{
            return 0
        }
    }
    
    
    private func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        if(pickerView == agePickerView){
            return ageData[row]
       }
        else if pickerView == filterOptionsPickerView{
            return filterOptions[row]
        }
        else if pickerView == genderPickerView{
            return genderOptions[row]
        }
        else if pickerView == majorPickerView{
            return majorOptions[row]
        }
        else{
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent  component: Int) {
        
        if(pickerView == agePickerView){
            agePickerSelection = ageData[row]
        }
        else if( pickerView == genderPickerView){
            genderPickerSelection = genderOptions[row]
        }
        else if(pickerView == majorPickerView){
            majorPickerSelection = majorOptions[row]
        }
            
        else if pickerView == filterOptionsPickerView{
            filterPickerSelection = filterOptions[row]
            setupConstraints(filterPickerSelection: filterPickerSelection)
            }
        }
    
    func parseThroughArray(JSONArray: [[String:Any]]) -> [GETPersonObject]{
        var  tempPersonArray = [GETPersonObject]()
        for jsonObject in JSONArray{
            tempPersonArray.append(GETPersonObject.init(personObject: jsonObject))
        }
        return tempPersonArray
    }
    func tempParseThroughArray() -> [GETPersonObject]{
        var  tempPersonArray = [GETPersonObject]()
        for i in 0...9{
            tempPersonArray.append(GETPersonObject.init())
        }
        return tempPersonArray
    }
}
    

