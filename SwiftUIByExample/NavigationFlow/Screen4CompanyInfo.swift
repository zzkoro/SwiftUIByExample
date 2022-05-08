//
//  Screen4CompanyInfo.swift
//  SwiftUIByExample
//
//  Created by junemp on 2022/05/07.
//

import SwiftUI
import Combine

final class Screen4CompanyInfoVM: ObservableObject, Completeable {
    @Published var workEmail = ""
    
    let didComplete = PassthroughSubject<Screen4CompanyInfoVM, Never>()
    let goToRootRequested = PassthroughSubject<Screen4CompanyInfoVM, Never>()
    let goTo2Requested = PassthroughSubject<Screen4CompanyInfoVM, Never>()
    let goTo3Requested = PassthroughSubject<Screen4CompanyInfoVM, Never>()
    
    init(workEmail: String?) {
        self.workEmail = workEmail ?? ""
    }
    
    func didTapNext() {
        didComplete.send(self)
    }
    
    func didTapGoBackToRoot() {
        goToRootRequested.send(self)
    }
    
    func didTapGoBack2() {
        goTo2Requested.send(self)
    }
    
    func didTapGoBack3() {
        goTo3Requested.send(self)
    }
}

struct Screen4CompanyInfo: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var vm: Screen4CompanyInfoVM
    
    var body: some View {
        VStack(alignment: .center) {
            Text("4: Enter Work Details")
            TextField("Work Email", text: $vm.workEmail)
            Button(action: {
                self.vm.didTapNext()
            }, label: { Text("Next") })
            Text("")
            Text("Test other programmatic navigation")
            Button(action: {
                self.vm.didTapGoBackToRoot()
            }, label: { Text("Go back to root") })
            Button(action: {
                self.vm.didTapGoBack2()
            }, label: { Text("Go back to 2") })
            Button(action: {
                self.vm.didTapGoBack3()
            }, label: { Text("Go back to 3, change name") })
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

struct Screen4CompanyInfo_Previews: PreviewProvider {
    static var previews: some View {
        let vm = Screen4CompanyInfoVM(workEmail: "")
        Screen4CompanyInfo(vm: vm)
    }
}
