import Foundation

protocol GeneratePasswordInteractable {
    func generate(with passwordOptions: PasswordOptions)
}

final class GeneratePasswordInteractor: GeneratePasswordInteractable {
    private let presenter: GeneratePasswordMutablePresentable
    private let gateway: CharacterGatewayable

    init(presenter: GeneratePasswordMutablePresentable,
         gateway: CharacterGatewayable) {
        self.presenter = presenter
        self.gateway = gateway
    }

    func generate(with passwordOptions: PasswordOptions) {
        guard passwordOptions.length > 2 else {
            return presenter.handle(error: .invalidLength)
        }
        let containsInclusion = passwordOptions.include.letters ||
            passwordOptions.include.numbers ||
            passwordOptions.include.symbols
        guard containsInclusion else {
            return presenter.handle(error: .withoutInclusions)
        }

        var charactersProviders = makeCharacterProviders(passwordOptions)
        var passwordArray: [String] = []
        while passwordArray.count < passwordOptions.length {
            if charactersProviders.isEmpty {
                charactersProviders = makeCharacterProviders(passwordOptions)
            }
            guard let characterProvider = charactersProviders.popLast() else { break }
            passwordArray.append(characterProvider())
        }

        let generatedPassword: String
        if passwordOptions.include.separators {
            generatedPassword = addSeparators(passwordArray, passwordOptions)
        } else {
            generatedPassword = passwordArray.joined()
        }

        presenter.update(password: generatedPassword)
    }

    private func makeCharacterProviders(_ passwordOptions: PasswordOptions) -> [() -> String] {
        var mutableCharactersList: [() -> String] = []
        if passwordOptions.include.letters {
            mutableCharactersList.append(gateway.letter)
        }
        if passwordOptions.include.numbers {
            mutableCharactersList.append(gateway.number)
        }
        if passwordOptions.include.symbols {
            mutableCharactersList.append(gateway.symbol)
        }
        return mutableCharactersList.shuffled()
    }

    private func addSeparators(_ passwordArray: [String], _ passwordOptions: PasswordOptions) -> String{
        var separatedPassword = ""
        passwordArray.forEach {
            separatedPassword += $0
            if separatedPassword.count % 4 == 0 {
                separatedPassword.removeLast()
                separatedPassword += passwordOptions.separator
            }
        }
        return separatedPassword
    }
}
