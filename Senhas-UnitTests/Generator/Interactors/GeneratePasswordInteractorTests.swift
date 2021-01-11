@testable import Senhas
import XCTest

final class GeneratePasswordInteractorTests: XCTestCase {
    private let presenter = GeneratePasswordMutablePresentableMock()
    private let gateway = CharacterGatewayableMock()
    private lazy var interactor = GeneratePasswordInteractor(presenter: presenter,
                                                             gateway: gateway)

    override func setUp() {
        super.setUp()
        gateway.letterHandler = { .init("aBcDe".randomElement()!) }
        gateway.numberHandler = { .init("12345".randomElement()!) }
        gateway.symbolHandler = { .init("$!@#%".randomElement()!) }
    }

    func test_givenPasswordOptions_whenZeroLength_thenSendErrorToPresenter() {
        interactor.generate(with: .zeroLength)

        XCTAssertEqual(presenter.handleArgValues, [.invalidLength])
    }

    func test_givenPasswordOptions_whenLengthIsLowerThanThree_thenSendErrorToPresenter() {
        interactor.generate(with: .twoLength)

        XCTAssertEqual(presenter.handleArgValues, [.invalidLength])
    }

    func test_givenPasswordOptions_whenNegativeLength_thenSendErrorToPresenter() {
        interactor.generate(with: .negativeLength)

        XCTAssertEqual(presenter.handleArgValues, [.invalidLength])
    }

    func test_givenPasswordOptions_whenInvalidLength_thenDontUpdatePresenter() {
        interactor.generate(with: .negativeLength)
        interactor.generate(with: .zeroLength)
    }

    func test_givenPasswordOptions_whenLettersOnly_thenUpdatePresenterWithLettersOnlyPasword() {
        interactor.generate(with: .lettersOnly)

        Assert(at: presenter.updateArgValues, allCharacters: \.isLetter)
    }

    func test_givenPasswordOptions_whenIncluesSomething_thenUpdatePresenterWithSameLengthPassword() {
        interactor.generate(with: .lettersOnly)

        XCTAssertEqual(presenter.updateArgValues[0].count, PasswordOptions.lettersOnly.length)
    }

    func test_givenPasswordOptions_whenNumbersOnly_thenUpdatePresenterWithLettersOnlyPasword() {
        interactor.generate(with: .numbersOnly)

        XCTAssertEqual(presenter.updateCallCount, 1)
        Assert(at: presenter.updateArgValues, allCharacters: \.isNumber)
    }

    func test_givenPasswordOptions_whenSymbolsOnly_thenUpdatePresenterWithLettersOnlyPasword() {
        interactor.generate(with: .symbolsOnly)

        XCTAssertEqual(presenter.updateCallCount, 1)
        Assert(at: presenter.updateArgValues, allCharacters: \.isNotLetterOrNumber)
    }

    func test_givenPasswordOptions_whenIncludeSeparator_thenUpdatePresenterWithSeparatedPassword() {
        interactor.generate(with: .includeSeparator)

        XCTAssertEqual(presenter.updateCallCount, 1)
        XCTAssertTrue(presenter.updateArgValues[0].contains(PasswordOptions.includeSeparator.separator))
    }

    func test_givePasswordOptions_withAllInclusions_thenUpdatePresenterWithAllInclusionsPassword() {
        interactor.generate(with: .allInclusions)

        XCTAssertEqual(presenter.updateCallCount, 1)
        AssertContainsAllInclusions(at: presenter.updateArgValues)
    }

    func test_givePasswordOptions_withoutInclusions_thenHandleErrorAtPresenter() {
        interactor.generate(with: .withoutInclusions)

        XCTAssertEqual(presenter.handleArgValues, [.withoutInclusions])
    }
}

extension Character {
    var isNotLetterOrNumber: Bool {
        !(isNumber || isLetter)
    }
}

extension XCTestCase {
    func Assert(at passwords: [Password],
                allCharacters allCharactersKeyPath: KeyPath<Character, Bool>,
                file: StaticString = #file,
                line: UInt = #line) {
        if passwords.isEmpty {
            XCTFail("Empty password list", file: file, line: line)
        }
        for password in passwords {
            let filterLetters = password.filter { $0[keyPath: allCharactersKeyPath] }
            XCTAssertEqual(password,
                           filterLetters,
                           file: file,
                           line: line)
        }

    }

    func AssertContainsAllInclusions(at passwords: [Password],
                                     file: StaticString = #file,
                                     line: UInt = #line) {
        if passwords.isEmpty {
            XCTFail("Empty password list", file: file, line: line)
        }
        for password in passwords {
            let containsLetters = password.contains { $0.isLetter }
            let containsNumbers = password.contains { $0.isNumber }
            let containsSymbols = password.contains { $0.isNotLetterOrNumber }

            XCTAssertTrue(containsLetters, "Password doesn't contains Letters", file: file, line: line)
            XCTAssertTrue(containsNumbers, "Password doesn't contains Numbers", file: file, line: line)
            XCTAssertTrue(containsSymbols, "Password doesn't contains Symbols", file: file, line: line)
        }
    }
}

extension PasswordOptions {
    static var zeroLength: Self { .init(
        length: 0,
        separator: "",
        numbers: false,
        letters: false,
        symbols: false,
        separators: false
    ) }

    static var twoLength: Self { .init(
        length: 2,
        separator: "",
        numbers: false,
        letters: false,
        symbols: false,
        separators: false
    ) }

    static var negativeLength: Self { .init(
        length: -1,
        separator: "",
        numbers: false,
        letters: false,
        symbols: false,
        separators: false
    ) }

    static var lettersOnly: Self { .init(
        length: 10,
        separator: "",
        numbers: false,
        letters: true,
        symbols: false,
        separators: false
    ) }

    static var numbersOnly: Self { .init(
        length: 10,
        separator: "",
        numbers: true,
        letters: false,
        symbols: false,
        separators: false
    ) }

    static var symbolsOnly: Self { .init(
        length: 10,
        separator: "",
        numbers: false,
        letters: false,
        symbols: true,
        separators: false
    ) }

    static var allInclusions: Self { .init(
        length: 5,
        separator: "",
        numbers: true,
        letters: true,
        symbols: true,
        separators: false
    ) }

    static var withoutInclusions: Self { .init(
        length: 5,
        separator: "",
        numbers: false,
        letters: false,
        symbols: false,
        separators: false
    ) }

    static var includeSeparator: Self { .init(
        length: 5,
        separator: "-",
        numbers: true,
        letters: false,
        symbols: false,
        separators: true
    ) }

    init(length: Int,
         separator: String,
         numbers: Bool,
         letters: Bool,
         symbols: Bool,
         separators: Bool) {
        self.init(length: length,
                  separator: separator,
                  include: Include(numbers: numbers,
                                   letters: letters,
                                   symbols: symbols,
                                   separators: separators))
    }
}
