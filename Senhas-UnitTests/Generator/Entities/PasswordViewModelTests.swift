@testable import Senhas
import XCTest

final class PasswordViewModelTests: XCTestCase {
    func test_init_whenOnlyPasswordArgument_thenIsntError() {
        let password = "pass-word"

        let viewModel = PasswordViewModel(password: password)

        XCTAssertEqual(viewModel.password, password)
        XCTAssertEqual(viewModel.errorMessage, "")
        XCTAssertEqual(viewModel.showErrorMessage, false)
    }

    func test_init_whenOnlyErrorArgument_thenIsError() {
        let errorMessage = "Error!"

        let viewModel = PasswordViewModel(errorMessage: errorMessage)

        XCTAssertEqual(viewModel.password, "")
        XCTAssertEqual(viewModel.errorMessage, errorMessage)
        XCTAssertEqual(viewModel.showErrorMessage, true)
    }

    func test_init_whenEmptyArguments_thenIsEmptyViewModel() {
        let viewModel = PasswordViewModel()

        XCTAssertEqual(viewModel.password, "")
        XCTAssertEqual(viewModel.errorMessage, "")
        XCTAssertEqual(viewModel.showErrorMessage, false)
    }
}
