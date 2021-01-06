// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

@testable import Senha

// swiftlint:disable all
class CharacterGatewayableMock: CharacterGatewayable {
    var lowerCaseCallsCount = 0
    var lowerCaseCalled: Bool { return lowerCaseCallsCount > 0 }
    var lowerCaseReturnValue: Character!
    var lowerCaseClosure: (() -> Character)?
    func lowerCase() -> Character {
        lowerCaseCallsCount += 1
        return lowerCaseClosure.map({ $0() }) ?? lowerCaseReturnValue
    }
    var upperCaseCallsCount = 0
    var upperCaseCalled: Bool { return upperCaseCallsCount > 0 }
    var upperCaseReturnValue: Character!
    var upperCaseClosure: (() -> Character)?
    func upperCase() -> Character {
        upperCaseCallsCount += 1
        return upperCaseClosure.map({ $0() }) ?? upperCaseReturnValue
    }
    var symbolCallsCount = 0
    var symbolCalled: Bool { return symbolCallsCount > 0 }
    var symbolReturnValue: Character!
    var symbolClosure: (() -> Character)?
    func symbol() -> Character {
        symbolCallsCount += 1
        return symbolClosure.map({ $0() }) ?? symbolReturnValue
    }
    var numberCallsCount = 0
    var numberCalled: Bool { return numberCallsCount > 0 }
    var numberReturnValue: Character!
    var numberClosure: (() -> Character)?
    func number() -> Character {
        numberCallsCount += 1
        return numberClosure.map({ $0() }) ?? numberReturnValue
    }
}
