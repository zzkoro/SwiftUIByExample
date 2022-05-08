//
//  Screen5Final.swift
//  SwiftUIByExample
//
//  Created by junemp on 2022/05/07.
//

import SwiftUI
import Combine

final class Screen5FinalVM: ObservableObject, Completeable {
    let name: String
    
    let didComplete = PassthroughSubject<Screen5FinalVM, Never>()
    
    init(name: String?) {
        self.name = name ?? ""
    }
    
    func didTapNext() {
        didComplete.send(self)
    }
}

struct Screen5Final: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var vm: Screen5FinalVM
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Welcome to the app, \(vm.name)")
            Button(action: {
                self.vm.didTapNext()
            }, label: { Text("Next") })
        }.padding()
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button (action: {
                        print("toolbar button clicked")
                        dismiss()
                    }) {
                        Text("\(Image(systemName: "chevron.left"))")
                    }
                }

            }
    }
}

struct Screen5Final_Previews: PreviewProvider {
    static var previews: some View {
        let vm = Screen5FinalVM(name: "")
        Screen5Final(vm: vm)
    }
}
