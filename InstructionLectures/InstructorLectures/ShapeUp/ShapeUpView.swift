//
//  ShapeUpView.swift
//  InstructionLectures
//
//  Created by Student on 5/4/23.
//

import SwiftUI

struct ShapeUpView: View {
    
    @StateObject private var shapeUp = ShapeUpViewModel()
    
    var body: some View {
        ZStack {
            background
            VStack {
                VStack {
                    widthStepper
                    heightStepper
                    cornerRadiusStepper
                    colorPickerSection
                    rotationSlider
                }
                .font(.system(size: 26))
                .padding(20)
                Spacer()
                shape
                Spacer()
            }
        }
    }
}

struct ShapeUpView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeUpView()
    }
}

// MARK: - Views
extension ShapeUpView {
    var background: some View {
        
            LinearGradient(colors: [Color.gray, Color.white], startPoint: .trailing, endPoint: .bottomLeading).ignoresSafeArea()
    }
    
    var shape: some View {
        RoundedRectangle(cornerRadius: shapeUp.cornerRadius)
            .frame(width: 100 + shapeUp.widthIncrement, height: 100 + shapeUp.heightIncrement)
            .foregroundColor(shapeUp.shapeColor)
            .rotationEffect(Angle(degrees: Double(shapeUp.rotation)))
    }
    
    var widthStepper: some View {
        Stepper("Width: \(Int(shapeUp.widthIncrement))") {
            shapeUp.changeWidth(positiveAmount: 10)
        } onDecrement: {
            shapeUp.changeWidth(negativeAmount: 10)
        }

    }
    
    var heightStepper: some View {
        Stepper("Height: \(Int(shapeUp.heightIncrement))") {
            shapeUp.changeHeight(positiveAmount: 10)
        } onDecrement: {
            shapeUp.changeHeight(negativeAmount: 10)
        }

    }
    
    var cornerRadiusStepper: some View {
        Stepper("Corner Radius: \(Int(shapeUp.cornerRadius))") {
            shapeUp.changeCornerRadius(positiveAmount: 1)
        } onDecrement: {
            shapeUp.changeCornerRadius(negativeAmount: 1)
        }

    }
    
    var colorPickerSection: some View {
        ColorPicker("Choose A Color", selection: $shapeUp.shapeColor, supportsOpacity: true)
    }
    
    var rotationSlider: some View {
        Stepper("Rotation: \(shapeUp.rotation)") {
            shapeUp.changeRotation(positiveAmount: 10)
        } onDecrement: {
            shapeUp.changeRotation(negativeAmount: 10)
        }
    }
}
