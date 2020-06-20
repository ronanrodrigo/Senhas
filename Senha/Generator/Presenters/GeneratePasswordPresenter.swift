import Combine

protocol GeneratePasswordMutablePresentable {
    func update(with password: Password)
}

protocol GeneratePasswordPresentable: ObservableObject, GeneratePasswordMutablePresentable {
    var generatedPassword: PasswordViewModel { get }
}

final class GeneratePasswordPresenter: GeneratePasswordPresentable {
    @Published var generatedPassword = PasswordViewModel()

    func update(with password: Password) {
        let viewModel = PasswordViewModel(password: password)
        generatedPassword = viewModel
    }
}
