import SwiftUI

struct FavoritesView: View {
    @Environment(AppModel.self) private var appModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .center) {
                ForEach(appModel.favoritedFacts, id: \.id) { favoritedFact in
                    VStack(alignment: .leading){
                        Image(systemName: "star")
                            .foregroundStyle(.yellow)
                            .font(.title)
                        FactDisplay(fact: favoritedFact.text)
                    }
                    .padding()
                    .onLongPressGesture {
                        
                        
                        appModel.removeFavoriedFacts(fact: favoritedFact)
                    }
                }
            }
        }
    }
}


#Preview {
  FavoritesView()
        .environment(NetworkClient())
        .environment(AppModel())
}
