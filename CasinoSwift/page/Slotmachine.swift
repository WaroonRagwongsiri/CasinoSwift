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
    
    func spin(){
        if(userDatas[0].balance <= 0){
            return
        }
        
        userDatas[0].balance -= 500
        slot[0] = Int.random(in: 1..<3)
        slot[1] = Int.random(in: 1..<3)
        slot[2] = Int.random(in: 1..<3)
        
        if(slot[0] == slot[1] && slot[1] == slot[2] && slot[0] == 1){
            userDatas[0].balance += 1500
        }else if(slot[0] == slot[1] && slot[1] == slot[2] && slot[0] == 2){
            userDatas[0].balance += 5000
        }else if(slot[0] == slot[1] && slot[1] == slot[2] && slot[0] == 3){
            userDatas[0].balance += 7000
        }
    }
    
    var body: some View {
        VStack(content: {
            Text("Slotmachine")
            
            Button("Spin",action: {
                spin()
            })
            
            HStack(content: {
                Image("\(symbol[slot[0]])").resizable()
                    .frame(width: 50,height: 50)
                    .aspectRatio(contentMode: .fit)
                Image("\(symbol[slot[1]])").resizable()
                    .frame(width: 50,height: 50)
                    .aspectRatio(contentMode: .fit)
                Image("\(symbol[slot[2]])").resizable()
                    .frame(width: 50,height: 50)
                    .aspectRatio(contentMode: .fit)
            })
            
            Text("\(userDatas[0].balance)")
        })
    }
}
