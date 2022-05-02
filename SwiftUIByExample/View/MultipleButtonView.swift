//
//  MultipleButtonView.swift
//  SwiftUIByExample
//
//  Created by junemp on 2022/04/30.
//

import SwiftUI

struct MultipleButtonView: View {
    
    @EnvironmentObject var viewRouter : ViewRouter
    
    var body: some View {
        VStack(alignment:.center) {
            List {
                HStack(alignment: .center) {
                    Spacer()
                    Button("First button") {
                        print("First action")
                    }
                    
                    Button("Second button") {
                        print("Second action")
                    }
                    Spacer()
                }
                .background(Color.blue)
    //            .opacity(0.4)
                .padding(5)
                .background(Color.green)
            }
            .buttonStyle(.bordered)
            .background(.white)
            .frame(height: 120)
            
            
            Button(action: {
                withAnimation {
                    viewRouter.currentPage = .page1
                }
                
            }, label: {
                NextButtonContent()
            })
            
            Spacer()
        }
        
        
    }
}

struct NextButtonContent : View {
    var body: some View {
        Text("Next")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
//            .padding(.top, 50)
    }
}

struct MultipleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleButtonView()
    }
}
