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
                resetButton
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
        
        LinearGradient(colors: [Color.blue, Color.gray], startPoint: .trailing, endPoint: .bottomLeading).ignoresSafeArea()
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
        VStack {
            Text("Angle: \(shapeUp.rotation)")
            
            Slider(value: $shapeUp.rotation, in: 0...360)
            {
                Text("Rotation")
                
            } minimumValueLabel: {
                Text("0")
                
            } maximumValueLabel: {
                Text("360")
            }
        }
    }
    
    var resetButton: some View {
        Button {
            shapeUp.resetValues()
        } label: {
            Text("Reset Values")
                .foregroundColor(.black)
                .font(.system(size: 28, design: .rounded))
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(Color.orange)
                .cornerRadius(25)
                .padding()
        }
        
    }
}
