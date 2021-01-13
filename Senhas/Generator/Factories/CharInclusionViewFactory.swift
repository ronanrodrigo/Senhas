import SwiftUI

enum CharInclusionViewFactory {
    static func make(_ includeNumbers: Binding<Bool>,
                     _ includeLetters: Binding<Bool>,
                     _ includeSymbols: Binding<Bool>) -> some View {
        CharInclusionView(includeNumbers: includeNumbers,
                          includeLetters: includeLetters,
                          includeSymbols: includeSymbols)
    }
}
