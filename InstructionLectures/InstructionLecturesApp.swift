//
//  InstructionLecturesApp.swift
//  InstructionLectures
//
//  Created by Student on 4/24/23.
//

import SwiftUI

import NavigationRouter

@main
struct InstructionLecturesApp: App {
    var body: some Scene {
        WindowGroup {
//            HomeView()
//            NavigationStackDemo()
            NavigationRouter {
                NavigationRouterDemo()
                    .navigatesTo(NavigationRouterSettings.self)
                    .navigatesTo(NavigationRouterGameScreen.self)
            }
        }
    }
}
