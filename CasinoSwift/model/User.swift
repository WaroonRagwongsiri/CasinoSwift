//
//  User.swift
//  CasinoSwift
//
//  Created by admin on 6/15/24.
//

import Foundation

class User{
    var balance:Int
    
    init(balance: Int) {
        self.balance = balance
    }
    
    func deposit(money:Int){
        self.balance += money
    }
    
    func withdraw(money:Int){
        self.balance -= money
    }
}
