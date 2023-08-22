//
//  DoughnutsList.swift
//  InstructionLectures
//
//  Created by Leo Arnold on 8/22/23.
//

import SwiftUI

struct DoughnutsList: View {
    
    @StateObject private var doughnutsVM = DoughnutsViewModel()
    @State private var showingPopup = false
    
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack {
                listOfDoughnuts
            }
        }
        .sheet(isPresented: $showingPopup) {
            
        }
        .navigationTitle("My Doughnuts")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    doughnutsVM.createDoughnut()
                } label: {
                    Text("+🍩")
                }
            }
        }
    }
}

struct DoughnutsList_Previews: PreviewProvider {
    static var previews: some View {
        DoughnutsList()
    }
}


extension DoughnutsList {
    
    var listOfDoughnuts: some View {
        List {
            ForEach(doughnutsVM.doughnuts) { doughnut in
                Text(doughnut.name ?? "No Doughnut name")
            }
        }
    }
}
