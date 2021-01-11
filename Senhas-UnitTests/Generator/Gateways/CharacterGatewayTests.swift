@testable import Senhas
import XCTest

final class CharacterGatewayTests: XCTestCase {
    private let gateway = CharacterGateway()

    func test_letter_thenReturnSingleChar() {
        let letter = gateway.letter()

        XCTAssertEqual(letter.count, 1)
    }

    func test_letter_thenReturnLetter() {
        let letter = gateway.letter()

        XCTAssertEqual(letter.first?.isLetter, true)
    }

    func test_number_thenReturnSingleChar() {
        let number = gateway.number()

        XCTAssertEqual(number.count, 1)
    }

    func test_number_thenReturnNumber() {
        let number = gateway.number()

        XCTAssertEqual(number.first?.isNumber, true)
    }

    func test_symbol_thenReturnSingleChar() {
        let symbol = gateway.symbol()

        XCTAssertEqual(symbol.count, 1)
    }

    func test_symbol_thenReturnSymbol() {
        let symbol = gateway.symbol()

        XCTAssertEqual(symbol.first?.isNotLetterOrNumber, true)
    }
}
