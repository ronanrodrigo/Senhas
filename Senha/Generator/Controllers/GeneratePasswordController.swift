import Combine
import Foundation

protocol GeneratePasswordControllable: ObservableObject {
    var length: Int { get set }
    var includeNumbers: Bool { get set }
    var includeLetters: Bool { get set }
    var includeSymbols: Bool { get set }
    var includeSeparators: Bool { get set }
    var separator: String { get set }
}

final class GeneratePasswordController: GeneratePasswordControllable {
    private let interactor: GeneratePasswordInteractable
    private var cancellable: Cancellable?
    @Published var length: Int = 25
    @Published var includeNumbers: Bool = true
    @Published var includeLetters: Bool = true
    @Published var includeSymbols: Bool = false
    @Published var includeSeparators: Bool = true
    @Published var separator: String = "-"

    init(interactor: GeneratePasswordInteractable) {
        self.interactor = interactor
        sinkOptions()
    }

    private func sinkOptions() {
        let includes = Publishers.CombineLatest4(
            $includeNumbers,
            $includeLetters,
            $includeSymbols,
            $includeSeparators
        )
        .map { combinedValues -> PasswordOptions.Include in
            .init(numbers: combinedValues.0,
                  letters: combinedValues.1,
                  symbols: combinedValues.2,
                  separators: combinedValues.3)
        }

        let otherOptionsWithIncludes = Publishers.CombineLatest3(
            includes,
            $length.debounce(for: 0.3, scheduler: RunLoop.main),
            $separator
        )
        .map { combinedValues -> PasswordOptions in
            let passwordInclude = combinedValues.0
            let passwordOptions = PasswordOptions(
                length: combinedValues.1,
                separator: combinedValues.2,
                include: passwordInclude)
            return passwordOptions
        }

        cancellable = otherOptionsWithIncludes.sink { [weak self] passwordOptions in
            self?.interactor.generate(with: passwordOptions)
        }
    }
}
