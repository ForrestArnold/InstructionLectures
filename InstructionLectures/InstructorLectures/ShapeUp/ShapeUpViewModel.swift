//
//  ShapeUpViewModel.swift
//  InstructionLectures
//
//  Created by Student on 5/4/23.
//

import Foundation
import SwiftUI

class ShapeUpViewModel: ObservableObject {
    
    @Published var widthIncrement: CGFloat = 0
    @Published var heightIncrement: CGFloat = 0
    @Published var cornerRadius: CGFloat = 0
    @Published var shapeColor: Color = Color.black
    @Published var rotation: Double = 0.0
    
    func changeWidth(positiveAmount: CGFloat = 0, negativeAmount: CGFloat = 0) {
        withAnimation {
            if widthIncrement >= 0 && widthIncrement < 200 {
                widthIncrement += positiveAmount
            }
            
            if widthIncrement <= 200 && widthIncrement > 0 {
                widthIncrement -= negativeAmount
            }
        }
    }
    
    func changeHeight(positiveAmount: CGFloat = 0, negativeAmount: CGFloat = 0) {
        withAnimation {
            if heightIncrement >= 0 && heightIncrement < 200 {
                heightIncrement += positiveAmount
            }
            
            if heightIncrement <= 200 && heightIncrement > 0 {
                heightIncrement -= negativeAmount
            }
        }
    }
    
    func changeCornerRadius(positiveAmount: CGFloat = 0, negativeAmount: CGFloat = 0) {
        withAnimation {
            if cornerRadius >= 0 && cornerRadius < 50 {
                cornerRadius += positiveAmount
            }
            
            if cornerRadius <= 50 && cornerRadius > 0 {
                cornerRadius -= negativeAmount
            }
        }
    }
    
    func changeRotation(positiveAmount: Double = 0, negativeAmount: Double = 0) {
        withAnimation {
            if rotation >= -360 && rotation < 360 {
                rotation += positiveAmount
            }
            
            if rotation <= 360 && rotation > -360 {
                rotation -= negativeAmount
            }
        }
    }
    
    func resetValues() {
        withAnimation {
            widthIncrement = 0
            heightIncrement = 0
            cornerRadius = 0
            shapeColor = .black
            rotation = 0
        }
    }
}
