//
//  ContentView.swift
//  iExpense
//
//  Created by Aaron Brown on 10/1/23.
//

import SwiftUI

struct ContentView: View {
    @State var isShowingAddView = false
    @StateObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    NavigationLink {
                        DetailsView(item: item)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                                    .font(.subheadline)
                            }
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: "USD"))
                                .bold()
                        }
                    }
                }
                .onDelete(perform: removeAtIndex)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    isShowingAddView.toggle()
                } label: {
                   Image(systemName: "plus")
                }
                EditButton()
            }
        }
        .sheet(isPresented: $isShowingAddView) {
            AddView(expense: expenses)
        }
    }
    func removeAtIndex(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
