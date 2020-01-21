//
//  ViewExtension.swift
//  Dhamaka
//
//  Created by Invariant on 5/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import UIKit

extension IntroVC : UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let count : Int = _count
        if(introScrollView.contentOffset.x <= 0 ){
            introScrollView.setContentOffset(CGPoint.init(x: 0, y: 0), animated: false)
        }else if introScrollView.contentOffset.x >= introScrollView.frame.width*CGFloat(count-1){
            introScrollView.setContentOffset(CGPoint.init(x: Int(introScrollView.frame.width)*(count-1), y: 0), animated: false)
        }
        let total = introScrollView.contentSize.width - introScrollView.bounds.width
        let offset = introScrollView.contentOffset.x
        let percent = Double(offset / total)
        let progress = percent * Double(count - 1)
        pageControls.progress = progress
        
        let scrollTo = introScrollView.contentOffset.x / introScrollView.frame.size.width
        if(Int(scrollTo) == 2){
            nextButton.setTitle("DONE", for: .normal)
        }else{
            nextButton.setTitle("NEXT", for: .normal)
        }
    }
}
