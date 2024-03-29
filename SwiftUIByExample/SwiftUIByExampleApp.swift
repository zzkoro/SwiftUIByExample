//
// From SwiftUI by Example by Paul Hudson
// https://www.hackingwithswift.com/quick-start/swiftui
//
// You're welcome to use this code for any purpose,
// commercial or otherwise, with or without attribution.
//

import SwiftUI

@main
struct SwiftUIByExampleApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            let userSetting = UserSetting()
            ContentView()
                .environmentObject(userSetting)
                .environmentObject(viewRouter)
        }
    }
}
