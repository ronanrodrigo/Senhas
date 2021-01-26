@testable import Senhas
import SnapshotTesting
import XCTest

class PasswordGeneratedViewTests: XCTestCase {
    func test_snapshot() {
        let preview = PasswordGeneratedView_Previews.previews
        assertSnapshot(matching: preview, as: .image(layout: .device(config: .iPhone8Plus)))
    }
}
