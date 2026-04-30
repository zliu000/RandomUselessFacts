import SwiftUI

@Observable
class AppModel {
    private(set) var favoritedFacts: [UselessFact] = []
    
    func getFavoritedFacts() -> [UselessFact]{
        return favoritedFacts
    }
    
    // When displaying the new randomly fetched fact
    // Check if it's already been favorited or not
    func addFavoritedFacts(favorite: UselessFact) {
        favoritedFacts.append(favorite)
    }
    
    func removeFavoritedFacts(idx: Int) {
        favoritedFacts.remove(at: idx)
    }
}
