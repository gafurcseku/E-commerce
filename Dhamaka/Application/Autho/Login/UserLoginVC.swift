//
//  UserLoginVC.swift
//  Dhamaka
//
//  Created by Invariant on 20/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField
import SVProgressHUD

class UserLoginVC: BaseVC {
    
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    
    var email:String?
    var password:String?
    var viewModel = UserLoginVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        emailTextField.delegate = self
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.delegate = self
    }
    
    @objc func textFieldDidChange(_ textfield: UITextField) {
       
    }
    
    @IBAction func userLoginAction(_ sender: UIButton) {
        email = emailTextField.text
        password = passwordTextField.text
        
        SVProgressHUD.show()
        viewModel.UserLogin(email: email!, password: password!) { (isSuccess) in
            SVProgressHUD.dismiss()
            if isSuccess {
                self.dismissNav()
            }
        }
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        dismissNav()
    }
    
}

extension UserLoginVC:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
