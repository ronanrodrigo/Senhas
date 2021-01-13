enum GeneratePasswordControllableFactory {
    static func make(_ interactor: GeneratePasswordInteractable) -> some GeneratePasswordControllable {
        GeneratePasswordController(interactor: interactor)
    }
}
