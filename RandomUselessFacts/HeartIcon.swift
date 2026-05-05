import SwiftUI

struct HeartIcon: View {
    @Environment(AppModel.self) private var model: AppModel
        
    var body: some View{
        HStack{
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(model.heartValue ? .gray : .red)
                .frame(width: 100, height: 100)
                .symbolEffect(.bounce, value: model.heartValue)
                .animation(.bouncy(duration: 0.5), value: model.heartValue)
                .onTapGesture {
                    model.heartPressed()
                }
        }
    }
}
