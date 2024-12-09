//
//  MainMenuController.swift
//  Foodie
//
//  Created by Nurul Mustika on 05/12/24.
//

import UIKit

class MainMenuController: UITabBarController {
    
    override func viewDidLoad() {
        setupTabBar()
    }
    
    private func setupTabBar() {
        
        // Create view controllers
        let firstVC = SearchRecipesRouter.createModule()
        
        let sbSecondVC = UIStoryboard(name: "MealPlanner", bundle: nil)
        let secondVC = sbSecondVC.instantiateViewController(withIdentifier: "MealPlannerViewController")
        
        let sbThirdVC = UIStoryboard(name: "Profile", bundle: nil)
        let thirdVC = sbThirdVC.instantiateViewController(withIdentifier: "ProfileViewController")
        
        // Set tab bar items
        firstVC.tabBarItem = UITabBarItem(title: "Recipe", image: UIImage(systemName: "fork.knife.circle"), tag: 0)
        secondVC.tabBarItem = UITabBarItem(title: "Meal Planner", image: UIImage(systemName: "calendar.circle"), tag: 1)
        thirdVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 2)
        
        // Add view controllers to the tab bar controller
        self.viewControllers = [firstVC, secondVC, thirdVC]
    }
    
}

//struct MyTab {
//    var sbName: String = ""
//    var vcID: String = ""
//    var tabName: String = ""
//    var tabImg: String = ""
//}
//
//class MainMenuController: UITabBarController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print(self, #function)
//
//        let myTabs: [MyTab] = [
//            MyTab(sbName: "Recipe", vcID: "SearchRecipesViewController", tabName: "Home", tabImg: "fork.knife.circle"),
//            MyTab(sbName: "MealPlanner", vcID: "MealPlannerViewController", tabName: "Meal Planner", tabImg: "calendar.circle"),
//            MyTab(sbName: "Profile", vcID: "ProfileViewController", tabName: "Profile", tabImg: "person.circle"),
//        ]
//        
//        var vcs: [UIViewController] = []
//        
//        for (i, tb) in myTabs.enumerated() {
//            let sb = UIStoryboard(name: tb.sbName, bundle: nil)
//            let vc = sb.instantiateViewController(withIdentifier: tb.vcID)
//            let tabItem = UITabBarItem(title: tb.tabName, image: UIImage(systemName: tb.tabImg), tag: i)
//            vc.tabBarItem = tabItem
//            vcs.append(vc)
//        }
//        
//        self.viewControllers = vcs
//    }
//    
//}

