//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Aaron Brown on 10/3/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id: UUID = UUID()
    let name: String
    let type: String
    let amount: Double
}
