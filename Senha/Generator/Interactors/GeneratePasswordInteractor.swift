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
        let passwordCharacters: [String] = Array(repeating: passwordOptions.separator,
                                                 count: passwordOptions.length)
        var characters: [() -> Character] = []
        if passwordOptions.include.letters {
            characters.append(gateway.lowerCase)
            characters.append(gateway.upperCase)
        }
        if passwordOptions.include.numbers {
            characters.append(gateway.number)
        }
        if passwordOptions.include.symbols {
            characters.append(gateway.symbol)
        }

        let passwordArray = passwordCharacters.reduce([String]()) { (result, separator) -> [String] in
            guard let element = characters.randomElement() else { return result }
            let newChar = String(element())
            return result + [newChar]
        }

        var password: String = ""
        if passwordOptions.include.separators {
            passwordArray.enumerated().forEach { (enumeratedSequence) in
                password = password + enumeratedSequence.element
                if password.count % 4 == 0 {
                    password.removeLast()
                    password += passwordOptions.separator
                }
            }
        } else {
            password = passwordArray.joined()
        }

        presenter.update(with: password)
    }
}
