import SwiftUI

struct XIcon: View {
    @Environment(AppModel.self) private var model: AppModel

    var body: some View{
        HStack{
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
        }
    }
}
