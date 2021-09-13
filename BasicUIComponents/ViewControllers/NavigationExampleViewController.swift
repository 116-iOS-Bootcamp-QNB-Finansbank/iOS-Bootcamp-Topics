//
//  NavigationExampleViewController.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 12.09.2021.
//

import UIKit

class NavigationExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Example"
        let rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @IBAction func popButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func popToRootButtonTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func presentButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "NavigationExampleViewController")
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
        //self.navigationController?.pushViewController(viewController, animated: true)
        /*
        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController?.pushViewController(navigationController, animated: true)
         */
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
