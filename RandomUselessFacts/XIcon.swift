import SwiftUI

struct XIcon: View {
    @Environment(AppModel.self) private var model: AppModel

    var body: some View{
        HStack{
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .symbolEffect(.bounce, value: model.xValue)
                .animation(.bouncy(duration: 0.5), value: model.xValue)
                .onTapGesture {
                    model.xPressed()
                }
        }
    }
}


#Preview {
    XIcon()
        .environment(NetworkClient())
        .environment(AppModel())
}
