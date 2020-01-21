//
//  ShopDetailVC.swift
//  Dhamaka
//
//  Created by Invariant on 16/1/20.
//  Copyright © 2020 invariant. All rights reserved.
//

import Foundation
import UIKit

class ShopDetailVC: BaseVC {
    
    @IBOutlet weak var bannarImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var shopProductTableView: UICollectionView!
    
    var seller_id:String = ""
    
    @IBOutlet weak var cartButton: MIBadgeButton!
    let viewModel = ShopDetailVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showInformation()
        
        viewModel.getShopProduct(seller_id: seller_id, page: 1, limit: 1000) { (isSuccess) in
            if(isSuccess){
                self.shopProductTableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartButton.badgeString = "\(database.productCount())"
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        dismissNav()
    }
    
    fileprivate func showInformation(){
        bannarImageView.sd_setImage(with: URL(string: "\(Dhamaka.imageBasseUrl)\(self.viewModel.bannar)"), placeholderImage: UIImage(named: "Laptop-computer"))
        logoImageView.sd_setImage(with: URL(string: "\(Dhamaka.imageBasseUrl)\(self.viewModel.logo)"), placeholderImage: UIImage(named: "Laptop-computer"))
        nameLabel.text = viewModel.Name
        addressLabel.text = viewModel.address
        phoneLabel.text = viewModel.phoneNumber
        emailLabel.text = viewModel.email
        
        shopProductTableView.collectionViewLayout = columnLayout
      //  shopProductTableView.contentInsetAdjustmentBehavior = .always
        shopProductTableView.delegate = self
        shopProductTableView.dataSource = self
        shopProductTableView.reloadData()
    }
    
    let columnLayout = ColumnFlowLayout(
        cellsPerRow: 3,cellsHeight: 190.0,
           minimumInteritemSpacing: 10,
           minimumLineSpacing: 10,
           sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
       )
}

extension ShopDetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ShopDetailCollectionViewCell
        cell.productImageView.sd_setImage(with: URL(string: "\(Dhamaka.imageBasseUrl)\(self.viewModel.productImage(indexPath.row))"), placeholderImage: UIImage(named: "Laptop-computer"))
        cell.productName.text = viewModel.productName(indexPath.row)
        cell.ratingView.rating = viewModel.productRating(indexPath.row)
        cell.pricelabel.text = viewModel.productPrice(indexPath.row)
        return cell
    }
    
    
}
