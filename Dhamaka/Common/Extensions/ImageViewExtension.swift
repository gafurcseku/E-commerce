//
//  ImageViewExtension.swift
//  Dhamaka
//
//  Created by Invariant on 7/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func makeRounded() {
       // self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        //self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
