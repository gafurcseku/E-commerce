//
//  BaseVM.swift
//  Dhamaka
//
//  Created by Invariant on 12/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import Apollo

class BaseVM {
    let apolloClient = DApolloClient.shared.apollo
    let database = DhakamaSqlite.dhakamaSqlite
}
