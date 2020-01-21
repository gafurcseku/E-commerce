//
//  CustomTextField.swift
//  Dhamaka
//
//  Created by Invariant on 20/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class CustomTextField: SkyFloatingLabelTextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        selectedTitle = " "
        title = " "
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        selectedTitle = " "
        title = " "
    }
    
    let padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
