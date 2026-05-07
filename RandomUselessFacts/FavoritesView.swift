import SwiftUI

struct FavoritesView: View {
    var body: some View {
        
    }
}

#Preview {
    FavoritesView()
        .environment(NetworkClient())
        .environment(AppModel())
}
