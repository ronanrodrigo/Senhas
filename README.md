![](https://raw.githubusercontent.com/ronanrodrigo/Senhas/main/Support/Banner.png?token=AADG67QOYEFPPWKJZVMYOL277IGRM)

[![Coverage](https://img.shields.io/codecov/c/github/ronanrodrigo/Senhas?token=1YPUQPH2ZQ)](https://codecov.io/gh/ronanrodrigo/Senhas)
[![Bitrise](https://img.shields.io/bitrise/8fa4c5aee88f036f/main?token=tRzI0mOUUp0rnhPyJ4HaXQ)](https://app.bitrise.io/app/8fa4c5aee88f036f)
[![Codebeat](https://codebeat.co/badges/f497cf11-7c7a-43f5-a82a-932c2e70f5cf)](https://codebeat.co/projects/github-com-ronanrodrigo-senha-main)

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
