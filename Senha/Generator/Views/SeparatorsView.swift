import SwiftUI

struct SeparatorsView: View {
    @Binding var inlcudeSeparator: Bool
    @Binding var separator: String
    @State private var separators = ["-", "/", "+", ":"]
    @State private var selectedSeparator = 0

    var body: some View {
        Group {
            Toggle(isOn: $inlcudeSeparator) {
                HStack {
                    Image(systemName: "divide.square.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                    Text("Separator")
                }
            }

            let selectionBinding = Binding<Int> {
                self.selectedSeparator
            } set: {
                self.selectedSeparator = $0
                self.separator = self.separators[$0]
            }

            Picker("Separators", selection: selectionBinding) {
                ForEach(0 ..< separators.count) {
                    Text(self.separators[$0])
                }
            }
            .disabled(!inlcudeSeparator)
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding(.vertical)
    }
}

struct SeparatorsView_Previews: PreviewProvider {
    static var previews: some View {
        SeparatorsViewFactory.make(
            .constant(true),
            .constant("-"))
    }
}
