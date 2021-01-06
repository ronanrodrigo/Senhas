import Combine

/// @mockable
protocol GeneratePasswordMutablePresentable {
    func update(password: Password)
    func handle(error: GeneratorError)
}

protocol GeneratePasswordPresentable: ObservableObject, GeneratePasswordMutablePresentable {
    var generatedPassword: PasswordViewModel { get }
}

final class GeneratePasswordPresenter: GeneratePasswordPresentable {
    @Published var generatedPassword = PasswordViewModel()

    func update(password: Password) {
        let viewModel = PasswordViewModel(password: password)
        generatedPassword = viewModel
    }

    func handle(error: GeneratorError) { }
}
