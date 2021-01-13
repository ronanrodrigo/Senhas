import SwiftUI

enum SeparatorsViewFactory {
    static func make(_ inlcudeSeparator: Binding<Bool>, _ separator: Binding<String>) -> some View {
        SeparatorsView(inlcudeSeparator: inlcudeSeparator, separator: separator)
    }
}
