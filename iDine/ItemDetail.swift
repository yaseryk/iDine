//
//  ItemDetail.swift
//  iDine
//
//  Created by Yaser on 3/29/21.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    @Environment(\.presentationMode) var presentationMode
    
    let item: MenuItem
    var body: some View {
        VStack {
            
            ZStack(alignment: .bottomTrailing)  {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                    
                
                Text("Photo credits: \(item.photoCredit)")
                    .padding(5)
                    .background(Color(.black))
                    .foregroundColor(.white)
                    .font(.caption)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            
            Button("Order") {
                order.add(item: item)
                self.presentationMode.wrappedValue.dismiss()
            }
            .font(.headline)
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
        }
    }
}
