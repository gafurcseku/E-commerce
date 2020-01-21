//
//  SingletonHelper.swift
//  Dhamaka
//
//  Created by Invariant on 20/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import UIKit


class BISingletonHelper {
    
    static let shared = BISingletonHelper()
    private init() {}
    
    var user: GetUser? = nil
    
    var product:GetProductQuery.Data.Product? = nil
    var categoryList:[GetCategoriesQuery.Data.Category.Doc] = []
    
}

