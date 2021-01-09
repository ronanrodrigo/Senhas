![](https://raw.githubusercontent.com/ronanrodrigo/Senha/main/Support/Banner.png?token=AADG67QOYEFPPWKJZVMYOL277IGRM)

[![Coverage](https://img.shields.io/codecov/c/github/ronanrodrigo/Senha?token=1YPUQPH2ZQ)](https://codecov.io/gh/ronanrodrigo/Senha)
[![Bitrise](https://img.shields.io/bitrise/8fa4c5aee88f036f/main?token=tRzI0mOUUp0rnhPyJ4HaXQ)](https://app.bitrise.io/app/8fa4c5aee88f036f)

---

## Setup
Install all dependencies using the setup script as bellow. It will install brew, swiftlint and swiftgen.
```
./Support/setup
```

The build phase contains scripts to generate localizable strings and mocks. But if needed, you can execute those scripts at the terminal.
```
./Support/codegen strings
./Support/codegen mocks
```

## Minimum Requirements
Xcode 12.3
iOS 14.0
