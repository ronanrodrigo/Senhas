import SwiftUI

enum GeneratorViewFactory {
    static func make() -> some View {
        let presenter = GeneratePasswordPresentableFactory.make()
        let interactor = GeneratePasswordInteractableFactory.make(presenter)
        let controller = GeneratePasswordControllableFactory.make(interactor)
        return GeneratorView(controller: controller, presenter: presenter)
    }
}
