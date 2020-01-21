//
//  DhakamaSqlite.swift
//  Dhamaka
//
//  Created by Invariant on 27/11/19.
//  Copyright © 2019 invariant. All rights reserved.
//

import Foundation
import SQLite

class DhakamaSqlite {
    
    static var dhakamaSqlite = DhakamaSqlite()
    var db: Connection?
    
    private let cart = Table("Cart")
    let id = Expression<Int64>("id")
    let product_id = Expression<String>("product_id")
    let numberOfproduct = Expression<Int>("number")
    
    func CreateDatabase() {
        let databaseFileName = "db.sqlite3"
        let databaseFilePath = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\(databaseFileName)"
        db = try! Connection(databaseFilePath)
        self.CreateTable()
    }
    
    
    private func CreateTable()  {
        try! db!.run(cart.create (ifNotExists: true){ t in
            t.column(id,primaryKey: .autoincrement)
            t.column(product_id , unique: true)
            t.column(numberOfproduct)
        })
    }
    
    func setCart(productid:String, number:Int) -> Void {
        if (self.CheckProduct(id: productid) == 0){
            let insert = cart.insert(product_id <- productid, numberOfproduct <- number)
            do {
                try db?.run(insert)
            }catch let error {
                print(error)
            }
        }else{
            let updateNumber = getNumber(productid: productid) + number
            let query = cart.filter(product_id == productid)
            let update = query.update(numberOfproduct <- updateNumber)
            do {
                try db?.run(update)
            }catch let error {
                print(error)
            }
        }
    }
    
    func updateCard(productid:String,number:Int) -> Void {
        let query = cart.filter(product_id == productid)
        let update = query.update(numberOfproduct <- number)
        do {
            try db?.run(update)
        }catch let error {
            print(error)
        }
    }
    
    func deleteCard(productid:String) -> Int {
        let query = cart.filter(product_id == productid)
        let update = query.delete()
        do {
           let delete = try db?.run(update)
            return delete ?? 0
        }catch let error {
            print(error)
            return 0
        }
    }
    
    func deleteAll() {
        let update = cart.delete()
        do {
           let delete = try db?.run(update)
        }catch let error {
            print(error)
        }
    }
    
    func getAllProduct() -> [Row] {
        let all = Array(try! db!.prepare(cart))
        return all
    }
    
    func productCount() -> Int {
        do {
            let count = try db?.scalar(cart.count)
            return count ?? 0
        }catch _{
            return 0
        }
        
    }
    
    func CheckProduct(id:String) -> Int {
        let query = cart.filter(product_id == id)
        do {
            let count = try db?.scalar(query.count)
            return count ?? 0
        }catch let error {
            print(error)
            return 0
        }
    }
    
    func getNumber(productid:String) -> Int {
        let query = cart.filter(product_id == productid)
        var count:Int = 0
        do {
            let cartNumner = try db?.prepare(query)
            for numner in cartNumner! {
                count = numner[numberOfproduct]
            }
            return count
        }catch let error{
            print(error)
            return 0
        }
    }
}
