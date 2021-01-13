enum GeneratePasswordPresentableFactory {
    static func make() -> some GeneratePasswordPresentable {
        GeneratePasswordPresenter()
    }
}
