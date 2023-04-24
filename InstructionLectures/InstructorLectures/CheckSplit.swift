//
//  CheckSplit.swift
//  InstructionLectures
//
//  Created by Student on 4/24/23.
//

import SwiftUI

struct CheckSplit: View {
    
    // MARK: - Properties
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 20
    
    private let tipPercentageArray = [10, 15, 20, 25, 0]
    
    var tipAmount: Double {
        let tipSelection = Double(tipPercentage)
        return checkAmount / 100 * tipSelection
    }
    
    var grandTotal: Double {
        return checkAmount + tipAmount
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        return grandTotal / peopleCount
    }
    // MARK: - Body
    var body: some View {
        Form {
            checkTotalSection
            numberOfPeopleSection
            tipPercentageSection
            resultSection
        }
        .navigationTitle("Check Split")
        .scrollDismissesKeyboard(.immediately)
    }
}

// MARK: - Previews
struct CheckSplit_Previews: PreviewProvider {
    static var previews: some View {
        CheckSplit()
    }
}


// MARK: - CheckSplit vars
extension CheckSplit {
    var checkTotalSection: some View {
        Section {
            TextField("Check Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .keyboardType(.decimalPad)
        } header: {
            Text("Check Total")
        }
    }
    
    var numberOfPeopleSection: some View {
        Section {
            Picker("Number Of People", selection: $numberOfPeople) {
                ForEach(2..<21) { number in
                    Text("\(number)")
                }
            }
        } header: {
            Text("Number Of People")
        }
    }
    
    var tipPercentageSection: some View {
        Section {
            Picker("Tip Percentage", selection: $tipPercentage) {
                ForEach(tipPercentageArray, id: \.self) { percent in
                    Text(percent, format: .percent)
                }
            }
            .pickerStyle(.segmented)
        } header: {
            Text("Tip Percentage")
        }
    }
    
    var resultSection: some View {
    
        Section {
            resultView("Tip Amount", amount: tipAmount)
            resultView("Grand Total", amount: grandTotal)
            resultView("Total Per Person", amount: totalPerPerson)
            
        } header: {
            Text("Results")
        }
    }
}

// MARK: - CheckSplit functions
extension CheckSplit {
    func resultView(_ name: String, amount: Double) -> some View {
        HStack {
            Text(name)
            Text(amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
        }
    }
}
