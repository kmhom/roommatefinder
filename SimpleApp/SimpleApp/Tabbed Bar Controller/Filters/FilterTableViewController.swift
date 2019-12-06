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
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FilterMatchedCells.self, forCellReuseIdentifier: "filterMatchedUsersCellId")
    }

    func setUpCellItemsMember(personArray: [GETPersonObject]){
     var nameArray = [String]()
     var genderArray = [String]()
     var ageArray =  [Int]()
     var yearArray = [String]()
     var majorArray = [String]()
     var onOrOffCampusArray = [String]()
     for i in 0...9{
         nameArray.append("\(personArray[i].firstName) \(personArray[i].lastName)")
         genderArray.append(personArray[i].gender as? String ?? "no gender")
         ageArray.insert(personArray[i].age as? Int ?? 0, at: i)
         yearArray.append(personArray[i].grade as? String ?? "no year")
         majorArray.append(personArray[i].major as? String ?? "no major")
         onOrOffCampusArray.append(personArray[i].aboutMeCampusLiving as? String ?? "neither")
     }
         cellItems["Names"] = nameArray
         cellItems["Gender"] = genderArray
         cellItems["Age"] = ageArray
         cellItems["Year"] = yearArray
         cellItems["Major"] = majorArray
         cellItems["On/Off Campus"] = onOrOffCampusArray
         
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterMatchedUsersCellId", for: indexPath) as! FilterMatchedCells
        cell.delegate = self
        cell.backgroundColor = UIColor.white
        cell.setUpView()
        cell.nameLabel.text = "Name: \(cellItems["Names"]![indexPath.row] as? String ?? "")"
               cell.genderLabel.text = "Gender: \(cellItems["Gender"]![indexPath.row] as? String ?? "")"
               cell.ageLabel.text = cellItems["Age"]?[indexPath.row] as? String
               cell.underGraduateYearLabel.text = cellItems["Year"]?[indexPath.row] as? String ?? ""
               cell.majorLabel.text = cellItems["Major"]?[indexPath.row] as? String ?? ""
               cell.onOrOffCampusLabel.text = cellItems["On/Off Campus"]?[indexPath.row] as? String ?? ""
               return cell
    }
    //view presenter protocol
    func presentButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "UserDetail") as? UserProfileViewController
        viewController?.modalPresentationStyle = .fullScreen
        viewController?.view.backgroundColor = UIColor.white
        self.present(viewController!, animated: true, completion: nil)
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
        label.text = "Name: "
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender: "
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age: "
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let underGraduateYearLabel: UILabel = {
        let label = UILabel()
        label.text = "Year: "
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let majorLabel: UILabel = {
        let label = UILabel()
        label.text = "Major: "
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let onOrOffCampusLabel: UILabel = {
        let label = UILabel()
        label.text = "On/Off Campus: "
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let presentButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
            let image = UIImage(named: "sidewaysCarrot.png") as UIImage?
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
        nameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: -80).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
       //gender
        genderLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        genderLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        genderLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: -50).isActive = true
        genderLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        //age
        ageLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ageLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        ageLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: -20).isActive = true
        ageLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        //undergrad year
        underGraduateYearLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        underGraduateYearLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        underGraduateYearLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: 10).isActive = true
        underGraduateYearLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        //major
        majorLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        majorLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        majorLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: 40).isActive = true
        majorLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        //on or campus
        onOrOffCampusLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        onOrOffCampusLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        onOrOffCampusLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: 70).isActive = true
        onOrOffCampusLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        //button constraints
        presentButton.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: 20).isActive = true
        presentButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        presentButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        presentButton.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: 70).isActive = true
    }
    @IBAction func presentNewView(sender: UIButton){
        self.delegate.presentButtonTapped()
       }
}
