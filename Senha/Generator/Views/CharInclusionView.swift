import SwiftUI

struct CharInclusionView: View {
    @Binding var includeNumbers: Bool
    @Binding var includeLetters: Bool
    @Binding var includeSymbols: Bool

    var body: some View {
        Group {
            Toggle(isOn: $includeNumbers) {
                HStack {
                    Image(systemName: "number.square.fill")
                        .font(.title)
                        .foregroundColor(.green)
                    Text("Numbers")
                }
            }
            Toggle(isOn: $includeLetters) {
                HStack {
                    Image(systemName: "a.square.fill")
                        .font(.title)
                        .foregroundColor(.orange)
                    Text("Letters")
                }
            }
            Toggle(isOn: $includeSymbols) {
                HStack {
                    Image(systemName: "questionmark.square.fill")
                        .font(.title)
                        .foregroundColor(.purple)
                    Text("Symbols")
                }
            }
        }
        .padding(.vertical)
    }
}

struct CharInclusionView_Previews: PreviewProvider {
    static var previews: some View {
        CharInclusionViewFactory.make(
            .constant(true),
            .constant(true),
            .constant(false))
    }
}
