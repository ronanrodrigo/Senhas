import Combine

/// @mockable
protocol GeneratePasswordMutablePresentable {
    func update(password: Password)
    func handle(error: GeneratorError)
}

protocol GeneratePasswordPresentable: ObservableObject, GeneratePasswordMutablePresentable {
    var passwordViewModel: PasswordViewModel { get }
}

final class GeneratePasswordPresenter: GeneratePasswordPresentable {
    @Published var passwordViewModel = PasswordViewModel()

    func update(password: Password) {
        let viewModel = PasswordViewModel(password: password)
        passwordViewModel = viewModel
    }

    func handle(error: GeneratorError) {
        let viewModel: PasswordViewModel
        switch error {
        case .invalidLength, .withoutInclusions:
            viewModel = PasswordViewModel(errorMessage: "Invalid options")
        }
        passwordViewModel = viewModel
    }
}
