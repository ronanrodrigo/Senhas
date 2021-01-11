import XCTest

class Senhas_UITests: XCTestCase {
    override func setUp() {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }

    func testExample() throws {
        snapshot("GeneratorView")
    }
}
