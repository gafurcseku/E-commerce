//
//  ProductRatingVC.swift
//  Dhamaka
//
//  Created by Invariant on 2/1/20.
//  Copyright © 2020 invariant. All rights reserved.
//

import Foundation
import UIKit
import Cosmos

class ProductRatingVC: BaseVC {
    
    var viewModel = ProductDetailsVM()
    
    @IBOutlet weak var ratingValueLabel: UILabel!
    @IBOutlet weak var ratingValueView: CosmosView!
    @IBOutlet weak var ratingCountLabel: UILabel!
    
    @IBOutlet weak var fiveProgressView: UIProgressView!
    @IBOutlet weak var fiveProgressLabel: UILabel!
    
    @IBOutlet weak var fourProgressView: UIProgressView!
    @IBOutlet weak var fourProgressLabel: UILabel!
    
    @IBOutlet weak var threeProgressView: UIProgressView!
    @IBOutlet weak var threeProgressLabel: UILabel!
    
    @IBOutlet weak var twoProgressView: UIProgressView!
    @IBOutlet weak var twoProgressLabel: UILabel!
    
    @IBOutlet weak var oneProgressView: UIProgressView!
    @IBOutlet weak var oneProgressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingValueLabel.text = "\(viewModel.ratingValue)"
        
        ratingValueView.settings.updateOnTouch = false
        ratingValueView.rating = viewModel.ratingValue
        
        ratingCountLabel.text = "\(viewModel.ratingUserCount) Rating"

        let five = getPercentage(rating: viewModel.ratingFive,total: Double(viewModel.ratingUserCount))
        fiveProgressView.progress = five/100
        fiveProgressLabel.text = "\(Int(five))%"
        
        let four = getPercentage(rating: viewModel.ratingFour,total: Double(viewModel.ratingUserCount))
        fourProgressView.progress = four/100
        fourProgressLabel.text = "\(Int(four))%"
        
        let three = getPercentage(rating: viewModel.ratingThree,total: Double(viewModel.ratingUserCount))
        threeProgressView.progress = three/100
        threeProgressLabel.text = "\(Int(three))%"
        
        let two = getPercentage(rating: viewModel.ratingTwo,total: Double(viewModel.ratingUserCount))
        twoProgressView.progress = two/100
        twoProgressLabel.text = "\(Int(two))%"
        
        let one = getPercentage(rating: viewModel.ratingOne,total: Double(viewModel.ratingUserCount))
        oneProgressView.progress = one/100
        oneProgressLabel.text = "\(Int(one))%"
    }
    
    fileprivate func getPercentage(rating:Double , total:Double) -> Float {
        let val = rating * 100.0
        return Float(val/total)
    }
}
