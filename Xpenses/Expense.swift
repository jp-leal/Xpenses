//
//  Expense.swift
//  Xpenses
//
//  Created by Joao Leal on 4/6/24.
//

import Foundation

struct Expense: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let amount: Double
    let type: String
}
