//
//  ViewController.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 5.09.2021.
//

import UIKit

class LabelAndTextFieldViewController: UIViewController {

    @IBOutlet weak var myAutoLayoutLabel: MyLabel!
    
    @IBOutlet weak var myTextFileld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.addArrangedSubview(UIView())
        */
        
        myTextFileld.placeholder = "Isim Soyisim"
        
        myTextFileld.keyboardType = .numberPad
        myTextFileld.inputAccessoryView = addKeyboardToolbar()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(endEditing(_:)))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    private var myLabel: UILabel!
    
    func setMyLabel() {
        myAutoLayoutLabel.text = "Text"
        
    }
    
    func addKeyboardToolbar() -> UIToolbar {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        let doneButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(endEditing(_:)))
        toolbar.items = [doneButton]
        return toolbar
    }
    
    @objc private func endEditing(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func textFieldValueChanged(_ sender: UITextField) {
        myAutoLayoutLabel.text = "Merhaba \(sender.text ?? "")"
    }
    
}

extension LabelAndTextFieldViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("Did end editing") //trigger validate
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // numeric regex
        // regex uygunsa true : false
        
//        print("string", string)
//        print("range", range)
//
//        return NSString(string: string).intValue > 5
        
        return true
    }
    
    
}
