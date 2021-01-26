import SwiftUI

struct GeneratorView<Controller: GeneratePasswordControllable, Presenter: GeneratePasswordPresentable>: View {
    @StateObject private var controller: Controller
    @StateObject private var presenter: Presenter

    init(controller: Controller, presenter: Presenter) {
        self._controller = .init(wrappedValue: controller)
        self._presenter = .init(wrappedValue: presenter)
    }
    
    var body: some View {
        Form {
            Section {
                PasswordGeneratedViewFactory.make(
                    presenter.passwordViewModel)
            }
            Section {
                PasswordSizeViewFactory.make(
                    $controller.length)
                CharInclusionViewFactory.make(
                    $controller.includeNumbers,
                    $controller.includeLetters,
                    $controller.includeSymbols)
            }
            Section {
                SeparatorsViewFactory.make(
                    $controller.includeSeparators,
                    $controller.separator)
            }
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        .navigationBarTitle(Text(L10n.Generator.title))
    }
}

class GeneratorView_Previews: PreviewProvider, GeneratePasswordControllable, GeneratePasswordPresentable {
    var passwordViewModel: PasswordViewModel = .init(password: "123-aBc-789")
    var length: Int = 0
    var includeNumbers: Bool = true
    var includeLetters: Bool = true
    var includeSymbols: Bool = false
    var includeSeparators: Bool = true
    var separator: String = "-"
    func update(password: Password) {}
    func handle(error: GeneratorError) {}

    static var previews: some View {
        let preview = GeneratorView_Previews()
        return GeneratorView(controller: preview, presenter: preview)
    }
}
