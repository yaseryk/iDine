//
//  ItemRow.swift
//  iDine
//
//  Created by Yaser on 3/29/21.
//

import SwiftUI

struct ItemRow: View {
    let colors: [String: Color] = ["V": .green, "G": .black, "D": .purple, "N": .red, "S": .blue]
    let item: MenuItem
    var body: some View {
        HStack {
            
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray ,lineWidth: 2))
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            
            Spacer()
            
            ForEach(item.restrictions, id: \.self) { restricion in
                Text(restricion)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(5)
                    .background(colors[restricion, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
