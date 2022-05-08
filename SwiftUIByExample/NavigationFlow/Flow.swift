//
//  Flow.swift
//  SwiftUIByExample
//
//  Created by junemp on 2022/05/08.
//

import SwiftUI

struct Flow<Content>: View where Content: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var next: Bool
    var content: Content
    var body: some View {
        NavigationLink(isActive: $next, destination: {
            VStack() {
                content
            }            
        }, label: {
            EmptyView()
        })
    }
    init(next: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._next = next
        self.content = content()
    }
}
