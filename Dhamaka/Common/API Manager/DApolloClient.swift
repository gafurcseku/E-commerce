//
//  DApolloClient.swift
//  Dhamaka
//
//  Created by Invariant on 11/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import Apollo


class DApolloClient {
    
    static let shared = DApolloClient()
    
    //let store = ApolloStore(cache: cache())
    
    
    private(set) lazy var apollo:ApolloClient = {
        let networkTransport = HTTPNetworkTransport(url: URL(string: Dhamaka.serverBasseUrl)! ,delegate: self)
        return ApolloClient(networkTransport: networkTransport)
    }()
}

//func cache() -> NormalizedCache {
//     let cache = try? SQLiteNormalizedCache(fileURL: temporarySQLiteFileURL(), shouldVacuumOnClear: false)
//    return cache ?? InMemoryNormalizedCache()
//}
//
//func temporarySQLiteFileURL() -> URL {
//    let applicationSupportPath = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first!
//    let dbPath = applicationSupportPath + "/com.dhamaka.cache"
//
//    if !FileManager.default.fileExists(atPath: dbPath) {
//        try? FileManager.default.createDirectory(atPath: dbPath, withIntermediateDirectories: true, attributes: nil)
//    }
//
//    let url = URL(fileURLWithPath: dbPath)
//    return url.appendingPathComponent("db.sqlite3")
//}

extension DApolloClient : HTTPNetworkTransportPreflightDelegate {
    func networkTransport(_ networkTransport: HTTPNetworkTransport, shouldSend request: URLRequest) -> Bool {
        return true
    }
    
    
    func networkTransport(_ networkTransport: HTTPNetworkTransport,
                          willSend request: inout URLRequest) {
        var headers = request.allHTTPHeaderFields ?? [String: String]()
        headers["Authorization"] = "Bearer \(Helper.accessToken)"
        print("Bearer \(Helper.accessToken)")
        request.allHTTPHeaderFields = headers
        
        print("Outgoing request: \(request)")
    }
}
