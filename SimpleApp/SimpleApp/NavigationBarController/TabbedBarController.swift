//
//  TabbedBarController.swift
//  SimpleApp
//
//  Created by akshay on 11/25/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import UIKit

class TabbedBarController: UITabBarController {
    var personArray = [GETPersonObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstTab = self.storyboard?.instantiateViewController(withIdentifier: "MatchedUsersVC") as! MatchedUsersViewController
        let secondTab = self.storyboard?.instantiateViewController(withIdentifier: "FilterControlViewController") as! FilterControlViewController
        let thirdTab = self.storyboard?.instantiateViewController(withIdentifier: "UserProfileSignOutViewController") as! UserProfileSignOutViewController
        firstTab.personArray = self.personArray
        firstTab.setUpCellItemsMember(personArray: self.personArray)
        firstTab.view.backgroundColor = UIColor.white
        secondTab.view.backgroundColor = UIColor.white
        thirdTab.view.backgroundColor = UIColor.white
        firstTab.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        secondTab.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        thirdTab.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)

        let viewControllerArray = [firstTab, secondTab, thirdTab]
        self.viewControllers = viewControllerArray
        self.setViewControllers(viewControllerArray, animated: true)
        self.selectedViewController = viewControllerArray[0]

    }
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}
