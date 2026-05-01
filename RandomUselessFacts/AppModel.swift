import SwiftUI

@Observable
class AppModel {
    private(set) var favoritedFacts: [UselessFact] = []
    private(set) var value = true

    func getFavoritedFacts() -> [UselessFact]{
        return favoritedFacts
    }
    
    func heartPressed(){
        value.toggle()
    }
    
    func xPressed(){
        
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
