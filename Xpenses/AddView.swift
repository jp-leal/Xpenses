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
    @State private var type = "Personal"
    
    let types = ["Personal", "Business"]
    
    var expenses: ExpenseVM
    
    var body: some View {
        NavigationStack{
            Form{
                
                TextField("Item", text: $name)
                Picker("Select Type", selection: $type) {
                    ForEach(types, id: \.self) { item in
                    Text(item)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
              
                HStack {
                    Spacer()
                    Button("Save") {
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

struct AmountView: View {
    var amount: Double
    var color: Color {
        switch amount {
        case 0..<10:    return Color.green
        case 10..<150:  return Color.blue
        case 150...:    return Color.red
        default:        return Color.primary
        }
    }

    var body: some View{
        Text(amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            .foregroundColor(color)

    }
}


#Preview {
    AddView(expenses: ExpenseVM())
}
