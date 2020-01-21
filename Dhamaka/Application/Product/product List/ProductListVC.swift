//
//  ProductListVC.swift
//  Dhamaka
//
//  Created by Invariant on 26/12/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit

class ProductListVC: BaseVC {
    
    @IBOutlet weak var ProductListCollectionView: UICollectionView!
    
    var category_id:String = ""
    let viewModel = ProductListVM()
    
    let columnLayout = ColumnFlowLayout(
        cellsPerRow: 3,cellsHeight: 165.0,
        minimumInteritemSpacing: 10,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepairView()
        viewModel.getProductList(category_id: self.category_id, page: 1, limit: 1000) { (isSuccess) in
            if(isSuccess){
                self.ProductListCollectionView.reloadData()
            }
        }
        
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        dismissNav()
    }
    
    
    private func prepairView(){
        
     ProductListCollectionView.collectionViewLayout = columnLayout
        ProductListCollectionView.contentInsetAdjustmentBehavior = .always
        ProductListCollectionView.delegate = self
        ProductListCollectionView.dataSource = self
        ProductListCollectionView.reloadData()
    }
}

extension ProductListVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.prodcutCount()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductListCell", for: indexPath) as! ProductListVCCollectionViewCell
        
        cell.productImage.sd_setImage(with: URL(string: "\(Dhamaka.imageBasseUrl)\(viewModel.getImageurl(indexPath.row))"), placeholderImage: UIImage(named: "Laptop-computer"))
        cell.productName.text = viewModel.getName(indexPath.row)
        cell.productPrice.text = viewModel.getPrice(indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productVC = ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.Product.rawValue, identifier: "product_detail") as! ProductDetailsVC
        productVC._id = viewModel.getId(indexPath.row)
        self.navigationController?.pushViewController(productVC, animated: true)
    }
}
