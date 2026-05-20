import SwiftUI

@main
struct RandomUselessFactsApp: App {
    @State private var appModel = AppModel()
    @State private var networkClient = NetworkClient()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
                .environment(networkClient)
        }
    }
}

