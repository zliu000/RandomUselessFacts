import SwiftUI

struct HeartIcon: View {
    @Environment(AppModel.self) private var model: AppModel
        
    var body: some View{
        HStack{
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(model.value ? .gray : .red)
                .frame(width: 70, height: 70)
                .symbolEffect(.bounce, value: model.value)
                .animation(.bouncy(duration: 0.5), value: model.value)
                .onTapGesture {
                    model.heartPressed()

                }
                .offset(x:-100,y:200)
        }
    }
}
