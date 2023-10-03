//
//  DetailsView.swift
//  iExpense
//
//  Created by Aaron Brown on 10/3/23.
//

import SwiftUI

struct DetailsView: View {
    let item: ExpenseItem
    
    var body: some View {
        VStack {
            Text(item.name)
            Text(item.type)
            Text(item.amount, format: .currency(code: "USD"))
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(item: ExpenseItem.init(name: "Lunch", type: "Business", amount: 12))
    }
}
