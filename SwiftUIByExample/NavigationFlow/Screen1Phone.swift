//
//  Screen1Phone.swift
//  SwiftUIByExample
//
//  Created by junemp on 2022/05/07.
//

import SwiftUI
import Combine

final class Screen1PhoneVM: ObservableObject, Completeable {
    @Published var phoneNumber = ""
    
    var isValid: Bool {
        !phoneNumber.isEmpty
    }
    
    let didComplete = PassthroughSubject<Screen1PhoneVM, Never>()
    
    init(phoneNumber: String?) {
        self.phoneNumber = phoneNumber ?? ""
    }
    
    func didTapNext() {
        guard isValid else {
            return
        }
        
        didComplete.send(self)
    }
}

struct Screen1Phone: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewRouter : ViewRouter
    
    @StateObject var vm: Screen1PhoneVM
    
    var body: some View {
        VStack(alignment: .center) {
            Text("1: We need your phone number for verification")
            TextField("Phone Number", text: $vm.phoneNumber)
            Button(action: {
                self.vm.didTapNext()
            }, label: { Text("Next") })
            .disabled(!vm.isValid)
        }.padding()
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button (action: {
                        viewRouter.currentPage = .main
                    }) {
                        Text("\(Image(systemName: "chevron.left"))")
                    }
                }

            }
    }
}

struct Screen1Phone_Previews: PreviewProvider {
    static var previews: some View {
        let vm = Screen1PhoneVM(phoneNumber: "")
        Screen1Phone(vm: vm)
    }
}
