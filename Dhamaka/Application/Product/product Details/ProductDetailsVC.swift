//
//  ProductDetailsVC.swift
//  Dhamaka
//
//  Created by Invariant on 13/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import CHIPageControl
import Cosmos
import GoneVisible
import QuartzCore
import SJSegmentedScrollView

class ProductDetailsVC: BaseVC {
    
    @IBOutlet weak var containUIView: UIView!
    @IBOutlet weak var cartButton: MIBadgeButton!
    
    var _id:String = ""
    let viewModel = ProductDetailsVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getProduct(_id: _id) { (isSuccess) in
            if isSuccess {
                self.showDetails()
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartButton.badgeString = "\(database.productCount())"
    }
    
    @IBAction func cartAction(_ sender: UIButton) {
        let cartVC = ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.Cart.rawValue, identifier:"cart")
        self.navigationController?.pushViewController(cartVC, animated: true)
    }
    
    func showDetails() {
        
        if let storyboard = self.storyboard {
            let headerViewController = storyboard.instantiateViewController(withIdentifier: "HeaderViewController") as! ProductHeaderVC
            headerViewController.name = self.viewModel.productName
            headerViewController.price = self.viewModel.productPrice
            headerViewController.shortDescription = self.viewModel.productShortDescription
            headerViewController.images = self.viewModel.product?.fragments.getProduct.images
            
            let segmentController = SJSegmentedViewController()
            segmentController.headerViewController = headerViewController
            
            let detailViewController = storyboard.instantiateViewController(withIdentifier: "content") as! ProductContentVC
            detailViewController.title = "Product Descroption"
            detailViewController.productDescription = self.viewModel.productdescription
            
            let ratingViewController = storyboard.instantiateViewController(withIdentifier: "productRating") as! ProductRatingVC
            ratingViewController.viewModel = self.viewModel
            ratingViewController.title = "Ratings"
            
            let privacyViewController = storyboard.instantiateViewController(withIdentifier: "content") as! ProductContentVC
            privacyViewController.title = "Shipping & Delivery"
            privacyViewController.productDescription = self.viewModel.shippingPolicy
            
            let returnViewController = storyboard.instantiateViewController(withIdentifier: "content") as! ProductContentVC
            returnViewController.title = "Return & Replacement Policy"
            returnViewController.productDescription = self.viewModel.refundPolicy
            
            segmentController.segmentControllers = [detailViewController,ratingViewController,privacyViewController,returnViewController]
            
            segmentController.headerViewHeight = UIScreen.main.bounds.height
            segmentController.headerViewOffsetHeight = 0.0
            segmentController.segmentTitleColor = .lightGray
            segmentController.segmentSelectedTitleColor = .black
            embed(segmentController, inView: self.containUIView)
            
        }
    }
    
    func embed(_ viewController:UIViewController, inView view:UIView){
        viewController.willMove(toParent: self)
        viewController.view.frame = view.bounds
        view.addSubview(viewController.view)
        self.addChild(viewController)
        viewController.didMove(toParent: self)
    }
    
    @IBAction func AddedCardAction(_ sender: UIButton) {
        let cartVC = ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.Cart.rawValue, identifier:"cart")
        self.navigationController?.pushViewController(cartVC, animated: true)
        database.setCart(productid: self.viewModel.productId, number: 1)
        self.cartButton.badgeString = "\(database.productCount())"
        let all = database.getAllProduct()
        for product in all {
            print("\(product[database.product_id]) and \(product[database.numberOfproduct])")
        }
    }
    
    
    @IBAction func backUIButton(_ sender: UIButton) {
        dismissNav()
    }
    
}
