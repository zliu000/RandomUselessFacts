import SwiftUI

let dailyGradient: [Color] = [
    .dailyFactTop,
    .dailyFactBottom
]

struct DailyScreenView: View {
    @State private var client = NetworkClient()
    @State private var showDetailView = false
    @Environment(AppModel.self) private var model

    var body: some View {
        ZStack{
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.red)
                .frame(width: 100, height: 100)
                .symbolEffect(.bounce, value: model.dailyHeart)
                .opacity(model.dailyHeart ? 100 : 0)
                .offset(y:-200)

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
            .onTapGesture(count: 2) {
                let favoritedFact = UselessFact(id: client.currentFact.id, text: client.currentFact.text)
                model.addFavoritedFacts(favorite: favoritedFact)
                withAnimation(.bouncy(duration: 0.3)) {
                    model.dailyPress()
                }
            }
            .allowsHitTesting(!model.dailyHeart)

            Button("Tap to meet your match"){
                showDetailView = true
                model.resetAndRefresh()
            }
            .monospaced()
            .tint(Color.black)
            .background(Color.white)
            .buttonStyle(.borderedProminent)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .offset(y:250)
            .navigationDestination(isPresented: $showDetailView){
                NewTinderView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Gradient(colors: dailyGradient))
    }
}

#Preview {
    DailyScreenView()
        .environment(NetworkClient())
        .environment(AppModel())
}
