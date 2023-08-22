//
//  Company.swift
//  InstructionLectures
//
//  Created by Leo Arnold on 8/22/23.
//

import Foundation

struct Company: Identifiable {
    var id = UUID()
    
    let form: (name: String, colors: [String], image: String)
}


