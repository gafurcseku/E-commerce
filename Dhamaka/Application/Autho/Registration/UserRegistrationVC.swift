//
//  UserRegistrationVC.swift
//  Dhamaka
//
//  Created by Invariant on 24/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField

class UserRegistrationVC: BaseVC {
    
    @IBOutlet weak var nameTextView: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTextView: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextView: SkyFloatingLabelTextField!
    @IBOutlet weak var ConfrimPasswordTextView: SkyFloatingLabelTextField!
    @IBOutlet weak var termAndConditionCheckBox: Checkbox!
    
    var ischecked:Bool = false
    let viewModel = UserRegistrationVM()
    
    var name:String?
    var fname:String?
    var lname:String?
    var phoneNumber:String?
    var opt:String?
    var email:String?
    var password:String?
    var confirmPassword:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.termAndConditionCheckBox.uncheckedBorderColor = .black
        self.termAndConditionCheckBox.checkedBorderColor = .blue
        self.termAndConditionCheckBox.borderStyle = .square
        self.termAndConditionCheckBox.checkmarkColor = .blue
        self.termAndConditionCheckBox.checkmarkStyle = .tick
        self.termAndConditionCheckBox.addTarget(self, action: #selector(checkboxValueChanged(sender:)), for: .valueChanged)
        
        self.nameTextView.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        nameTextView.delegate = self
        self.emailTextView.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        emailTextView.delegate = self
        self.passwordTextView.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextView.delegate = self
        self.ConfrimPasswordTextView.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        ConfrimPasswordTextView.delegate = self
    }
    
    @objc func checkboxValueChanged(sender: Checkbox) {
        print("checkbox value change: \(sender.isChecked)")
        self.ischecked = sender.isChecked
    }
    
    @objc func textFieldDidChange(_ textfield: UITextField) {
        self.nameTextView.errorMessage = ""
        self.emailTextView.errorMessage = ""
        self.passwordTextView.errorMessage = ""
        self.ConfrimPasswordTextView.errorMessage = ""
    }
    
    @IBAction func termAction(_ sender: Any) {
        
    }
    
    @IBAction func SignUpAction(_ sender: UIButton) {
        var done:Bool = true
        name = (nameTextView.text)?.trim()
        email = (emailTextView.text)?.trim()
        password=(passwordTextView.text)?.trim()
        confirmPassword=(ConfrimPasswordTextView.text)?.trim()
        
        if viewModel.isEmpty(text: name) {
            done = false
            nameTextView.errorMessage = "Full Name is Empty."
        }else if viewModel.isEmpty(text: email){
            done = false
            emailTextView.errorMessage = "Email Adress is Empty."
        }else if viewModel.isEmpty(text: password){
            done = false
            passwordTextView.errorMessage = "Password is Empty."
        }else if viewModel.isEmpty(text: confirmPassword){
            done = false
            ConfrimPasswordTextView.errorMessage = "Confrim Password is Empty."
        }else if password != confirmPassword {
            done = false
            Helper.showAlert(from: self, message: "Password and Confirm Password Not Same.")
        }else if !(viewModel.isValidEmail(email)){
            done = false
            emailTextView.errorMessage = "Invalid Email"
        }else if !ischecked {
             done = false
            Helper.showAlert(from: self, message: "Term and Condition is not Agree")
        }
        
        
        
        fname = viewModel.FullNameSplit(name: name).0
        lname = viewModel.FullNameSplit(name: name).1
        
        if done {
            viewModel.registrationByPhone(fname: fname!, lname: lname!, phoneNumber: phoneNumber!, otp: opt!, email: email!, password: password!) { (isSuccess) in
                if isSuccess {
                     ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.Autho.rawValue, identifier: "autho", context:self)
                }else{
                    
                }
            }
        }
        
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.Autho.rawValue, identifier: "autho", context:self)
    }
    
    
    @IBAction func backAction(_ sender: UIButton) {
        dismissEvent()
    }
    
}

extension UserRegistrationVC:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
