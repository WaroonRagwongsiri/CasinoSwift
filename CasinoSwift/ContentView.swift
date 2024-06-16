//
//  ContentView.swift
//  CasinoSwift
//
//  Created by admin on 6/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var Search: String = ""
    var body: some View {
        TabView {
            ViewA()
                .tabItem(){
                    Image(systemName: "gamecontroller")
                    Text("Game")
                }
            ViewB()
                .tabItem(){
                    Image(systemName: "person.crop.circle.fill")
                    Text("Profile")
                }
            
        }
        
    }
}

#Preview {
    ContentView()
}
