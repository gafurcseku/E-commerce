//
//  UserSignUpVC.swift
//  Dhamaka
//
//  Created by Invariant on 24/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField
import SVProgressHUD

class UserSignUpVC: BaseVC {
    
    @IBOutlet weak var mobileNumberTextView: SkyFloatingLabelTextField!
    @IBOutlet weak var verificationTextView: SkyFloatingLabelTextField!
    @IBOutlet weak var sendOTPButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    var phoneNumber:String?
    var verificationCode:String?
    
    let viewModel = UserSignUpVM()
    var timer = Timer()
    var seconds = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mobileNumberTextView.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        mobileNumberTextView.delegate = self
        verificationTextView.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        verificationTextView.isEnabled = false
        verificationTextView.delegate = self
        signupButton.isEnabled = false
    }
    
    @objc func textFieldDidChange(_ textfield: UITextField) {
        if let text = textfield.text {
            let flag = Helper.isValidPhoneNumber(text).0
            if textfield.tag == 333 , let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                if(text.count > 1 && !flag) {
                    floatingLabelTextField.errorMessage = "Invalid Phone Number"
                }
                else {
                    floatingLabelTextField.errorMessage = ""
                }
            } else if textfield.tag == 334 , let otpfloatingLabelTextField = textfield as? SkyFloatingLabelTextField{
                if(text.count > 1) {
                    otpfloatingLabelTextField.errorMessage = "Invalid Verification Code"
                }
                else {
                    otpfloatingLabelTextField.errorMessage = ""
                }
            }
        }
    }
    
    
    @IBAction func sendOPTAction(_ sender: UIButton) {
        var done:Bool = true
        phoneNumber = (mobileNumberTextView.text!).trimmingCharacters(in: .whitespacesAndNewlines)
        
        if viewModel.isEmpty(text: phoneNumber){
            mobileNumberTextView.errorMessage = "Mobile Number is Empty"
            done = false
        }else if !Helper.isValidPhoneNumber(phoneNumber).0 {
            mobileNumberTextView.errorMessage = "Invalid Phone Number"
            done = false
        }
        
        if  done {
            SVProgressHUD.show()
            viewModel.sendOTP(phone: phoneNumber!) { (isSuccess,data) in
                SVProgressHUD.dismiss()
                if isSuccess{
                    Helper.showAlert(from: self, message: data)
                    self.sendOTPButton.isEnabled = false
                    self.verificationTextView.isEnabled = true
                    self.signupButton.isEnabled = true
                    self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
                }else{
                    if(data.count>0){
                        Helper.showAlert(from: self, message: "\(data) . Please Login in your Account.")
                    }
                }
            }
        }
    }
    
    @objc func updateTimer() {
        seconds -= 1
        if(seconds == 0){
            self.timer.invalidate()
            self.seconds = 60
            self.sendOTPButton.setTitle("Resend OTP", for: .normal)
            self.sendOTPButton.isEnabled = true
            self.verificationTextView.isEnabled = false
            self.signupButton.isEnabled = false
        }else{
            sendOTPButton.setTitle("\(seconds) s", for: .normal)
        }
        
        
    }
    
    @IBAction func verificationAction(_ sender: UIButton) {
        var done:Bool = true
        verificationCode = (verificationTextView.text)?.trim()
        phoneNumber = (mobileNumberTextView.text!).trimmingCharacters(in: .whitespacesAndNewlines)
        if viewModel.isEmpty(text: phoneNumber){
            mobileNumberTextView.errorMessage = "Mobile Number is Empty"
            done = false
        }else if !Helper.isValidPhoneNumber(phoneNumber).0 {
            mobileNumberTextView.errorMessage = "Invalid Phone Number"
            done = false
        }else if viewModel.isEmpty(text: verificationCode){
            verificationTextView.errorMessage = "Invalid Verification Code"
            done = false
        }
        
        if done {
            viewModel.verificationOTP(phone: phoneNumber!, otp: verificationCode!) { (isSuccess) in
                if isSuccess {
                    let registrationvc = ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.Autho.rawValue, identifier: "registration") as? UserRegistrationVC
                    registrationvc?.phoneNumber = self.phoneNumber
                    registrationvc?.opt = self.verificationCode
                    self.present(registrationvc!, animated: true, completion: nil)
                }else{
                    Helper.showAlert(from: self, message: "OTP verification Fail.")
                }
            }
        }
        
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        dismissNav()
    }
    @IBAction func SignInAction(_ sender: UIButton) {
        dismissNav()
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
}

extension UserSignUpVC:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
