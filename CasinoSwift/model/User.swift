//
//  User.swift
//  CasinoSwift
//
//  Created by admin on 6/15/24.
//

import Foundation
import SwiftData

@Model
class User{
    var balance:Int
    var name:String
    
    init(balance: Int, name: String) {
        self.balance = balance
        self.name = name
    }
    
    func deposit(money:Int){
        self.balance += money
    }
    
    func withdraw(money:Int){
        self.balance -= money
    }
}
