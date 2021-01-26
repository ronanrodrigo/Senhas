@testable import Senhas
import SnapshotTesting
import XCTest

class GeneratorViewTests: XCTestCase {
    func test_snapshot() {
        let preview = GeneratorView_Previews.previews
        assertSnapshot(matching: preview, as: .image(layout: .device(config: .iPhone8Plus)))
    }
}
