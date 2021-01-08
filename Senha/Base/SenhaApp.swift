import SwiftUI

@main
struct SenhaApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                GeneratorViewFactory.make()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
