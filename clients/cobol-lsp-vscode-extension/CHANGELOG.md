# Changelog

All notable changes to the COBOL Language Support extension are documented in this file.

## [0.10.0] - 2020-01-13

- Engineering excellence for core #23 #132 Thanks @[temanbrcom](https://github.com/temanbrcom)

- #23 part of engineering #135 Thanks @[sergiuilie](https://github.com/sergiuilie)

- Update dev dependency #134 Thanks [ishche](

- Add SKIP statement #133 Thanks @[sergiuilie](https://github.com/sergiuilie)

- Add Mockito library #130 Thanks @[sergiuilie](https://github.com/sergiuilie)

- Move compiler directives processing to line reader GH-116 
#131 Thanks @[temanbrcom](https://github.com/temanbrcom)

- Provide binding for occurrence delegate GH-24 #127 Thanks @[temanbrcom](https://github.com/temanbrcom)

- Remove duplicated code by providing default implementation of method #128 #129 Thanks @[temanbrcom](https://github.com/temanbrcom)

- Improve performance #121 Thanks @[sergiuilie](https://github.com/sergiuilie) 

- Engineering Excellence and Dependency Injection #126 Thanks @[temanbrcom](https://github.com/temanbrcom)

- [WIP] Remove a circular dependency in the service module #24 #124 Thanks @[temanbrcom](https://github.com/temanbrcom)

- Add uncaught exception handling for async operations #78 #120 Thanks @[temanbrcom](https://github.com/temanbrcom)

- Engineering excellence #123 Thanks @[temanbrcom](https://github.com/temanbrcom)

- Add check for line correctness in order to prevent StringIndexOutOfBoundsException 
#119 Thanks @[temanbrcom](https://github.com/temanbrcom)

- Make Analysis synchronized in order to avoid ConcurrentModificationException #79 [#115](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/115) Thanks @[strekoz-zka](https://github.com/strekoz-zka) 

- Remove unused imports and unnecessary comment [#114](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/114) Thanks @[temanbrcom](https://github.com/temanbrcom)

- Make final field static too to fix technical debt [#108](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/108) Thanks @[temanbrcom](https://github.com/temanbrcom)

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
