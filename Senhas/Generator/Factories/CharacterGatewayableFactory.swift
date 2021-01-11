final class CharacterGatewayableFactory {
    private init() { }

    static func make() -> CharacterGatewayable {
        CharacterGateway()
    }
}
