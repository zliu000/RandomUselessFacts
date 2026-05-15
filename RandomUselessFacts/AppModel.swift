import SwiftUI

@Observable
class AppModel {
    private(set) var favoritedFacts: [UselessFact] = []
    private(set) var heartValue = false
    private(set) var heartPress = false
    private(set) var infoValue = false
    private(set) var xValue = false
    private(set) var factMove = 0
    private(set) var factMoveY = 0
    private(set) var dailyHeart = false
    
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
        heartValue = true
        heartPress.toggle()
        withAnimation(.easeOut(duration: 1.15)){
            self.factMove = 1000
        } completion: {
            self.factMove = 0
            Task {
                try await Task.sleep(for: .seconds(1))
            }
            self.factMoveY = -500
            withAnimation(.easeOut(duration:1)){
                self.factMoveY = 0
            }
        }
    }
    
//    func dailyPress(){
//        heartValue.toggle()
//        dailyHeart = true
//    }
    
//    func heartValueTurnFalse(){
//        heartValue = false
//    }
        
    func xPressed(){
        xValue.toggle()
        withAnimation(.easeOut(duration: 0.7)){
            self.factMove = -1000
        } completion: {
            self.factMove = 0
            Task {
                try await Task.sleep(for: .seconds(1))
            }
            self.factMoveY = -500
            withAnimation(.easeOut(duration:1)){
                self.factMoveY = 0
            }
        }
    }
    
    func infoPressed(){
        infoValue.toggle()
    }
    
    func resetAndRefresh(){
        heartValue = false
        infoValue = false
    }

        
        // When displaying the new randomly fetched fact
        // Check if it's already been favorited or not
        func addFavoritedFacts(favorite: UselessFact) {
            favoritedFacts.append(favorite)
        }
        
        func removeFavoritedFacts(idx: Int) {
            favoritedFacts.remove(at: idx)
        }
    
    func removeFavoriedFacts(fact: UselessFact) {
        favoritedFacts.removeAll { modelFact in
            modelFact.id == fact.id
        }
    }
}
