# Changelog

All notable changes to the COBOL Language Support extension are documented in this file.

## [0.10.0] - 2020-01-20

- Remove unused parser params in order to simplify the dependencies, remove logic duplication. #132 Thanks @[temanbrcom](https://github.com/temanbrcom)

- Remove unused imports and add constants where math operations are in place #135 Thanks @[sergiuilie](https://github.com/sergiuilie)
- Update dev dependency #134 Thanks @[ishche](https://github.com/ishche)
- Add SKIP statement #133 #138 Thanks @[sergiuilie](https://github.com/sergiuilie)
- Add Mockito library #130 Thanks @[sergiuilie](https://github.com/sergiuilie)
- [WIP] Replace compiler directives removal with moving it to the content area. Change transformation order not to remove syntax errors of not fitting the fixed format. #131 Thanks @[temanbrcom](https://github.com/temanbrcom)
- Provide binding for occurrence delegate #127 Thanks @[temanbrcom](https://github.com/temanbrcom)
- Improve performance of syntax and semantic checks by optimizing grammar #121 Thanks @[sergiuilie](https://github.com/sergiuilie) 
- Provide bindings for service module and partially for the core module. Refactoring the service including the server bootstrap. #127 Thanks @[temanbrcom](https://github.com/temanbrcom)
- Remove a circular dependency in the service module #24 #124 Thanks @[temanbrcom](https://github.com/temanbrcom)
- Add uncaught exception handling for async operations #120 Thanks @[temanbrcom](https://github.com/temanbrcom)
- Add new notification message to make error reporting more precise #123 Thanks @[temanbrcom](https://github.com/temanbrcom)
- Add check for line correctness in order to prevent StringIndexOutOfBoundsException [#119]( Thanks @[temanbrcom](https://github.com/temanbrcom)
- Make Analysis synchronized in order to avoid ConcurrentModificationException [#115](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/115) Thanks @[strekoz-zka](https://github.com/strekoz-zka) 
- Remove unused imports and unnecessary comment [#114](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/114) Thanks @[temanbrcom](https://github.com/temanbrcom)
- Make final field static [#108](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/108) Thanks @[temanbrcom](https://github.com/temanbrcom)

## [0.9.1] - 2019-12-09

#### Added
- JaCoCo in SonarCloud for code measurement

#### Fixed
- Copybook invocation case insensitive
- GIFs in README file

#### Changed
- Updates to README

## [0.9.0] - 2019-11-27

#### Added
- Support for copybooks added to the COBOL Language Support Engine
- Enhanced completion suggestions for variables and paragraphs defined in copybooks
- Enhanced ```find all references``` and ```go to definition``` features within copybooks definition
- Performance improvement:
    - Cache layer running with LRU algorithm
    - Grammar optimization
- Added source type information in the diagnostic object

#### Changed
- Updates to README

## [0.8.3] - 2019-10-16

#### Added
- Syntax highlighting for variables and paragraphs in COBOL file enabled

#### Fixed
- Java automatic check now recognizes all supported JRE/JDK java implementations

## [0.8.2] - 2019-10-09

#### Changed
- Updates to README

## [0.8.1] - 2019-10-02

#### Added
- Automatic check for Java added before launching the LSP server

#### Changed
- Extension name updated

## [0.8.0] - 2019-09-19

- Initial release
