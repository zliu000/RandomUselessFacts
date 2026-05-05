import SwiftUI

struct InfoButton: View {
    @Environment(AppModel.self) private var model: AppModel

    var body: some View{
        HStack{
            Image(systemName: "document")
                .resizable()
                .scaledToFit()
                .foregroundStyle(model.infoValue ? .white : .black)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    model.infoPressed()
                }
        }
    }
}
