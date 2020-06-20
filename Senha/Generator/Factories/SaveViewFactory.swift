import SwiftUI

final class SaveViewFactory {
    private init() { }

    static func make() -> some View {
        SaveView()
    }
}
