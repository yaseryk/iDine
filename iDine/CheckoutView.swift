//
//  CheckoutView.swift
//  iDine
//
//  Created by Yaser on 3/29/21.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var choosedPaymentMethod: String = "Cash"
    @State private var couponCode: String = ""
    @State private var isCoupon = false
    @State private var tipAmount = 15
    @State private var isShowingPaymentAlert = false
    
    let payments = ["Cash", "Creditcard", "Points"]
    let tips = [5, 10, 15, 20, 0]
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let total = Double(order.total)
        let tip = total / 100 * Double(tipAmount)
        return formatter.string(from: NSNumber(value: total + tip)) ?? "$0"
    }
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay", selection: $choosedPaymentMethod) {
                    ForEach(payments, id: \.self) { payment in
                        Text(payment)
                    }
                }
            }
                Toggle("Add coupon to your order", isOn: $isCoupon.animation(.easeIn))
                
                if isCoupon {
                    TextField("Enter your coupon code", text: $couponCode)
                }
            
            Section(header: Text("Add tip?")) {
                Picker("Percentage", selection: $tipAmount) {
                    ForEach(tips, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Total: \(totalPrice)")) {
                Button("Confirm order") {
                    isShowingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $isShowingPaymentAlert) {
            Alert(title: Text("Payment complete"), message: Text("You paid \(totalPrice)"), dismissButton: .default(Text("Ok")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
