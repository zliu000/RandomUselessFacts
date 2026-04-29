import SwiftUI

let dailyGradient: [Color] = [
    .dailyFactTop,
    .dailyFactBottom
]


struct ContentView: View {
    let model: AppModel
    
    var body: some View {
        NavigationStack{
            DailyScreenView()
            TinderView()
                .transition(.push(from: .trailing))
            FavoritesView()
        }
    }
}

struct DailyScreenView: View {
    @State private var showDetailView = false
    var body: some View {
        ZStack{
            HStack{
                Text("Fact of the Day!")
                    .font(.title3)
                    .monospaced()
            }
            .padding()
            .background(Color.white)
            .offset(y:-200)
            Button("Tap to meet your match"){
                showDetailView = true
            }
            .tint(Color.black)
            .background(Color.white)
            .buttonStyle(.borderedProminent)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .offset(y:250)
            .navigationDestination(isPresented: $showDetailView){
                TinderView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Gradient(colors: dailyGradient))
    }
}

struct TinderView: View {
    var body: some View {
        
    }
}

struct FavoritesView: View {
    var body: some View {
        
    }
}

#Preview {
    ContentView(model: AppModel())
}
