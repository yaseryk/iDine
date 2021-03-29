//
//  OrderView.swift
//  iDine
//
//  Created by Yaser on 3/29/21.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete(perform: { indexSet in
                        deleteItem(at: indexSet)
                    })
                }
                
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Check out")
                    }
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                EditButton()
            }
        }
    }
    
    private func deleteItem(at indexSet: IndexSet) {
       order.items.remove(atOffsets: indexSet)
   }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
