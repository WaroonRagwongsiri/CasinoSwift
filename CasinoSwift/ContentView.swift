//
//  ContentView.swift
//  CasinoSwift
//
//  Created by admin on 6/15/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var userDatas:[User]
    @State private var isProfileActive = false
    
    func setUser(){
        if(userDatas == []){
            context.insert(User(balance: 0, name: "Random User"))
        }
        try! context.save()
    }
    
    var body: some View {
        TabView{
            MainPage().tabItem {
                Image(systemName: "gamecontroller")
                Text("Game")
            }
            ProfilePage().tabItem {
                Image(systemName: "person.circle")
                Text("Profile")
            }
        }.onAppear(perform: {
            setUser()
        })
    }
}


