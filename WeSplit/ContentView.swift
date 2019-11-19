//
//  ContentView.swift
//  WeSplit
//
//  Created by Rafael  Hieda on 11/17/19.
//  Copyright © 2019 Rafael Hieda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople : String = "2"
    @State private var tipPercentage = 2 //index tbh
        
    let tipPercentages = [10,15,20,25,0]
    
    var totalInTable : Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        return grandTotal
    }
    
    var totalByPerson : Double {
        let peopleCount = Double(numberOfPeople) ?? 0
        let amountPerPerson = totalInTable / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Section {
                Form {
                    TextField("Amount", text : $checkAmount)
                        .keyboardType(.decimalPad)
//                    Picker("Number of People: ", selection: $numberOfPeople) {
//                        ForEach(2..<100) {
//                            Text("\($0) people")
//                        }
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                    Section(header: Text("How much would you like to leave?")) {
                        Picker("Pick a percentage", selection: $tipPercentage) {
                            ForEach(0..<tipPercentages.count){
                                Text("\(self.tipPercentages[$0])%")
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    Section(header: Text("Amount plus Tips: ")){
                        Text("Total: R$\(totalInTable, specifier:"%.2f")")
                    }
                    Section(header: Text("Amount per person:" )){
                        Text("Total by each person: R$\(totalByPerson, specifier: "%.2f")")
                    }
                }.navigationBarTitle("WeSplit")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
