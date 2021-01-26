@testable import Senhas
import SnapshotTesting
import XCTest

class CharInclusionViewTests: XCTestCase {
    func test_snapshot() {
        let preview = CharInclusionView_Previews.previews
        assertSnapshot(matching: preview, as: .image(layout: .device(config: .iPhone8Plus)))
    }
}
