import SwiftUI

let dailyGradient: [Color] = [
    .dailyFactTop,
    .dailyFactBottom
]

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
                NewTinderView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Gradient(colors: dailyGradient))
    }
}
