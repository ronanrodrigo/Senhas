final class GeneratePasswordControllableFactory {
    private init() { }

    static func make(_ interactor: GeneratePasswordInteractable) -> some GeneratePasswordControllable {
        GeneratePasswordController(interactor: interactor)
    }
}
