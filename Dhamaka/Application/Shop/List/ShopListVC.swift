//
//  ShopListVC.swift
//  Dhamaka
//
//  Created by Invariant on 16/1/20.
//  Copyright © 2020 invariant. All rights reserved.
//

import Foundation
import UIKit

class ShopListVC: BaseVC {
    
    @IBOutlet weak var shopListCollectionView: UICollectionView!
    @IBOutlet weak var cartButton: MIBadgeButton!
    let viewModel = ShopListVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepairCollectionView()
        viewModel.getShopList(withpage: 1, And: 1000) { (isSuccess) in
            if(isSuccess){
                self.shopListCollectionView.reloadData()
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
           cartButton.badgeString = "\(database.productCount())"
       }
    
    @IBAction func backAction(_ sender: UIButton) {
        dismissNav()
    }
    
    fileprivate func prepairCollectionView(){
        self.shopListCollectionView.collectionViewLayout = columnLayout
        self.shopListCollectionView.contentInsetAdjustmentBehavior = .always
        self.shopListCollectionView.delegate = self
        self.shopListCollectionView.dataSource = self
        self.shopListCollectionView.reloadData()
        
    }
    
    let columnLayout = ColumnFlowLayout(
        cellsPerRow: 3,cellsHeight: 127.0,
          minimumInteritemSpacing: 10,
          minimumLineSpacing: 10,
          sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
      )
    
}

extension ShopListVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.getCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shopListCell", for: indexPath) as! ShopListCollectionViewCell
        cell.shopLogoImageView.sd_setImage(with: URL(string: "\(Dhamaka.imageBasseUrl)\(self.viewModel.getLogo(indexPath.row))"), placeholderImage: UIImage(named: "Laptop-computer"))
        cell.nameLabel.text = viewModel.getName(indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shopDetail = ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.ShopList.rawValue, identifier:"shopDetail") as! ShopDetailVC
        shopDetail.viewModel.shop = self.viewModel.shopList?[indexPath.row]
        shopDetail.seller_id = self.viewModel.getId(indexPath.row)
        navigationController?.pushViewController(shopDetail, animated: true)
    }
}
