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
        }
    }
}

struct DailyScreenView: View {
    @State private var client = NetworkClient()
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
            .border(.black, width: 2)
            .offset(y:-200)

            HStack{
                Text(client.currentFact.text)
                    .font(.title3)
                    .monospaced()
                    .task{
                        await client.getUselessFact(endpoint: .daily)
                    }
            }
            .padding()
            .background(Color.white)
            .border(.black, width: 5)

            Button("Tap to meet your match"){
                showDetailView = true
            }
            .monospaced()
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
    @State private var client = NetworkClient()
    @State private var value = true
    @State private var scale = 1.0
    
    var body: some View {
        
        ZStack{
            HStack{
                Text(client.currentFact.text)
                    .font(.title3)
                    .monospaced()
                    .task{
                        await client.getUselessFact(endpoint: .random)
                        let factID = client.currentFact.id
                        await client.getUselessFactDetails(factID: factID)
                    }
            }
            .padding()
            .background(Color.white)
            .border(.black, width: 5)
            .offset(y:-200)
            let description = client.selectedFact.source.description
            HStack{
                Text(description)
                    .font(.title3)
                    .monospaced()
            }
            .padding()
            .background(Color.white)
            .border(.black, width: 5)
            HStack{
                Image(systemName: "heart.fill")    .resizable()
                    .scaledToFit()
                    .foregroundStyle(value ? .gray : .red)
                    .frame(width: 70, height: 70)
                    .animation(.bouncy(duration: 0.5, extraBounce: 2.0), value: scale)
                    .onTapGesture {
                        value.toggle()
                        scale = 2.0
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            scale = 1.0
                        }
                    }
                    .animation(.bouncy(duration: 0.5), value: value)
                 

                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
            }
            .offset(y:200)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.factSwipe)
    }
}

struct FavoritesView: View {
    var body: some View {
        
    }
}

#Preview {
    ContentView(model: AppModel())
}
