//
//  NavigationMethods.swift
//  Lectures
//
//  Created by Student on 6/20/23.
//

import SwiftUI

import NavigationRouter

struct NavigationViewDemo: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                // MARK: - Destination
                SecondScreen(backgroundColor: .cyan, screenTitle: "Navigation View")
            } label: {
                Text("Navigation View")
            }
        }
    }
}

struct SecondScreen: View {
    
    var backgroundColor: Color
    var screenTitle: String
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            VStack {
                Text(screenTitle)
                Spacer()
            }
        }
        .navigationTitle("Navigation View")
    }
}

struct NavigationMethods_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewDemo()
    }
}


// MARK: - Navigation Stack Demo

struct NavigationStackDemo: View {
    
    @State var navigationPath = [Car]()
    
    
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            Button {
                print("this")
                navigationPath.append(Car(make: "Ford", model: "Mustang", year: 2023))
                print("that")
            } label: {
                Text("Navigate")
            }
            .navigationDestination(for: Car.self) { car in
                Text("Make: \(car.make), Model: \(car.model), Year \(car.year)")
            }
        }
    }
}

struct Car: Identifiable, Hashable {
    let id = UUID()
    let make: String
    let model: String
    let year: Int
}

struct NavigationRouterDemo: View {
    
    @NavRouter var navRouter
    
    var body: some View {
        VStack {
            Button {
                navRouter.push(NavigationRouterSettings(playerName: "Leo"))
            } label: {
                Text("Settings")
            }
        }
    }
}

struct NavigationRouterSettings: View {
    
    @NavRouter var navRouter
    
    let playerName: String
    
    var body: some View {
        ZStack {
            
            Color.gray.ignoresSafeArea()
            VStack {
                Text("Players: \(playerName) Setting")
                
                Button {
                    navRouter.push(NavigationRouterGameScreen(score: 72))
                } label: {
                    Text("Game Screen")
                }
            }
        }
    }
}

struct NavigationRouterGameScreen: View {
    var score: Int
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack {
                Text("Score: \(score)")
            }
        }
    }
}
