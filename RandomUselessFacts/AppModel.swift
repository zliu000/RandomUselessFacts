import SwiftUI

@Observable
class AppModel {
    private(set) var favoritedFacts: [UselessFact] = []
    private(set) var heartValue = true
    private(set) var infoValue = true
    
    func getFavoritedFacts() -> [UselessFact]{
        return favoritedFacts
    }
    
    func isFavoritedFact(fact: UselessFact) -> Bool {
        for favoritedFact in favoritedFacts {
            if fact.id == favoritedFact.id {
                return true
            }
        }
        return false
    }
    
    func heartPressed(){
        heartValue.toggle()
    }
        
    func xPressed(){
        
    }
    
    func infoPressed(){
        
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
