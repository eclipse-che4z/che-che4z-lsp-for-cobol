# Changelog

All notable changes to the COBOL Language Support extension are documented in this file.

## [0.x.x] - TBD
- Dependency file should contain 8 char max copybook name [#175](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/175)
- No escape chars in filename [#228](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/228) Thanks @[zacanbrcom](https://github.com/zacanbrcom)
- Finalize LRU Algorithm [#227](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/227) Thanks @[sergiuilie](https://github.com/sergiuilie)
- Consume user settings in Copybook Service [#221](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/221) Thanks @[zacanbrcom](https://github.com/zacanbrcom)
- Modify dep file creation/update process [#209](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/209) Thanks @[zacanbrcom](https://github.com/zacanbrcom)
- Retrieve settings.json at initialize [#207](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/207) Thanks @[sergiuilie](https://github.com/sergiuilie)
- Introduce Code Action to Resolve Copybooks [#198](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/198) Thanks @[temanbrcom](https://github.com/temanbrcom)
- Make CobolVisitor constructor-configurable to simplify DI [#205](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/205) Thanks @[temanbrcom](https://github.com/temanbrcom)
- Fix copybook extension check [#203](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/203) Thanks @[grianbrcom](https://github.com/grianbrcom)
- Remove error listener from CobolVisitor to simpily DI [#201](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/201) Thanks @[temanbrcom](https://github.com/temanbrcom)
- Refactor MyTextDocumentService::observerCallback [#200](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/200) Thanks @[grianbrcom](https://github.com/grianbrcom)
- Remove unused COBOL dialect support [#169](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/169) Thanks @[temanbrcom](https://github.com/temanbrcom)
- Make document extension check case-insensitive [#167](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/167) Thanks @[temanbrcom](https://github.com/temanbrcom)
- Remove copybook name from the variable list if copybook is missing [#190](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/190) Thanks @[temanbrcom](https://github.com/temanbrcom)
- Introduce autocomplete for copybooks [#189](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/189) Thanks @[abdrabrcom](https://github.com/abdrabrcom)
- Remove unused COBOL format support [#188](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/188) Thanks @[temanbrcom](https://github.com/temanbrcom)
- Enable config file synchronization between the client and server [#185](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/185) Thanks @[sergiuilie](https://github.com/sergiuilie)
- Update `extension.ts` with correct language ID [#176](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/176) Thanks @[sergiuilie](https://github.com/sergiuilie)
- Remove remarks support [#174](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/174) Thanks @[temanbrcom](https://github.com/temanbrcom)
- Introduce a mechanism on the server to generate a `cobdep` folder that contains dependency files for each COBOL file opened in the IDE that contains copybooks [#172](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/172) Thanks @[zacanbrcom](https://github.com/zacanbrcom)

## [0.10.1] - 2020-02-12

- Add maximum Java heap size argument to `extension.ts` [#194](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/194) Thanks @[sergiuilie](https://github.com/sergiuilie)

## [0.10.0] - 2020-01-28

- Increase code coverage for `lsp-core-domain` module to 76.8% [#111](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/111) Thanks @[zacanbrcom](https://github.com/zacanbrcom)
- Make preprocessor parts stateless to simplify dependency injection [#153](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/153) Thanks @[temanbrcom](https://github.com/temanbrcom)
- Add file system watcher for copybooks to invalidate the cache and run the syntax and semantic analysis for all the registered documents if there are any changes in the copybook files or the directory. [#152](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/152) Thanks @[temanbrcom](https://github.com/temanbrcom)
- Remove unused parser params in order to simplify the dependencies, remove logic duplication. [#136](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/136) Thanks @[temanbrcom](https://github.com/temanbrcom)
- Remove unused imports and add constants where math operations are in place [#135](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/135) Thanks @[sergiuilie](https://github.com/sergiuilie)
- Update dev dependency [#134](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/134) Thanks @[ishche](https://github.com/ishche)
- Add SKIP statement [#133](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/133) and [#138](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/138) Thanks @[sergiuilie](https://github.com/sergiuilie)
- Add Mockito library [#130](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/130) Thanks @[sergiuilie](https://github.com/sergiuilie)
- Replace compiler directives removal with moving it to the content area. Change transformation order not to remove syntax errors of not fitting the fixed format. [#131](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/131) Thanks @[temanbrcom](https://github.com/temanbrcom)
- Provide binding for occurrence delegate [#127](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/127) Thanks @[temanbrcom](https://github.com/temanbrcom)
- Improve performance of syntax and semantic checks by optimizing grammar [#121](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/121) Thanks @[sergiuilie](https://github.com/sergiuilie)
- Provide bindings for service module and partially for the core module. Refactoring the service including the server bootstrap. [#127](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/127) Thanks @[temanbrcom](https://github.com/temanbrcom)
- Remove a circular dependency in the service module [#124](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/124) Thanks @[temanbrcom](https://github.com/temanbrcom)
- Add uncaught exception handling for async operations [#120](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/120) Thanks @[temanbrcom](https://github.com/temanbrcom)
- Add new notification message to make error reporting more precise [#123](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/123) Thanks @[temanbrcom](https://github.com/temanbrcom)
- Add check for line correctness in order to prevent StringIndexOutOfBoundsException [#119](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/119) Thanks @[temanbrcom](https://github.com/temanbrcom)
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
