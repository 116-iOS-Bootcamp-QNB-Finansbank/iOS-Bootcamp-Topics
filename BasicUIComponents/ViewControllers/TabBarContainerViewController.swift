//
//  TabBarContainerViewController.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 18.09.2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         
        self.delegate = self
        
        configureTabBar()
    }
    
    private func configureTabBar() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let buttonVC = storyboard.instantiateViewController(identifier: "ButtonViewController")
        buttonVC.tabBarItem.title = "buttonVC"
        buttonVC.title = "buttonVC"
        buttonVC.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
        buttonVC.tabBarItem.image = UIImage(systemName: "trash")
        buttonVC.view.tag = 0
        
        let navigationVC = storyboard.instantiateViewController(identifier: "NavigationExampleViewController")
        navigationVC.tabBarItem.title = "navigationVC"
        navigationVC.title = "navigationVC"
        navigationVC.view.tag = 1
        navigationVC.tabBarItem.image = UIImage(systemName: "note")
        
        let calculatorVC = storyboard.instantiateViewController(identifier: "CalculatorViewController")
        calculatorVC.tabBarItem.title = "calculatorVC"
        calculatorVC.tabBarItem.image = UIImage(systemName: "calendar")
        calculatorVC.tabBarItem.selectedImage = UIImage(systemName: "terminal")
        calculatorVC.view.tag = 2
        
        let myViewControllers = [buttonVC, navigationVC, calculatorVC]
        
        self.setViewControllers(myViewControllers, animated: false)
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

extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.view.tag == 1 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navigationVC = storyboard.instantiateViewController(identifier: "NavigationExampleViewController")
            self.present(navigationVC, animated: true, completion: nil)
        }
        return viewController.view.tag == 1 ? false : true
    }
}
