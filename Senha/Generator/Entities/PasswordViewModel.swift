import Combine

class PasswordViewModel: ObservableObject {
    let password: String

    init(password: String) {
        self.password = password
    }

    init() {
        self.password = ""
    }
}
