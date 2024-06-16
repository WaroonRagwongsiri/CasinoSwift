//
//  MainPage.swift
//  CasinoSwift
//
//  Created by admin on 6/15/24.
//

import SwiftUI

struct MainPage: View {
    @State private var slotmachine:Bool = false
    
    var body: some View {
        NavigationStack {
            List{
                Button("slotmachine") {
                    slotmachine.toggle()
                }
                .padding()
                .navigationDestination(isPresented: $slotmachine) {
                    Slotmachine()
                }
            }
        }
    }
}

#Preview {
    MainPage()
}
