//
// From SwiftUI by Example by Paul Hudson
// https://www.hackingwithswift.com/quick-start/swiftui
//
// You're welcome to use this code for any purpose,
// commercial or otherwise, with or without attribution.
//

import SwiftUI
import Combine

class UserProgress: ObservableObject {
    @Published var score = 0
}

struct InnerView: View {
    @ObservedObject var progress: UserProgress

    var body: some View {
        Button("Increase Score") {
            progress.score += 1
        }
    }
}

struct ContentView: View {
    @StateObject var progress = UserProgress()
//    @ObservedObject var progress = UserProgress()
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .main:
            NavigationView {
            List {
                Text("Hello, world!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .padding()
                    .background(.mint)
                    .padding()
                    .background(.green)

            
                Text("Your score is \(progress.score)")
                InnerView(progress: progress)
//                Spacer()

//                NavigationLink(destination: MultipleButtonView()) {
//                    Text("MultipleButton 예제")
//                }
                
                Button("MultipleButton 예제") {
                    viewRouter.currentPage = .page2
                }
                
                Button("Flow 예제") {
                    viewRouter.currentPage = .page3
                }
            }
            .navigationTitle("FriendFace")
//            .navigationViewStyle(.stack)
        }
        case .page2:
            MultipleButtonView()
                .transition(.scale)
        case .page3:
            let vm = FlowVM()
            FlowView(vm: vm)
        }
        
    }
}

struct ContentView2: View {
    var body: some View {
        Text("111")
        Text("222")
    }
    
    @ViewBuilder
    var manyTexts: some View {
        Text("AAA")
        Text("BBB")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            ContentView().environmentObject(ViewRouter())
                .previewInterfaceOrientation(.portraitUpsideDown)
        } else {
            // Fallback on earlier versions
        }
    }
}

