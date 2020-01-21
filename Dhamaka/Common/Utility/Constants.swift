//
//  Constants.swift
//  Dhamaka
//
//  Created by Invariant on 11/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation

//let basseUrl:String = "https://develop-service.dhamakadigital.com/graphql"
//let imageBaseUrl = "https://dhamaka-development.s3-ap-southeast-1.amazonaws.com"

let sectionType = ["slider":false , "category":false , "live":false , "feature" : false , "all" : true , "Hot" : false , "bestsell": false , "new":false]


struct Constants {
    static let headerToken      = "headerToken"
    static let isLoggedIn       = "isLoggedIn"
    static let isIntroShown     = "isIntroShown"
    static let userID     = "user_id"
    static let Product = "cardProduct"
    static let shipping     = "shipping"
    static let billing     = "billing"
}

enum Dhamaka {
    static var serverBasseUrl:String {
        #if ENV_DEVELOP
        return "https://develop-service.dhamakadigital.com/graphql"
        #elseif ENV_STAGE
        return "https://stage-service.dhamakadigital.com/graphql"
        #elseif ENV_PROD
        return "https://service.dhamakadigital.com/graphql"
        #endif
    }
    
    static var imageBasseUrl:String {
        #if ENV_DEVELOP
        return "https://dhamaka-development.s3-ap-southeast-1.amazonaws.com"
        #elseif ENV_STAGE
        return "https://dhamaka-staging.s3-ap-southeast-1.amazonaws.com"
        #elseif ENV_PROD
        return "https://dhamaka-production.s3-ap-southeast-1.amazonaws.com"
        #endif
    }
}

