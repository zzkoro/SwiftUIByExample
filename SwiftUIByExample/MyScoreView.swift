//
//  MyScoreView.swift
//  SwiftUIByExample
//
//  Created by junemp on 2022/01/30.
//

import SwiftUI

struct MyScoreView: View {
    
    @Binding var score: Int
    
    var body: some View {
        VStack {
            Text("\(self.score)")
            Button("클릭시 score 증가") {
                self.score += 1
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.black)
        }
        .padding()
        .background(Color.yellow)
    }
}

struct MyScoreView_Previews: PreviewProvider {
    static var previews: some View {
        MyScoreView(score: .constant(0))
    }
}
