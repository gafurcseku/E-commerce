//
//  Helper.swift
//  Buddy_iOS
//
//  Created by S.M.Moinuddin on 10/22/17.
//  Copyright © 2017 S.M.Moinuddin. All rights reserved.
//

import UIKit



struct Helper{
    
    static var deviceID: String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    static var appVersion: String {
        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else { return "N/A" }
        return version
    }
    
    
    
//    static var getSocket: SocketIOClient {
//        let token = Helper.accessToken
//
//        var socket: SocketIOClient
//        let manager = SocketManager(socketURL: URL(string: KBasePath)!, config: [.log(SHOULD_LOG), .compress])
//
//        socket = manager.socket(forNamespace: "/user")
//        manager.config = SocketIOClientConfiguration(
//            arrayLiteral: .compress, .connectParams(["authorization": token])
//        )
//
//        return socket
//    }
    
    static func emptyMessageInTableView(_ tableView: UITableView,_ title: String){
        let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
        noDataLabel.textColor        = .lightGray
        noDataLabel.font             = UIFont(name: "Open Sans", size: 15)
        noDataLabel.textAlignment    = .center
        noDataLabel.numberOfLines    = 0
        tableView.backgroundView = noDataLabel
        tableView.separatorStyle = .none
        noDataLabel.text = title
    }
    
    static func emptyMessageInCollectionView(_ collectionView: UICollectionView,_ title: String){
        let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height))
        noDataLabel.textColor        = .lightGray
        noDataLabel.font             = UIFont(name: "Open Sans", size: 15)
        noDataLabel.textAlignment    = .center
        collectionView.backgroundView = noDataLabel
        //        collectionView.separatorStyle = .none
        noDataLabel.text = title
    }
    
    static var isIntroShown: Bool {
        return UserDefaults.standard.bool(forKey: Constants.isIntroShown)
    }
    
    static func setIntroShown(to flag:Bool) {
        UserDefaults.standard.set(flag, forKey: Constants.isIntroShown)
        UserDefaults.standard.synchronize()
    }
    
    static var isLoggedIn: Bool {
        return UserDefaults.standard.bool(forKey: Constants.isLoggedIn)
    }
    
    static func setLoggedIn(to flag:Bool) {
        UserDefaults.standard.set(flag, forKey: Constants.isLoggedIn)
        UserDefaults.standard.synchronize()
    }
    
    static var accessToken: String {
        return UserDefaults.standard.string(forKey: Constants.headerToken) ?? ""
    }
    
    static func setAccessToken(token: String) {
        UserDefaults.standard.set(token, forKey: Constants.headerToken)
        UserDefaults.standard.synchronize()
    }
    
    static func setProduct(product_id : String){
        UserDefaults.standard.set(product_id, forKey: Constants.Product)
        UserDefaults.standard.synchronize()
    }
    
    static var getProduct: String {
        return UserDefaults.standard.string(forKey: Constants.Product) ?? ""
    }
    
    static func setUserID(_ uID: String) {
        UserDefaults.standard.set(uID, forKey: Constants.userID)
        UserDefaults.standard.synchronize()
    }
    
    static var getUserID: String {
        return UserDefaults.standard.string(forKey: Constants.userID) ?? ""
    }
    
    
    static func setAddressNumber(_ uID: Int , forkey:String) {
        UserDefaults.standard.set(uID, forKey: forkey)
        UserDefaults.standard.synchronize()
    }
    
    static func getAddressNumber(forkey:String) -> Int {
        return UserDefaults.standard.integer(forKey: forkey) 
    }
    
    static func showCommingSoonAlert(from vc:UIViewController) {
        let alertController = UIAlertController(title: "Comming Soon", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    static func showAlert(from vc:UIViewController, message:String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    static func showAlert(from vc:UIViewController, message:String, completion: @escaping ((Bool) -> Void)) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler:{ ( _ ) in
            completion(true)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:{ ( _ ) in
            completion(false)
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        vc.present(alertController, animated: true, completion: nil)
    }
    
//    static func showInternetUnreachable() {
//        let alertVC = UIAlertController(title: "Internet Connection Not Available", message: "Please Enable Your Wifi Or Cellular Network", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//        alertVC.addAction(okAction)
//       alertVC.present(alertController, animated: true, completion: nil)
//    }
    
    static func addAsChildVC(_ childVC: UIViewController, to containerView: UIView, with parentVC: UIViewController) {
        childVC.view.translatesAutoresizingMaskIntoConstraints = false
        parentVC.addChild(childVC)
        addSubview(subView: childVC.view, toView: containerView)
        childVC.didMove(toParent: parentVC)
    }
    
    static private func addSubview(subView:UIView, toView parentView:UIView) {
        parentView.addSubview(subView)
        subView.backgroundColor = UIColor.clear
        
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
    }
    
    static func removeAsChildVC(childVC: UIViewController) {
        childVC.willMove(toParent: nil)
        childVC.view.removeFromSuperview()
        childVC.removeFromParent()
    }
    
    static func minuteConversion(value:Double,isCapital:Bool) -> (Double, String) {
        let minute = value/60
        var unit = ""
        if(isCapital){
            unit = "MINS"
        }else{
            unit = "mins"
        }
        return (minute, unit)
    }
    
    static func isValidPhoneNumber(_ num:String?) -> (Bool,String){
        guard let numStr = num else {return (false,"")}
        
        let phnNum =  numStr.hasPrefix("0") ? String(numStr.dropFirst()) : numStr
        
        let comparablePhnNum = "+880" + phnNum
        let regex = "^(?:\\+?88|0088)?01[1-9]\\d{8}$"
        if comparablePhnNum.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil {
            return (true,comparablePhnNum)
        } else {
            return (false,"")
        }
    }
    
   static func isValidEmail(_ email: String?) -> Bool {
        guard email?.count != 0 else {return false}
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
//    private static func showInvalidAlert() {
//        let alertCntrl = UIAlertController(title: "Invalid Phone Number", message: "Please enter valid number", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//        alertCntrl.addAction(okAction)
//        alertCntrl.show()
//    }
    
//    static func getFormatedImgData(_ images:[UIImage]) -> Data? {
//        guard images.count > 0 else { return nil}
//        guard let image = images.first else {return nil}
//        guard let imageData = Helper.getCompressedImgData(image) else {return nil}
//        return imageData
//    }
    
//    private static func getCompressedImgData(_ image:UIImage) -> Data? {
//        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return nil}
//        let bytes = imageData.count
//        let KB = Double(bytes) / 1024.0 // Note the difference
//        let MB = KB/1024
//        return imageData
//    }
    
    static func getAppVersion() -> String {
        return "\(Bundle.main.infoDictionary!["CFBundleShortVersionString"] ?? "")"
    }
    
    static func convertDate(milisecond:Int) -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(milisecond)/1000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy hh:mm"
        return dateFormatter.string(from: date)
    }
    
    static func openCustomURLScheme(appScheme: String) -> Bool {
        let customURLScheme = appScheme + "://"
        guard let customURL = URL(string: customURLScheme) else {return false}
        if UIApplication.shared.canOpenURL(customURL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(customURL)
            } else {
                UIApplication.shared.openURL(customURL)
            }
            return true
        }
        
        return false
    }
    
    static func isOpenCustomURLScheme(appScheme: String) -> Bool {
        let customURLScheme = appScheme + "://"
        guard let customURL = URL(string: customURLScheme) else {return false}
        return UIApplication.shared.canOpenURL(customURL)
    }
    
    static func openAppURL(with urlStr:String) {
        guard let customURL = URL(string: urlStr) else {return}
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(customURL)
        } else {
            UIApplication.shared.openURL(customURL)
        }
    }
    
    static func dialNumber(number : String) {
        
        if let url = URL(string: "tel://\(number)"),
            UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler:nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else {
            // add error message here
        }
    }
    
//    static func configGallery() {
//        Config.Camera.recordLocation = true
//        Config.tabsToShow = [.imageTab, .cameraTab]
//        Config.Camera.imageLimit = 1
//    }
    
}






