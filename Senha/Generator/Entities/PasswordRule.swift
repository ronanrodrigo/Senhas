struct PasswordOptions: Equatable {
    let length: Int
    let separator: String
    let include: Include

    struct Include: Equatable {
        let numbers: Bool
        let letters: Bool
        let symbols: Bool
        let separators: Bool
    }
}
