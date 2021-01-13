import SwiftUI

enum PasswordSizeViewFactory {
    static func make(_ length: Binding<Int>) -> some View {
        PasswordSizeView(length: length)
    }
}
