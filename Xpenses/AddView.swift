//
//  AddView.swift
//  Xpenses
//
//  Created by Joao Leal on 4/6/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment (\.dismiss) var dismiss
    
    @State private var name = ""
    
    @State private var amount = 0.0
    @State private var type = "Pessoal"
    
    let types = ["Pessoal", "Business"]
    
    var expenses: ExpenseVM
    
    var body: some View {
        NavigationStack{
            Form{
                
                TextField("Item", text: $name)
                Picker("Selecione Tipo", selection: $type) {
                    ForEach(types, id: \.self) { item in
                    Text(item)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "BRL"))
              
                HStack {
                    Spacer()
                    Button("Salvar") {
                        let expense = Expense(name: name, amount: amount, type: type)
                        expenses.items.append(expense)
                        dismiss()
                    }.buttonStyle(.automatic)
               Spacer()
                }
            }
            
        }
            
        
    }
}

#Preview {
    AddView(expenses: ExpenseVM())
}
