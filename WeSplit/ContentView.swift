//
//  ContentView.swift
//  WeSplit
//
//  Created by Alex Babou on 5/2/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercent = 2
    
    let tipOptions = [0, 10, 15, 20, 25]
    
    var calculatedCost: Double {
        let people = Double(numberOfPeople + 2)
        let tip = Double(tipOptions[tipPercent]) / 100
        let amount = Double(checkAmount) ?? 0
        
        return amount * (1 + tip) / people
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Details:")) {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach (2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("Input your tip amount below:")) {
                    Picker("Percent Tip", selection: $tipPercent) {
                        ForEach(0 ..< tipOptions.count) {
                            Text("\(self.tipOptions[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result:")) {
                    Text("A total of \(calculatedCost, specifier: "$%.2f") is split between \(numberOfPeople + 2) people.")
                        .font(.headline)
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
