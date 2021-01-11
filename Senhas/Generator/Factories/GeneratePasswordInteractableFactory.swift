final class GeneratePasswordInteractableFactory {
    private init() { }
    
    static func make(_ presenter: GeneratePasswordMutablePresentable) -> GeneratePasswordInteractable {
        let gateway = CharacterGatewayableFactory.make()
        return GeneratePasswordInteractor(presenter: presenter,
                                          gateway: gateway)
    }
}
