//
//  ForgotPasswordVC.swift
//  Dhamaka
//
//  Created by Invariant on 26/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField

class ForgotPasswordVC: BaseVC {
    
    @IBOutlet weak var emailMobileTextField: SkyFloatingLabelTextField!
    
    let viewModel = ForgotPasswordVM()
    var mobileOrEmail:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailMobileTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textfield: UITextField) {
        emailMobileTextField.errorMessage = ""
    }
    
    @IBAction func CoutinueAction(_ sender: UIButton) {
        
        mobileOrEmail = (emailMobileTextField.text)?.trim()
        
        if viewModel.isEmpty(text: mobileOrEmail){
            emailMobileTextField.errorMessage = "Mobile Number/Email is Empty."
        }else if(Helper.isValidPhoneNumber(mobileOrEmail).0){
            print("Mobile number")
            let forgotMobilevc = ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.ResetPassword.rawValue, identifier: "mobileNumbervc")
            let navController = UINavigationController(rootViewController: forgotMobilevc)
            self.present(navController, animated:true, completion: nil)
        }else if(Helper.isValidEmail(mobileOrEmail)){
             print("Email number")
            let forgotEmailvc = ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.ResetPassword.rawValue, identifier: "emailvc")
            let navController = UINavigationController(rootViewController: forgotEmailvc)
            self.present(navController, animated:true, completion: nil)
            
//            let forgot = ForgotEmailVC()
//            self.navigationController?.pushViewController(forgot, animated: true)
        }else {
             emailMobileTextField.errorMessage = "Mobile Number/Email is invalid."
        }
    }
    
    
    @IBAction func backAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
