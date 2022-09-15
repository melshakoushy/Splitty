//
//  ContentView.swift
//  Splitty
//
//  Created by Mahmoud Elshakoushy on 14/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: Properties
    @State private var checkAmout = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocused: Bool
        
    var totalPerPerson: Double {
        let peopleNumber = Double(numberOfPeople + 2)
        let selectedTip = Double(tipPercentage)
        
        let tipvalue = checkAmout/100 * selectedTip
        let grandTotal = checkAmout + tipvalue
        
        let tipPerPerson = grandTotal / peopleNumber
        return tipPerPerson
    }
    
    var totalAmount: Double {
        let selectedTip = Double(tipPercentage)
        
        let tipvalue = checkAmout/100 * selectedTip
        let grandTotal = checkAmout + tipvalue
        
        return grandTotal
    }
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmout, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
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
                    Text("Total Amount for the Check")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Amount Per Person")
                }
            }
            .navigationTitle("Splitty")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
