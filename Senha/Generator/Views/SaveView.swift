import SwiftUI

struct SaveView: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Text("Save on iCloud")
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
    }
}

struct SaveView_Previews: PreviewProvider {
    static var previews: some View {
        SaveViewFactory.make()
    }
}
