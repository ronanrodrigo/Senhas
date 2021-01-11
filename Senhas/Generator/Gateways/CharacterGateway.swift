import Foundation

/// @mockable
protocol CharacterGatewayable {
    func letter() -> String
    func symbol() -> String
    func number() -> String
}

final class CharacterGateway: CharacterGatewayable {
    func letter() -> String {
        let smallCases = "abcdefghjklmnpqrstuvwxyz"
        let upperCases = "ABCDEFGHJKLMNPQRSTUVWXYZ"
        let char = (smallCases + upperCases).randomElement()!
        return String(char)
    }

    func symbol() -> String {
        let char = "!@#$%&*{}|\\:;/?.,=()".randomElement()!
        return String(char)
    }

    func number() -> String {
        let char = "0123456789".randomElement()!
        return String(char)
    }
}
