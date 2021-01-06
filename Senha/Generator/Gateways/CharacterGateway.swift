import Foundation

// sourcery: AutoMock
protocol CharacterGatewayable {
    func lowerCase() -> Character
    func upperCase() -> Character
    func symbol() -> Character
    func number() -> Character
}

final class CharacterGateway: CharacterGatewayable {
    func lowerCase() -> Character {
        "abcdefghjklmnpqrstuvwxyz".randomElement()!
    }

    func upperCase() -> Character {
        "ABCDEFGHJKLMNPQRSTUVWXYZ".randomElement()!
    }

    func symbol() -> Character {
        "!@#$%&*{}|\\:;/?.,=()".randomElement()!
    }

    func number() -> Character {
        "0123456789".randomElement()!
    }
}
