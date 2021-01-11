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

struct GeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratorViewFactory.make()
    }
}
