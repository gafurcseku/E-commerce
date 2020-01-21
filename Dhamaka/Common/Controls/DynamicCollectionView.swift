//
//  DynamicCollectionView.swift
//  Dhamaka
//
//  Created by Invariant on 16/1/20.
//  Copyright © 2020 invariant. All rights reserved.
//

import UIKit

class DynamicCollectionView: UICollectionView {
  override func layoutSubviews() {
    super.layoutSubviews()
    if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
      self.invalidateIntrinsicContentSize()
    }
  }

  override var intrinsicContentSize: CGSize {
    return collectionViewLayout.collectionViewContentSize
  }
}


