//
//  ForgotPasswordVM.swift
//  Dhamaka
//
//  Created by Invariant on 26/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation

class ForgotPasswordVM: BaseVM {
    
    func isEmpty(text:String?) -> Bool {
        if let emptyText = text{
            if emptyText.containsNonWhitespace{
                return emptyText.count < 0
            } else {
                return true
            }
        } else {
            return true
        }
    }
}
