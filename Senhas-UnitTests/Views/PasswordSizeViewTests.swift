@testable import Senhas
import SnapshotTesting
import XCTest

class PasswordSizeViewTests: XCTestCase {
    func test_snapshot() {
        let preview = PasswordSizeView_Previews.previews
        assertSnapshot(matching: preview, as: .image(layout: .device(config: .iPhone8Plus)))
    }
}
