//
//  ProductHeaderVC.swift
//  Dhamaka
//
//  Created by Invariant on 2/1/20.
//  Copyright © 2020 invariant. All rights reserved.
//

import UIKit
import SDWebImage
import CHIPageControl
import Cosmos

class ProductHeaderVC: BaseVC {
    
    @IBOutlet var productslideshow: ImageSlideshow!
    @IBOutlet weak var pageControll: CHIPageControlJalapeno!
    @IBOutlet weak var nameUILabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var priceUILabel: UILabel!
    @IBOutlet weak var shortDescriptionUITextView: UITextView!
    
    var ImageSource:[SDWebImageSource] = []
    var name:String = ""
    var price:String = ""
    var shortDescription:String = ""
    var images:[GetProduct.Image]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameUILabel.text = name
        priceUILabel.text = price
        shortDescriptionUITextView.text = shortDescription
        setProductImage()
    }
    
    func setProductImage() {
        if images?.count ?? 0 > 0 {
            self.pageControll.numberOfPages = images?.count ?? 0
            for image in images! {
                print("ingot \(Dhamaka.imageBasseUrl)\(image.image!)")
                ImageSource.append(SDWebImageSource(urlString: "\(Dhamaka.imageBasseUrl)\(image.image!)")!)
            }
            productslideshow.delegate = self
            productslideshow.slideshowInterval = 5.0
            productslideshow.pageIndicator = .none
            productslideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
            productslideshow.setImageInputs(ImageSource)
        }
        
        
    }
}

extension ProductHeaderVC : ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        self.pageControll.set(progress: page, animated: true)
    }
}
