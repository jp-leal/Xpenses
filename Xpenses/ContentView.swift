//
//  ContentView.swift
//  Xpenses
//
//  Created by Joao Leal on 4/6/24.
//

import SwiftUI

struct ContentView: View {
    
   @State private var expenses = ExpenseVM()
    @State private var showSheet = false
    
    var body: some View {
        
        NavigationStack {
            
            List{
                Section(header: Text("Personal")) {
                    ForEach(expenses.items.filter {$0.type == "Personal"}) { item in
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            AmountView(amount: item.amount)
                            
                        }
                    }.onDelete(perform: { indexSet in
                        removeItems(at: indexSet)
                        
                        
                    })
                }
                Section(header: Text("Business")) {
                    ForEach(expenses.items.filter {$0.type == "Business"}) { item in
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            AmountView(amount: item.amount)
                        }
                    }.onDelete(perform: { indexSet in
                        removeItems(at: indexSet)
                    })
                }
            }
                
                .navigationTitle("Xpenses")
                .toolbar {
                    Button("Add") {
                        showSheet = true
                        
                    }
                }
            }.sheet(isPresented: $showSheet, content: {
                
                AddView(expenses: expenses)
                
                    .presentationDetents([.height(300)])
            })
        }
    func removeItems (at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}



#Preview {
    ContentView()
}
