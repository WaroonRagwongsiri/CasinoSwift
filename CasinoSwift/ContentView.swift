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
        NavigationView {
            VStack {
                Button("Profile",action: {
                    isProfileActive.toggle()
                })
                NavigationLink(destination: ProfilePage(), isActive: $isProfileActive, label: {EmptyView()}).hidden()
            }
            .padding()
        }.onAppear(perform: {
            setUser()
    })
    }
}

#Preview {
    ContentView()
}
