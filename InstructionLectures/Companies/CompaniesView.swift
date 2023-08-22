//
//  CompaniesView.swift
//  InstructionLectures
//
//  Created by Leo Arnold on 8/21/23.
//

import SwiftUI

struct CompaniesView: View {
    let companyArray = ["Android",
                        "Samsung",
                        "Yahoo",
                        "Google",
                        "FireFox",
                        "McDonald's",
                        "In-N-Out",
                        "Wendy's",
                        "Nike",
                        "Adidas",
                        "Old Navy",
                        "Activision",
                        "Nintendo",
                        "Devolver Digital",
                        "FedEx",
                        "UPS",
                        "Amazon",
                        "Facebook",
                        "Instagram",
                        "YouTube"]
    var body: some View {
        List(companyArray, id: \.self) { company in
            Text(company)
        }
    }
}

struct CompaniesView_Previews: PreviewProvider {
    static var previews: some View {
        CompaniesView()
    }
}
