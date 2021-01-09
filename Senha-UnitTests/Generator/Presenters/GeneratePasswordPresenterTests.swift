@testable import Senha
import XCTest

final class GeneratePasswordPresenterTests: XCTestCase {
    private let presenter = GeneratePasswordPresenter()

    func test_updatePassowrd_thenPropagateToPublisher() {
        let somePassword = "new-pass-word"
        let expectedViewModel = PasswordViewModel(password: somePassword)

        presenter.update(password: somePassword)

        XCTAssertEqual(presenter.passwordViewModel, expectedViewModel)
    }

    func test_handleError_whenInvalidLengthError_thenPropagateInvalidOptionsMessage() {
        let expectedViewModel = PasswordViewModel(errorMessage: L10n.Generator.Error.invalidOptions)

        presenter.handle(error: .invalidLength)

        XCTAssertEqual(presenter.passwordViewModel, expectedViewModel)
    }

    func test_handleError_whenWithoutInclusions_thenPropagateInvalidOptionsMessage() {
        let expectedViewModel = PasswordViewModel(errorMessage: L10n.Generator.Error.invalidOptions)

        presenter.handle(error: .withoutInclusions)

        XCTAssertEqual(presenter.passwordViewModel, expectedViewModel)
    }
}
