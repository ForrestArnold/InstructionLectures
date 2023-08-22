//
//  HomeView.swift
//  InstructionLectures
//
//  Created by Student on 4/24/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List { // only 10 views can go into a list
                Group {
                    navigate(to: CheckSplit(), title: "Check Split", numberOfLecture: 1)
                    navigate(to: ShapeUpView(), title: "Shape Up", numberOfLecture: 2)
                    navigate(to: NavigationViewDemo(), title: "Navigation View Demo", numberOfLecture: 3)
                    navigate(to: NavigationStackDemo(), title: "Navigation Stack Demo", numberOfLecture: 4)
                    navigate(to: DoughnutsList(), title: "Doughnut List", numberOfLecture: 5)
                }
            }
            .navigationTitle(Constants.projectTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    func navigate(to destination: some View, title: String, numberOfLecture: Int) -> some View {
        
        let randomHue: Double = Double.random(in: Constants.randomHueRange)
        let randomSaturation: Double = Double.random(in: Constants.randomSaturationRange)
        let randomBrightness: Double = Double.random(in: Constants.randomBrightnessRange)
        
        return HStack {
            Text("\(numberOfLecture)")
                .font(.system(size:
                                Constants.navigationLinkFontSize))
            NavigationLink {
                destination
            } label: {
                Text(title)
                    .font(.system(size:
                                Constants.navigationLinkFontSize))
            }
        }
        .padding()
        .background(Color(hue: randomHue, saturation: randomSaturation, brightness: randomBrightness))
        .cornerRadius(Constants.buttonCornerRadius)
    }
}
