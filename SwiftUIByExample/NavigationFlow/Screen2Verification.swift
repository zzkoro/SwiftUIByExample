//
//  Screen2Verification.swift
//  SwiftUIByExample
//
//  Created by junemp on 2022/05/07.
//

import SwiftUI
import Combine

final class Screen2VerificationVM: ObservableObject, Completeable {
    @Published var verification = ""
    var phoneNumber: String
    
    let didComplete = PassthroughSubject<Screen2VerificationVM, Never>()
    
    init(phoneNumber: String?) {
        self.phoneNumber = phoneNumber ?? ""
    }
    
    func didTapNext() {
        didComplete.send(self)
    }
}

struct Screen2Verification: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var vm: Screen2VerificationVM
    
    var body: some View {
        VStack(alignment: .center) {
            Text("2: Verification sent to \(vm.phoneNumber)")
            TextField("Verification Number", text: $vm.verification)
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

struct Screen2Verification_Previews: PreviewProvider {
    static var previews: some View {
        let vm = Screen2VerificationVM(phoneNumber: "")
        Screen2Verification(vm: vm)
    }
}
