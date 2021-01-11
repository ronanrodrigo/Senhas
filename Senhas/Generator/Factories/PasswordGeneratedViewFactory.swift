import SwiftUI

final class PasswordGeneratedViewFactory {
    private init() { }

    static func make(_ viewModel: PasswordViewModel) -> some View {
        PasswordGeneratedView(passwordViewModel: viewModel)
    }
}
