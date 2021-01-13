import SwiftUI

enum PasswordGeneratedViewFactory {
    static func make(_ viewModel: PasswordViewModel) -> some View {
        PasswordGeneratedView(passwordViewModel: viewModel)
    }
}
