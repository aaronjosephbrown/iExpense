//
//  AddView.swift
//  iExpense
//
//  Created by Aaron Brown on 10/3/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State var showingAlert: Bool = false
    @State var alertMessage: Text = Text("Please enter a name.")
    @ObservedObject var expense: Expenses
    @State private var name: String  = ""
    @State private var type: String = "Personal"
    @State private var amount: Double = 0.0
    
    let types:Array = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add New Expense")
            .toolbar {
                Button {
                    let newExpense = ExpenseItem(name: name, type: type, amount: amount)
                    if (name == "") {
                        return showingAlert.toggle()
                    }
                    expense.items.insert(newExpense, at: 0)
                    dismiss()
                } label: {
                    Text("Add")
                }
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("🤪"), message: alertMessage, dismissButton: .cancel())
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expense: Expenses())
    }
}
