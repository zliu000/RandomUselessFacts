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
                        FactDisplay(fact: favoritedFact.text)
                    }
                    .onLongPressGesture {
                        FactDisplay(fact:favoritedFact.text)

                        appModel.removeFavoriedFacts(fact: favoritedFact)
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
