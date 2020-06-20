final class GeneratePasswordPresentableFactory {
    private init() { }

    static func make() -> some GeneratePasswordPresentable {
        GeneratePasswordPresenter()
    }
}
