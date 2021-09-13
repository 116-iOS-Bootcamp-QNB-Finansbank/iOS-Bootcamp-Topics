//
//  ButtonViewController.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 11.09.2021.
//

import UIKit

class ButtonViewController: UIViewController {

    @IBOutlet weak var myLabel: MyLabel!
    @IBOutlet weak var myButton: MyButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpMyButton()
        showCount()
    }
    
    private var count: Int = 0
    
    @IBAction func myButtonTapped(_ sender: UIButton) {
        count += 1
        showCount()
    }
    
    func setUpMyButton() {
        myButton.setTitle("Tap On Me!", for: .normal)
    }
    
    func showCount() {
        myLabel.text = String(count)
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
