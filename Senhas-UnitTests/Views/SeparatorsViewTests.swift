@testable import Senhas
import SnapshotTesting
import XCTest

class SeparatorsViewTests: XCTestCase {
    func test_snapshot() {
        let preview = SeparatorsView_Previews.previews
        assertSnapshot(matching: preview, as: .image(layout: .device(config: .iPhone8Plus)))
    }
}
