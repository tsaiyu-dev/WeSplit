//
//  ContentView.swift
//  WeSplit
//
//  Created by Amy_H on 2/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkamount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    
    var totalAmount: Double{
        let peopleCount = Double(numberOfPeople + 2 )
        let tipSelection = Double(tipPercentage)
        let tipValue = checkamount / 100 * tipSelection
        let grandTotal = checkamount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople + 2 )
        let tipSelection = Double(tipPercentage)
        let tipValue = checkamount / 100 * tipSelection
        let grandTotal = checkamount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkamount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    List {
                        Picker("Number of people", selection: $numberOfPeople) {
                            ForEach(2..<100) {
                                Text(" \($0) people")
                            }
                        }
                    }
                }
                
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                    
                Section {
                    Text(totalAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Grant Amount")
                }
                
                
                Section {
                        Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD") )
                    } header: {
                        Text("Amount Per Person")
                    }
                    .navigationTitle("WeSplit")
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                amountIsFocused = false
                            }
                        }
                    }
                }
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

