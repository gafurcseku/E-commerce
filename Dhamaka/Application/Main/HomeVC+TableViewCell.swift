//
//  HomeVC+TableViewCell.swift
//  Dhamaka
//
//  Created by Invariant on 12/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class HomeVCTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = HomeVM()
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    let columnLayout = ColumnFlowLayout(
        cellsPerRow: 3,cellsHeight: 165.0 ,
        minimumInteritemSpacing: 8,
        minimumLineSpacing: 8,
        sectionInset: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    )

    
    var context:UIViewController?
    
    func setCollectionViewDataSourceDelegate(context: UIViewController, forRow row: Int , viewModel: HomeVM) {
        collectionView?.collectionViewLayout = columnLayout
        collectionView?.contentInsetAdjustmentBehavior = .always
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.tag = row
        self.viewModel = viewModel
        self.context = context
        collectionView.reloadData()
    }
    
}

extension HomeVCTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView.tag
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collectionView.frame.width/3.0) - 5 , height: (self.collectionView.frame.height/4.0))
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeVCCollectionViewCell
        
        cell.productImage.sd_setImage(with: URL(string: "\(Dhamaka.imageBasseUrl)\(viewModel.getThumnails(indexPath.row))"), placeholderImage: UIImage(named: "Laptop-computer"))
        
        cell.productName.text = viewModel.getName(indexPath.row)
        cell.productRating.rating = viewModel.getRating(indexPath.row)
        cell.productRating.settings.updateOnTouch = false
        let price = "৳\(viewModel.getOldPrice(indexPath.row)) ৳\(viewModel.getPrice(indexPath.row))"
        cell.productPrice.attributedText = price.setStrikeThrough(strike: "৳\(viewModel.getOldPrice(indexPath.row))")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productVC = ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.Product.rawValue, identifier: "product_detail") as! ProductDetailsVC
        productVC._id = viewModel.getId(indexPath.row)
        self.context?.navigationController?.pushViewController(productVC, animated: true)
    }
 
}
