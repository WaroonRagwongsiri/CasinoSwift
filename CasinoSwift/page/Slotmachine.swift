//
//  Slotmachine.swift
//  CasinoSwift
//
//  Created by admin on 6/15/24.
//

import SwiftUI
import SwiftData

struct Slotmachine: View {
    @State private var slot:[Int] = [0,0,0]
    @State private var symbol:[String] = ["coin","dollar","seven"]
    @Environment(\.modelContext) private var context
    @Query private var userDatas:[User]
    @State var dak:String = ""
    
    func spin(){
        dak = ""
        
        if(userDatas[0].balance <= 0){
            return
        }
        
        userDatas[0].balance -= 500
        slot[0] = Int.random(in: 0..<3)
        slot[1] = Int.random(in: 0..<3)
        slot[2] = Int.random(in: 0..<3)
        
        if(slot[0] == 0 && slot[1] == 0 && slot[2] == 0){
            userDatas[0].balance += 1500
        }else if(slot[0] == 1 && slot[1] == 1 && slot[2] == 1){
            userDatas[0].balance += 5000
        }else if(slot[0] == 2 && slot[1] == 2 && slot[2] == 2){
            userDatas[0].balance += 7000
        }else{
            dak = "🤣โดนกูแดก🤣"
        }
    }
    
    var body: some View {
        VStack(content: {
            Spacer()
            
            
            HStack(content: {
                Image("\(symbol[slot[0]])").resizable()
                    .frame(width: 75,height: 75)
                    .aspectRatio(contentMode: .fit)
                Image("\(symbol[slot[1]])").resizable()
                    .frame(width: 75,height: 75)
                    .aspectRatio(contentMode: .fit)
                Image("\(symbol[slot[2]])").resizable()
                    .frame(width: 75,height: 75)
                    .aspectRatio(contentMode: .fit)
            })
            Button(action: {
                spin()
            }) {
                Text("Spin 500$")
                    .fontWeight(.bold)
                    .font(.title)
                    .background(Color.red)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    .padding(20)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 0))
                
            }
            Text("\(dak)").padding(5)
            Text("Balance : \(userDatas[0].balance)")
            Spacer()
        }).navigationTitle("Slotmachine").font(.title)
    }
}
#Preview {
    Slotmachine()
}
