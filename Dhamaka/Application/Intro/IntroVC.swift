//
//  ViewController.swift
//  Dhamaka
//
//  Created by Invariant on 30/10/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import UIKit
import CHIPageControl

class IntroVC: BaseVC  {
    
    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var pageControls: CHIPageControlJaloro!
    @IBOutlet weak var nextButton: UIButton!
    
    
    var _count: Int!
    let screenSize: CGRect = UIScreen.main.bounds

    override func viewDidLoad() {
        super.viewDidLoad()
          prepareViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(Helper.isIntroShown){
            self.goMainScreen()
        }
    }
    
    
    @IBAction func skipButtonAction(_ sender: UIButton) {
         Helper.setIntroShown(to: true)
         self.goMainScreen()
       
    }
    
    private func goMainScreen(){
        let introVC = ViewTransaction.viewTransaction.TransactionView(name: storyBoardName.main.rawValue, identifier: "SideMenu")
        navigationController?.pushViewController(introVC, animated: true)
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        var scrollTo = introScrollView.contentOffset.x / introScrollView.frame.size.width
        scrollTo += 1
        if(Int(scrollTo) < 3){
            scrollToPage(page:  Int(scrollTo), animated: true)
        }
        
        if(Int(scrollTo) == 3){
            Helper.setIntroShown(to: true)
            self.goMainScreen()
        }
    }
    
    func scrollToPage(page: Int, animated: Bool) {
        var frame: CGRect = self.introScrollView.frame
        frame.origin.x = frame.size.width * CGFloat(page)
        frame.origin.y = 0
        self.introScrollView.scrollRectToVisible(frame, animated: animated)
    }
    
    fileprivate func pageToFloatHorizontal(_ simpleInteger: Int) -> CGFloat{
        return CGFloat(simpleInteger) * introScrollView.frame.width
    }
    
    fileprivate func getWidth() -> CGFloat{
        return screenSize.width
    }
    
    fileprivate func getheight() -> CGFloat{
        return (screenSize.height * 0.70)
      }
    
    private func builder(_ count: Int){
        introScrollView.backgroundColor = UIColor.clear
        introScrollView.isPagingEnabled = true
        introScrollView.contentSize = CGSize(width: Int(introScrollView.frame.width)*count, height: Int(introScrollView.frame.height))
        introScrollView.delegate = self
        introScrollView.showsHorizontalScrollIndicator = false
    }
    
    private func prepareViews() {
        let view1: CarouselView = CarouselView(frame: CGRect(x: 0, y: 0, width: getWidth(), height: getheight()))
        view1.introUIImageView.image = UIImage(named: "ic_introscreen_1")
        view1.titleUILabel.text = "Efforless Purchase"
        view1.titleUILabel.textColor = UIColor.black
        view1.subtitleUILabel.text = "Buy any product from any place, at any time. very easily with Dhamaka"
        view1.subtitleUILabel.textColor = UIColor.black
        
        let view2: CarouselView = CarouselView(frame: CGRect(x: 0, y: 0, width: getWidth(), height: getheight()))
        view2.introUIImageView.image = UIImage(named: "ic_introscreen_2")
        view2.titleUILabel.text = "Exclusive products"
        view2.titleUILabel.textColor = UIColor.black
        view2.subtitleUILabel.text = "Dhamaka with trendy products for the highest customer service"
        view2.subtitleUILabel.textColor = UIColor.black
       
        let view3: CarouselView = CarouselView(frame: CGRect(x: 0, y: 0, width: getWidth(), height: getheight()))
        view3.introUIImageView.image = UIImage(named: "ic_introscreen_3")
        view3.titleUILabel.text = "Smooth Transaction"
        view3.titleUILabel.textColor = UIColor.black
        view3.subtitleUILabel.text = "Buy any product from any place, at any time. very easily with Dhamaka"
        view3.subtitleUILabel.textColor = UIColor.black
        
        let viewArray: [UIView] = [view1,view2,view3]
        self._count = viewArray.count
        builder(viewArray.count)
        insertViewElements(viewArray)
    }
    
    private func insertViewElements(_ elements: [UIView]){
        var viewArray: [UIView?] = [UIView?].init(repeating: nil, count: elements.count)
        for i in 0 ... elements.count-1 {
            viewArray[i] = UIView()
            viewArray[i]?.frame = CGRect(x: pageToFloatHorizontal(i), y: 0, width: getWidth(), height: getheight())
            elements[i].frame.origin = CGPoint(x: pageToFloatHorizontal(i), y: 0)
            viewArray[i]! = elements[i]
            introScrollView.addSubview(viewArray[i]!)
        }
    }

}

