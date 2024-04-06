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
                ForEach(expenses.items) { item in
                    HStack{
                        Text(item.name)
                        Spacer()
                        Text(String(item.amount))
                       
                    }}
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
}



#Preview {
    ContentView()
}
