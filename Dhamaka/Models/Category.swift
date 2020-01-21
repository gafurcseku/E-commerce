//
//  Category.swift
//  Dhamaka
//
//  Created by Invariant on 18/12/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation

struct Category {
    var _id:String?
    var name:String?
    var child:[Child]?
}

struct Child {
    var _id:String?
    var name:String?
}
