import Combine

struct PasswordViewModel: Equatable {
    let password: String
    let errorMessage: String
    let showErrorMessage: Bool

    init() {
        self.password = ""
        self.errorMessage = ""
        self.showErrorMessage = false
    }

    init(password: String) {
        self.password = password
        self.errorMessage = ""
        self.showErrorMessage = false
    }

    init(errorMessage: String) {
        self.password = ""
        self.errorMessage = errorMessage
        self.showErrorMessage = true
    }
}
