import SwiftUI

struct TextCellView: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Circle().fill(.orange))
    }
}

struct TextCellView_Previews: PreviewProvider {
    static var previews: some View {
        TextCellView(title: "7")
    }
}
