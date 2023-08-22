//
//  CompaniesTest2.swift
//  InstructionLectures
//
//  Created by Leo Arnold on 8/22/23.
//

import SwiftUI

class CompaniesVM: ObservableObject {
    
    let companies = [
        Company(form: (name: "Apple", colors: ["ffffff", "a3aaae", "000000"], image: "https://www.pngmart.com/files/10/Apple-Logo-PNG-Photos.png")),
        Company(form: (name: "Android", colors: ["0000ff", "a3aaae", "000000"], image: "https://www.pngmart.com/files/10/Apple-Logo-PNG-Photos.png")),
    ]
    
//    func colorConvert(colors: [String]) -> [Color] {
//        ForEach(colors.indices) { color in
//            Color(hex: color)
//        }
//    }
    
    
    
    //    let arrayForm = [(name: "Apple", hexColor1: "ffffff", hexColor2: "a3aaae", hexColor3: "000000", image: "https://www.pngmart.com/files/10/Apple-Logo-PNG-Photos.png")],
    //    [(name: "Android", hexColor1: "000000", hexColor2: "000000", hexColor3: "111111", image: "https://www.pngmart.com/files/13/Android-Logo-PNG-Transparent-Image.png")]
    //    [(name: "Andriod", hexColor1: "ffffff", hexColor2: "ffffff")]
}


struct CompaniesTest2: View {
    
    @StateObject var companyVm = CompaniesVM()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(companyVm.companies) { company in
                    NavigationLink {
                        Text(company.form.name)
                    } label: {
                        Text(company.form.name)
                            .font(.body)
                    }
                }
            }
        }
    }
}

struct CompaniesTest2_Previews: PreviewProvider {
    static var previews: some View {
        CompaniesTest2()
    }
}
