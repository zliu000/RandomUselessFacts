import SwiftUI

struct HeartIcon: View {
    @Environment(AppModel.self) private var model: AppModel
        
    var body: some View{
        HStack{
            
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(model.heartValue ? .red : .gray)
                .frame(width: 100, height: 100)
                .symbolEffect(.bounce, value: model.heartValue)
                .animation(.bouncy(duration: 0.5), value: model.heartValue)
                .onTapGesture {
                withAnimation(.bouncy(duration: 0.3)) {
                    model.heartPressed()
                } completion: {
                    model.resetAndRefresh()
                }
            }
        }
    }
}


#Preview {
    HeartIcon()
        .environment(NetworkClient())
        .environment(AppModel())
}
