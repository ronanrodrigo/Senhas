import SwiftUI

final class PasswordSizeViewFactory {
    private init() { }

    static func make(_ length: Binding<Int>) -> some View {
        PasswordSizeView(length: length)
    }
}
