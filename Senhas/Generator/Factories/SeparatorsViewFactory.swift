import SwiftUI

final class SeparatorsViewFactory {
    private init() { }

    static func make(_ inlcudeSeparator: Binding<Bool>, _ separator: Binding<String>) -> some View {
        SeparatorsView(inlcudeSeparator: inlcudeSeparator, separator: separator)
    }
}
