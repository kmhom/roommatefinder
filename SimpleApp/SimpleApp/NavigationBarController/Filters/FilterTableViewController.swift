//
//  FilterTableViewController.swift
//  SimpleApp
//
//  Created by akshay on 12/5/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import UIKit


class FilterTableViewController: UITableViewController, ViewPresenter {
    
    var personArray = [GETPersonObject]()
    var cellItems = [String:[Any]]()
    
    private lazy var backButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        button.setTitle("Back", for: .normal)
        return button
    }()
    private lazy var tableHeaderView : UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        view.backgroundColor = .white
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FilterMatchedCells.self, forCellReuseIdentifier: "filterMatchedUsersCellId")
        tableView.separatorColor = .black

    }

    func setUpCellItemsMember(personArray: [GETPersonObject]){
     var nameArray = [String]()
     var genderArray = [String]()
     var ageArray =  [Int]()
     var yearArray = [String]()
     var majorArray = [String]()
     var onOrOffCampusArray = [String]()
        var hobbiesArray = [String]()
     for i in 0...9{
         nameArray.append("\(personArray[i].firstName) \(personArray[i].lastName)")
         genderArray.append(personArray[i].gender as? String ?? "no gender")
         ageArray.append(personArray[i].age)
         yearArray.append(personArray[i].grade as? String ?? "no year")
         majorArray.append(personArray[i].major as? String ?? "no major")
         onOrOffCampusArray.append(personArray[i].aboutMeCampusLiving as? String ?? "neither")
         hobbiesArray.append(personArray[i].aboutMeHobbies as? String ?? "No hobbies given")
     }
         cellItems["Names"] = nameArray
         cellItems["Gender"] = genderArray
         cellItems["Age"] = ageArray
         cellItems["Year"] = yearArray
         cellItems["Major"] = majorArray
         cellItems["On/Off Campus"] = onOrOffCampusArray
        cellItems["Hobbies"] = hobbiesArray
         
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableHeaderView.addSubview(backButton)
        tableView.tableHeaderView = tableHeaderView
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterMatchedUsersCellId", for: indexPath) as! FilterMatchedCells
        cell.delegate = self
        cell.backgroundColor = UIColor.white
        cell.setUpView()
        cell.nameLabel.text = "Name: \(cellItems["Names"]![indexPath.row] as? String ?? "")"
               cell.genderLabel.text = "Gender: \(cellItems["Gender"]![indexPath.row] as? String ?? "")"
               cell.ageLabel.text = "Age: \((cellItems["Age"]![indexPath.row] as! Int))"
               cell.underGraduateYearLabel.text = cellItems["Year"]?[indexPath.row] as? String ?? ""
               cell.majorLabel.text = cellItems["Major"]?[indexPath.row] as? String ?? ""
               cell.onOrOffCampusLabel.text = cellItems["On/Off Campus"]?[indexPath.row] as? String ?? ""
               return cell
    }
    //view presenter protocol
    func presentButtonTapped() {
        let userProfileViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserDetail") as! UserProfileViewController
        userProfileViewController.modalPresentationStyle = .fullScreen
        userProfileViewController.view.backgroundColor = UIColor.white
        self.present(userProfileViewController, animated: true, completion: nil)
        userProfileViewController.nameLabel.text = "Name: \((cellItems["Names"]![0] as? String)!)"
        userProfileViewController.genderLabel.text = "Gender: \((cellItems["Gender"]?[0])!)"
        userProfileViewController.ageLabel.text = "Age: \((cellItems["Age"]![0] as! Int))"
        userProfileViewController.yearLabel.text = "Year: \((cellItems["Year"]?[0])!)"
        userProfileViewController.majorLabel.text = "Major: \((cellItems["Major"]?[0])!)"
         
         userProfileViewController.emailLabel.text = "Email: \((personArray[0].firstName as! String).lowercased()).\((personArray[0].lastName as! String).lowercased())@gmail.com"
         userProfileViewController.hobbiesTextView.text = "\((cellItems["Hobbies"]![0] as? String)!)"
    }
    

}

class FilterMatchedCells: UITableViewCell{
    var delegate: ViewPresenter!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.widthAnchor.constraint(equalToConstant: 375).isActive = true
        label.text = "Name: "
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let genderLabel: UILabel = {
        let label = UILabel()
        label.widthAnchor.constraint(equalToConstant: 375).isActive = true
        label.text = "Gender: "
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let ageLabel: UILabel = {
        let label = UILabel()
        label.widthAnchor.constraint(equalToConstant: 375).isActive = true
        label.text = "Age: "
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let underGraduateYearLabel: UILabel = {
        let label = UILabel()
        label.widthAnchor.constraint(equalToConstant: 375).isActive = true
        label.text = "Year: "
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let majorLabel: UILabel = {
        let label = UILabel()
        label.widthAnchor.constraint(equalToConstant: 375).isActive = true
        label.text = "Major: "
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let onOrOffCampusLabel: UILabel = {
        let label = UILabel()
        label.widthAnchor.constraint(equalToConstant: 375).isActive = true
        label.text = "On/Off Campus: "
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let presentButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
            let image = UIImage(named: "disclosureimage.png") as UIImage?
            button.setImage(image, for: [])
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
    }()
    func setUpView(){
        addSubview(cellView)
        cellView.addSubview(nameLabel)
        cellView.addSubview(genderLabel)
        cellView.addSubview(ageLabel)
        cellView.addSubview(underGraduateYearLabel)
        cellView.addSubview(majorLabel)
        cellView.addSubview(onOrOffCampusLabel)
        cellView.addSubview(presentButton)
        presentButton.addTarget(self, action: #selector(presentNewView), for: .touchUpInside)
        self.selectionStyle = .none
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor),//, constant: 20),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor),//, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor),//, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
       //name
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: -80).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
       //gender
        genderLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        genderLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: -50).isActive = true
        genderLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        //age
        ageLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ageLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: -20).isActive = true
        ageLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        //undergrad year
        underGraduateYearLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        underGraduateYearLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: 10).isActive = true
        underGraduateYearLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        //major
        majorLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        majorLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: 40).isActive = true
        majorLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        //on or campus
        onOrOffCampusLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        onOrOffCampusLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: 70).isActive = true
        onOrOffCampusLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        //button constraints
        presentButton.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -20).isActive = true
        presentButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        presentButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        presentButton.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: 0).isActive = true
    }
    @IBAction func presentNewView(sender: UIButton){
        self.delegate.presentButtonTapped()
       }
}
