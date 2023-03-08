//
//  CheckoutView.swift
//  iDine
//
//  Created by Илья Дубенский on 08.03.2023.
//

import SwiftUI

struct CheckoutView: View {

    @EnvironmentObject var order: Order

    static let pickupTimes = ["Now", "Tonight", "Tomorrow Morning"]
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let tipAmounts = [10, 15, 20, 25, 0]

    @State private var paymentType = 0
    @State private var pickupTime = 1
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false

    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }

    
    var body: some View {
        Form {
            Section {
                Picker("Pickup Time:", selection: $pickupTime) {
                    ForEach(0 ..< Self.pickupTimes.count) { time in
                        Text("\(Self.pickupTimes[time])")
                    }
                }
                .frame(height: 120)
                .pickerStyle(.wheel)
            } header: {
                Text("Pickup Time")
            }

            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) { type in
                        Text("\(Self.paymentTypes[type])")
                    }
                    .pickerStyle(.menu)
                }
            } header: {
                Text("Payment Method")
            }

            Section {
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add iDine Loyalty Card")
                }
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            } header: {
                Text("Loyalty")
            }

            Section {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) { percent in
                        Text("\(Self.tipAmounts[percent])%")
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Add a Tip?")
            }

            Section{
                Button("Confirm Order") {
                    self.showingPaymentAlert.toggle()
                }
            } header: {
                Text("Total: \(totalPrice, specifier: "%.2f")$")
                    .font(.title)
            }

        }
        .navigationTitle(Text("Payment"))
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"),
                  message: Text("Your total was $\(totalPrice, specifier: "%.2f") – thank you!"),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {

    static let order = Order()

    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
