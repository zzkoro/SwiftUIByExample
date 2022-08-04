//
//  StepperAnimationView.swift
//  SwiftUIByExample
//
//  Created by junemp on 2022/05/09.
//

import SwiftUI

struct StepperAnimationView: View {
    @State var number: Int = 0
    @State private var animatedAngle = 0.0
    
    var body: some View {
        ZStack {
            ZStack {
                Text("\(number)")
                    .font(.system(size: 25))
                HStack {
                    VStack {
                        
                    }
                    .frame(width: 125, height: 100, alignment: .leading)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        onFlipPrevious()
                    }
                    VStack {
                        
                    }
                    .frame(width: 125, height: 100, alignment: .trailing)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        onFlipNext()
                    }
                }
            }
        }
        .background(Color.yellow)
        .frame(width: 250, height: 100, alignment: .center)
        .rotation3DEffect(Angle(degrees: animatedAngle), axis: (x: 0.0, y: 1.0, z: 0.0))
        .animation(Animation.linear(duration: 0.6), value: animatedAngle)
    
    }
    
    func onFlipPrevious() {
        number -= 1
        animatedAngle -= 180.0
    }
    
    func onFlipNext() {
        number += 1
        animatedAngle += 180.0
    }
}

struct StepperAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        StepperAnimationView()
    }
}
