//
//  ViewA.swift
//  CasinoSwift
//
//  Created by Admin on 15/6/2567 BE.
//

import SwiftUI

struct ViewA: View {
    @State var Search: String = ""
    @State var showSheet:Bool = false

    var body: some View {
        VStack {
            Text("Hello, world!").font(.title)
            ZStack{
                TextField("Search Game", text: $Search)
                    .textFieldStyle(.roundedBorder)
                HStack{
                    Spacer()
                    Image(systemName: "magnifyingglass")
                }.padding(20)
            }
            HStack{
                Text("Popular🔥🥵").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            HStack{
                Image("Image").resizable().aspectRatio(contentMode: .fit)
                    .frame(maxWidth:150)
                Spacer()
                Image("Image").resizable().aspectRatio(contentMode: .fit)
                    .frame(maxWidth:150)
            }
            HStack{
                Image("Image").resizable().aspectRatio(contentMode: .fit)
                    .frame(maxWidth:150)
                Spacer()
                Image("Image").resizable().aspectRatio(contentMode: .fit)
                    .frame(maxWidth:150)
            }
            HStack{
                Image("Image").resizable().aspectRatio(contentMode: .fit)
                    .frame(maxWidth:150)
                Spacer()
                Image("Image").resizable().aspectRatio(contentMode: .fit)
                    .frame(maxWidth:150)
            }
            Spacer()
            
        }.padding(30)
        
    }
}

#Preview {
    ViewA()
}
