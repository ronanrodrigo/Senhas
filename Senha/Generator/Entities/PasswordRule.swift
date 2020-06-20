struct PasswordOptions {
    let length: Int
    let separator: String
    let include: Include

    struct Include {
        let numbers: Bool
        let letters: Bool
        let symbols: Bool
        let separators: Bool
    }
}
