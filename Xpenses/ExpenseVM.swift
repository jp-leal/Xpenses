//
//  ExpenseVM.swift
//  Xpenses
//
//  Created by Joao Leal on 4/6/24.
//

import Foundation
import Observation

@Observable
class ExpenseVM {
    var items = [Expense]() {
        didSet {
            if let encoder = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoder, forKey: "Items")
            }
        }
        
    }
    
    init() {
        if let reader = UserDefaults.standard.data(forKey: "Items") {
            if let savedItems = try? JSONDecoder().decode([Expense].self, from: reader) {
                items = savedItems
                return
            }
        }
        items = []
    }
    }

