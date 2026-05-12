import SwiftUI

struct FavoritesView: View {
    @State private var favoritedFacts: [UselessFact] = []
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .center) {
                ForEach(favoritedFacts) { favoritedFact in
                    VStack(alignment: .leading){
                        Image(systemName: "star")
                            .foregroundStyle(.yellow)
                        
                        FactDisplay(fact: favoritedFact.text)
                    }
                    .onLongPressGesture {
                        <#code#>
                    }
                }
            }
        }
    }
}


#Preview {
    FavoritesView()
>>>>>>> Stashed changes
}
