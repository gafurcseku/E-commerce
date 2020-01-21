//
//  CarouselView.swift
//  Dhamaka
//
//  Created by Invariant on 4/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit

class CarouselView: UIView {
    
    @IBOutlet weak var introUIImageView: UIImageView!
    @IBOutlet weak var titleUILabel: UILabel!
    @IBOutlet weak var subtitleUILabel: UILabel!
    @IBOutlet var customView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        RegisterXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        RegisterXib()
        
    }
    
    init(frame: CGRect , same:String) {
        super.init(frame: frame)
        //titleUILabel.text = same
        
    }
    
    private func RegisterXib() {
        let xibCustomView = UINib(nibName: "CarouselView", bundle: nil)
        xibCustomView.instantiate(withOwner: self, options: nil)
        customView.frame = bounds
        addSubview(customView)
    }
}
