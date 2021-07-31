//
//  Account.swift
//  SurfRentApp
//
//  Created by Daniil Belyaev on 30.07.2021.
//
struct Account {
    var user: String
    var password: String
    
    static func getUser() -> Account {
        Account(user: "User", password: "Password")
    }
}
