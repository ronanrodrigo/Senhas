@testable import Senha
import XCTest

final class GeneratePasswordControllerTests: XCTestCase {
    private let interactor = GeneratePasswordInteractableMock()
    private lazy var controller = GeneratePasswordController(interactor: interactor)

    func test_givenProperties_whenInitialValues_thenCallInteractorMatchingPasswordOptions() {
        let expectedOptions = PasswordOptions(length: controller.length,
                                              separator: controller.separator,
                                              numbers: controller.includeNumbers,
                                              letters: controller.includeLetters,
                                              symbols: controller.includeSymbols,
                                              separators: controller.includeSeparators)

        XCTAssertEqual(interactor.generateCallCount, 1)
        XCTAssertEqual(interactor.generateArgValues[0], expectedOptions)
    }

    func test_givenProperties_whenChangeAProperty_thenCallInteractorAgain() {
        controller.length = Int.random(in: 0...100)

        XCTAssertEqual(interactor.generateCallCount, 2)
    }

    func test_givenProperties_whenChangeLength_thenCallInteractorMatchingPasswordOptions() {
        let newValue = 13

        controller.length = newValue

        XCTAssertEqual(interactor.generateArgValues.last?.length, newValue)
    }

    func test_givenProperties_whenChangeSeparator_thenCallInteractorMatchingPasswordOptions() {
        let newValue = ":"

        controller.separator = newValue

        XCTAssertEqual(interactor.generateArgValues.last?.separator, newValue)
    }

    func test_givenProperties_whenChangeIncludeNumbers_thenCallInteractorMatchingPasswordOptions() {
        let newValue = !controller.includeNumbers

        controller.includeNumbers = newValue

        XCTAssertEqual(interactor.generateArgValues.last?.include.numbers, newValue)
    }

    func test_givenProperties_whenChangeIncludeLetters_thenCallInteractorMatchingPasswordOptions() {
        let newValue = !controller.includeLetters

        controller.includeLetters = newValue

        XCTAssertEqual(interactor.generateArgValues.last?.include.letters, newValue)
    }

    func test_givenProperties_whenChangeIncludeSymbols_thenCallInteractorMatchingPasswordOptions() {
        let newValue = !controller.includeSymbols

        controller.includeSymbols = newValue

        XCTAssertEqual(interactor.generateArgValues.last?.include.symbols, newValue)
    }

    func test_givenProperties_whenChangeIncludeSeparators_thenCallInteractorMatchingPasswordOptions() {
        let newValue = !controller.includeSeparators

        controller.includeSeparators = newValue

        XCTAssertEqual(interactor.generateArgValues.last?.include.separators, newValue)
    }
}
