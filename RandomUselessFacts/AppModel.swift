import SwiftUI

@Observable
class AppModel {
    private(set) var favoritedFacts: [UselessFact] = []
    private(set) var heartValue = false
    private(set) var heartPress = false
    private(set) var infoValue = false
    private(set) var xValue = false
    private(set) var factMove = 0
    
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
        heartPress.toggle()
        withAnimation(.easeOut(duration: 1.15)){
            self.factMove = 1000
        } completion: {
            self.factMove = 0
        }
    }
        
    func xPressed(){
        xValue.toggle()
        withAnimation(.easeOut(duration: 0.7)){
            self.factMove = -1000
        } completion: {
            self.factMove = 0
        }
    }
    
    func infoPressed(){
        infoValue.toggle()
    }
    
    func resetAndRefresh(){
        heartValue = false
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
