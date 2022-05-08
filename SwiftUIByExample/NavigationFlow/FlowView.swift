//
//  FlowView.swift
//  SwiftUIByExample
//
//  Created by junemp on 2022/05/08.
//

import SwiftUI

struct FlowView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var vm: FlowVM
    
    var body: some View {
        NavigationView {
            VStack() {
                Screen1Phone(vm: vm.makeScreen1PhoneVM())
                Flow(next: $vm.navigateTo2) {
                    Screen2Verification(vm: vm.makeScreen2VerificationVM())
                    Flow(next: $vm.navigateTo3) {
                        Screen3NameEmail(vm: vm.makeScreen3NameEmailVM())
                        Flow(next: $vm.navigateTo4) {
                            Screen4CompanyInfo(vm: vm.makeScreen4CompanyInfoVM())
                            Flow(next: $vm.navigateToFinalFrom4) {
                                Screen5Final(vm: vm.makeScreen5FinalVM())
                            }
                        }
                        Flow(next: $vm.navigateToFinalFrom3) {
                            Screen5Final(vm: vm.makeScreen5FinalVM())
                        }
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}


struct FlowView_Previews: PreviewProvider {
    static var previews: some View {
        let flowVM = FlowVM()
        FlowView(vm: flowVM)
    }
}
