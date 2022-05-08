//
//  FlowVM.swift
//  SwiftUIByExample
//
//  Created by junemp on 2022/05/07.
//

import Foundation
import Combine

protocol Completeable {
    var didComplete: PassthroughSubject<Self, Never> { get }
}

class FlowVM: ObservableObject {
    
    private let model: Model
    var subscription = Set<AnyCancellable>()
    
    
    @Published var navigateTo2: Bool = false
    @Published var navigateTo3: Bool = false
    @Published var navigateTo4: Bool = false
    @Published var navigateToFinalFrom3: Bool = false
    @Published var navigateToFinalFrom4: Bool = false
    
    init() {
        self.model = Model()
    }
    
    func makeScreen1PhoneVM() -> Screen1PhoneVM {
        let vm = Screen1PhoneVM(phoneNumber: model.phoneNumber)
        vm.didComplete
            .sink(receiveValue: didComplete1)
            .store(in: &subscription)
        return vm
    }
    
    func didComplete1(vm: Screen1PhoneVM) {
        model.phoneNumber = vm.phoneNumber
        navigateTo2 = true
    }
    
    func makeScreen2VerificationVM() -> Screen2VerificationVM {
        let vm = Screen2VerificationVM(phoneNumber: model.phoneNumber)
        vm.didComplete
            .sink(receiveValue: didComplete2)
            .store(in: &subscription)
        return vm
    }
    
    func didComplete2(vm: Screen2VerificationVM) {
        navigateTo3 = true
    }
    
    func makeScreen3NameEmailVM() -> Screen3NameEmailVM {
        let vm = Screen3NameEmailVM(name: model.name, personalEmail: model.personalEmail)
        vm.didComplete
            .sink(receiveValue: didComplete3)
            .store(in: &subscription)
        vm.skipRequested
            .sink(receiveValue: skipRequested)
            .store(in: &subscription)
        return vm
    }
    
    func didComplete3(vm: Screen3NameEmailVM) {
        updateModel(vm: vm)
        navigateTo4 = true
    }
    
    func updateModel(vm: Screen3NameEmailVM) {
        model.name = vm.name
        model.personalEmail = vm.personalEmail
    }
    
    func skipRequested(vm: Screen3NameEmailVM) {
        updateModel(vm: vm)
        navigateToFinalFrom3 = true
    }
    
    func makeScreen4CompanyInfoVM() -> Screen4CompanyInfoVM {
        let vm = Screen4CompanyInfoVM(workEmail: model.workEmail)
        vm.didComplete
            .sink(receiveValue: didComplete4)
            .store(in: &subscription)
        vm.goToRootRequested
            .sink(receiveValue: goToRootRequested)
            .store(in: &subscription)
        vm.goTo2Requested
            .sink(receiveValue: goTo2Requested)
            .store(in: &subscription)
        vm.goTo3Requested
            .sink(receiveValue: goTo3Requested)
            .store(in: &subscription)
        return vm
    }
    
    func didComplete4(vm: Screen4CompanyInfoVM) {
        model.workEmail = vm.workEmail
        navigateToFinalFrom4 = true
    }
    
    func goToRootRequested(vm: Screen4CompanyInfoVM) {
        navigateTo2 = false
    }
    
    func goTo2Requested(vm: Screen4CompanyInfoVM) {
        navigateTo3 = false
    }
    
    func goTo3Requested(vm: Screen4CompanyInfoVM) {
        navigateTo4 = false
    }
    
    func makeScreen5FinalVM() -> Screen5FinalVM {
        let vm = Screen5FinalVM(name: model.name)
        vm.didComplete
            .sink(receiveValue: didComplete5)
            .store(in: &subscription)
        return vm
    }
    
    func didComplete5(vm: Screen5FinalVM) {
        print("Complete")
        print(model)
    }
    
}
