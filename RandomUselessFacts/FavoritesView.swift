import SwiftUI

struct FavoritesView: View {
    @Environment(AppModel.self) private var model
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .center) {
                ForEach(model.favoritedFacts, id: \.id) { favoritedFact in
                    VStack(alignment: .leading){
                        Image(systemName: "star")
                            .foregroundStyle(.yellow)
                            .font(.title)
                        FactDisplay(fact: favoritedFact.text)
                    }
                    .padding()
                    .onLongPressGesture {
                        model.removeFavoriedFacts(fact: favoritedFact)
                    }
                }
            }
        }
    }
}


#Preview {
  FavoritesView()
        .environment(AppModel())
}
