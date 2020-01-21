//
//  MenuVM.swift
//  Dhamaka
//
//  Created by Invariant on 11/12/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation

class MenuVM: BaseVM {
    
    var categoryList:[GetCategoriesQuery.Data.Category.Doc] =  []
    var categorys:[Category] = []
    
    func getCategory(complete:@escaping ((Bool) -> Void)) {
        apolloClient.fetch(query: GetCategoriesQuery(page: 1, limit: 100)){ results in
            switch(results) {
            case .success(let categories):
                if(categories.data != nil){
                    BISingletonHelper.shared.categoryList = (categories.data?.categories.docs)!
                    self.categoryList =  BISingletonHelper.shared.categoryList
                    for aCategory in self.categoryList {
                        var childs:[Child] = []
                        for aChild in aCategory.child!{
                            let child = Child(_id: aChild.fragments.getCategory._id ?? "", name: aChild.fragments.getCategory.name ?? "")
                            childs.append(child)
                        }
                        let category = Category(_id: aCategory.fragments.getCategory._id ?? "", name: aCategory.fragments.getCategory.name ?? "" ,child: childs)
                        self.categorys.append(category)
                    }
                    
                    var childmyAccount:[Child] = []
                    let childAccountprofile = Child(_id: "profile", name: "Profile")
                    childmyAccount.append(childAccountprofile)
                    
                    let childAccountshipping = Child(_id: "shipping", name: "Shipping Address")
                    childmyAccount.append(childAccountshipping)
                    
                    let childAccountbilling = Child(_id: "billing", name: "Billing Address")
                    childmyAccount.append(childAccountbilling)
                    
                    let category = Category(_id: "my_account", name: "My Account" ,child: childmyAccount)
                    self.categorys.append(category)
                    
                    let childSetting:[Child] = []
                    let categorySetting = Category(_id: "setting", name: "Setting" ,child: childSetting)
                    self.categorys.append(categorySetting)
                    
                    let childHistroy:[Child] = []
                    let categoryHistroy = Category(_id: "histroy", name: "History" ,child: childHistroy)
                    self.categorys.append(categoryHistroy)
                    
                    let childshop:[Child] = []
                    let categoryshop = Category(_id: "shop", name: "Shop" ,child: childshop)
                    self.categorys.append(categoryshop)
                    
                    let childlogout:[Child] = []
                    let categorylogout = Category(_id: "logout", name: "Logout" ,child: childlogout)
                    self.categorys.append(categorylogout)
                    
                    complete(true)
                }else {
                    complete(false)
                }
                break
            case .failure(let error):
                print(error)
                complete(false)
                break
            }
        }
    }
    
    
    func getUserById(userId:String , complete:@escaping ((Bool) -> Void)) {
        apolloClient.fetch(query: GetLoginUserQuery(_id: userId)){ results in
            switch results {
            case .success(let userResult):
                print(userResult)
                if ( userResult.data?.user?.fragments.getUser) != nil {
                    BISingletonHelper.shared.user = userResult.data?.user?.fragments.getUser
                    complete(true)
                }else{
                    complete(false)
                }
                
                break
            case .failure(let error):
                print(error.localizedDescription)
                complete(false)
                break
            }
            
        }
    }
    
    
    
    func getParentTitle(_ index:Int) -> String {
        guard let title = categorys[index].name else { return ""}
        return title
    }
    
    func getChildTitle(_ parentIndex:Int, _ childIndex:Int) -> String {
        guard let childTitle = categorys[parentIndex].child![childIndex].name else {return ""}
        return childTitle
    }
    
    func getChildId(_ name:String) -> String {
        var chid:String = ""
        for acategory in self.categorys {
            if(acategory.name == name){
                chid = acategory._id!
                break
            }
            for achild in acategory.child! {
                if achild.name == name {
                     chid = achild._id!
                    break
                }
            }
        }
        
        return chid
    }
    
    func getChildCount(_ parentIndex:Int) -> Int {
        return categorys[parentIndex].child!.count
    }
    
    func getCount() -> Int {
        return categorys.count
    }
    
}
