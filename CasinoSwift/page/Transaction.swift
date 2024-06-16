//
//  Transaction.swift
//  CasinoSwift
//
//  Created by admin on 6/15/24.
//

import SwiftUI
import SwiftData

struct Transaction: View {
    @Binding var isDeposit:Bool
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @Query private var userDatas:[User]
    @State var amountString:String = ""
    
    func transaction(){
        if(isDeposit){
            userDatas[0].deposit(money: (amountString as NSString).integerValue)
        }else{
            userDatas[0].withdraw(money:(amountString as NSString).integerValue)
        }
        try! context.save()
    }
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .center, content: {
                Text(isDeposit ? "Deposit" : "Withdraw")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Form(content: {
                    TextField("amount of money you want to \(isDeposit ? "Deposit" : "Withdraw")", text: $amountString)
                        .keyboardType(.numberPad)
                    HStack(content: {
                        Spacer()
                        Button("Cancel",action: {
                            dismiss()
                        }).foregroundStyle(.red)
                        Spacer()
                        Button(isDeposit ? "Deposit" : "Withdraw",action: {
                            transaction()
                            dismiss()
                        })
                        Spacer()
                    })
                    
                }).frame(maxHeight: 150)
                
                Spacer()
            }).padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
        }
    }
}

#Preview {
    Transaction(isDeposit: .constant(false))
}
