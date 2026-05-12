import SwiftUI

struct ContentView: View {
    let model: AppModel
    
    var body: some View {
        NavigationStack{
            DailyScreenView()
        }
    }
}

#Preview {
    ContentView(model: AppModel())
        .environment(NetworkClient())
        .environment(AppModel())
}
