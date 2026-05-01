import SwiftUI

struct XIcon: View {
    @State private var value = true
    
    var body: some View{
        HStack{
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .offset(x:100,y:200)

        }
    }
}
