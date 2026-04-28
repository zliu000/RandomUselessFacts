import SwiftUI

@main
struct RandomUselessFactsApp: App {
    @State private var appModel = AppModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(model: appModel)
        }
    }
}
