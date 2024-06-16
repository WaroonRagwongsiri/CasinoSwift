//
//  ProfilePage.swift
//  CasinoSwift
//
//  Created by admin on 6/15/24.
//

import SwiftUI
import SwiftData

struct ProfilePage: View {
    @Environment(\.modelContext) private var context
    
    @Query private var userDatas:[User]
    
    @State var isShowTransactionPageDeposit:Bool = false
    @State var isShowTransactionPageWithdraw:Bool = false
    
    
    var body: some View {
        VStack(){
            Text("Profile").font(.largeTitle)
            Spacer()
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 100,height: 100)
                .aspectRatio(contentMode: .fit)
                .padding(
                    EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
                )
            Text("\(userDatas[0].name)")
            Text("Balance : \(userDatas[0].balance)").font(.title)
                .padding(
                    EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
                )
            Button("Deposit",action: {
                isShowTransactionPageDeposit.toggle()
            })
                .padding(
                    EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
                )
                .sheet(isPresented: $isShowTransactionPageDeposit, content: {
                    Transaction(isDeposit: .constant(true))
                })
                .presentationDetents([.medium,.large])
                .presentationDragIndicator(.visible)
            
            Button("Withdraw",action: {
                isShowTransactionPageWithdraw.toggle()
            })
                .padding(
                    EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
                )
                .sheet(isPresented: $isShowTransactionPageWithdraw, content: {
                    Transaction(isDeposit: .constant(false))
                })
                .presentationDetents([.medium,.large])
                .presentationDragIndicator(.visible)
            Spacer()
        }
    }
}

#Preview {
    ProfilePage()
}
