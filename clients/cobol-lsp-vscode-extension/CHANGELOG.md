# Changelog
All notable changes to the COBOL Language Support extension are documented in this file.
Changelog:

## [0.20.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.19.1...0.20.0) (2021-07-19)

#### Added
* Resolving copybooks with COPY IDMS
* Support for COPY MAID statement
* Semantic analysis for variables in IDMS statements
* Description on hover for condition names (88-level variables)

#### Changed
* Semicolons allowed as statement terminators

#### Fixed
* TOP allowed as a valid variable name

## [0.19.1](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.19.0...0.19.1) (2021-06-25)

#### Changed
* Error message for invalid variable definition
* Analysis exceptions propagated to Extended API responses

#### Fixed
* IDMS statements in conditional blocks
* Access to undefined element if there is no workspace open
* Error on multiline optional paragraphs
* Hover for group items
* Error when loading copybooks with one-byte national encoding

## [0.19.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.18.0...0.19.0) (2021-06-10)

#### Added
* Expanded support for IDMS DML commands
* IDMS DML keyword descriptions
* Validation of variable types on some statements
* Custom TAB button functionality
* Support for compiler directives
* Support for REDEFINES clause
* "Go to definition" support for SQL hosted variables
* Integration with COBOL Control Flow extension
* Global variable support
* Support for Datacom SQLDA and SQLCA implicit fields

#### Changed
* Variable definition shown as documentation
* Analysis works regardless of file extension
* Readme update

#### Fixed
* Compiler options syntax analysis
* Performance issues
* Color scheme issues
* Variable REDEFINES clause bugs
* Parsing of nested programs
* Replacement when replacing or replaced text contains "BY"
* Incorrect processing of URIs provided by Explorer for Endevor
* Incorrect descriptions for some tokens
* Issue with two COPY REPLACING statements in a row

## [0.18.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.17.1...0.18.0) (2021-03-12)

#### Added
* Support for copybooks outside the current workspace
* IDMS DML support for DB statements
* Support for IDMS DML commands

#### Changed
* Hover over variable shows its hierarchy definition
* Readme update

## [0.17.1](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.17.0...0.17.1) (2021-02-10)

#### Added
* COPY IDMS Support

#### Fixed
* False-positive syntax error on SQL keywords used as variables

## [0.17.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.16.1...0.17.0) (2021-02-02)

#### Added
* Syntax analysis for DB2 SQL statements
* Support for DB2 SQL build-in-function keywords
* IDMS DML support for IDMS-CONTROL, SCHEMA and MAP sections
* Support for five additional IDMS DML commands
* Mnemonic name definition support

#### Changed
* Remove prepopulation of settings.json with empty parameters for copybook support
* Java 8 support
* Readme update

#### Fixed
* Improve semantic analysis for variables
* Improve heirarchical variable search
* Semantic analysis stop after XML query
* Semantic error on structure calls
* MAPFAIL semantic error in HANDLE-CONDITION
* Variable recognition fail on ambiguity

## [0.16.1](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.16.0...0.16.1) (2020-12-04)

#### Fixed
* Analysis termination on handled client exceptions
* A syntax error on HANDLE AID CLEAR()

#### Changed
* Readme update

## [0.16.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.15.0...0.16.0) (2020-11-27)

#### Added
* Support for subroutines
* Support for INCLUDE in EXEC SQL for copybooks
* Language features support for sections and predefined variables
* Index variable definition support
* Code snippets for EXEC SQL INCLUDE and EXEC CICS
* JNIENVPTR, JSON and XML special register support
* Setting log level for the server from the client

#### Changed
* Deprecated sections support removed
* "Unsupported file" notification moved into "Problems" console
* Semantic analysis for paragraphs improved
* Copybook coloring might work without syntax analysis
* Document analysis interrupts on closing request
* Readme update

#### Fixed
* Analysis termination on a client exception
* Exception logging after analysis
* Exposing semantic errors from copybooks to the document
* Table call variable recognition
* Many false-positive syntax errors

## [0.15.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.14.0...0.15.0) (2020-09-30)

#### Added
- Syntax analysis for CICS statements
- Telemetry event recording
- CICS variable support

#### Changed
- Showing missing copybook status only on demand
- Copybook downloading queue locked in case of wrong mainframe credentials

#### Fixed
- False-positive spell check for variable names
- Coloring for CICS statements

## [0.14.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.13.0...0.14.0) (2020-09-10)

#### Added

- Outline view support
- Breadcrumb support
- Support for COBOL code snippets
- Copy statement that contains a syntax error underlined

#### Fixed
- Multi-line errors underscoring
- Typo in DIVIDE-REMAINDER code snippets removed
- Program ID with quotes checking
- Incorrect indicator area error message
- Syntax analysis termination with unexpected copy statements

## [0.13.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.12.0...0.13.0) (2020-08-18)

#### Added

- Syntax coloring
- Support for the A and B margin areas
- Support for REPLACING in COPY statements
- Syntax analysis for copybooks

#### Changed

- Disabled copybook analysis for files in the extended source folder
- Entire incorrect variable structure underlined
- 'Go to Definition' for copybook names now opens the file
- Migration from Java 8 to Java 11
- Readme update

#### Fixed

- Closed documents no longer still show errors
- Keywords allowed as copybook names
- Technical tokens removed from completion suggestion for keywords

## [0.12.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.11.1...0.12.0) (2020-07-07)

#### Added

- Support for local copybooks

#### Changed

- Adjust the info message about missing copybooks
- Reduce the number of error/informational messages
- Inform user about wrong credentials and stop sending other MF requests
- Copybooks downloaded from the mainframe are now downloaded to /.c4z/.copybooks in the workspace
- Settings parameter for DSN paths changed
- Updates to README

#### Fixed

- Create a .gitignore file if it doesn't exist
- Fix appearance of log files inside workspace folder
- Fix glob pattern for dynamic registration
- Fix issue with indirect overwrite settings conf for DSN paths
- Fix issues related to unrecognised copybook extensions
- Fix representation of settings.json in Theia

## [0.11.1](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.11.0...0.11.1) (2020-04-23)

### Bug Fixes

* "Change profile" in Quick fix menu when multiple profiles ([#298](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/298)) ([a0e44f9](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/a0e44f914e0bd3c9e0a63274e3d830e4c9db0f45))
* Inform user that the copybook may be nested if downloading faile… ([#303](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/303)) ([666d774](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/666d7744f59dd1e0d0989687c5c087782471091b)), closes [#301](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/301)
* Special characters are causing grammatical errors [#273](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/273) ([#302](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/302)) ([49cdd6c](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/49cdd6c782cb10ead702151cd9bb8e4562697b97))
* Nested copybook failed to be retrieved at didOpen moment [#285](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/285)
* Remove error message when settings for copybooks are not defined [#289](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/289)

## [0.11.0] - 2020-04-09

#### Added
- Automatic copybook retrieval via Zowe connection
- Downloading of nested copybooks
- Copybooks can be downloaded using a quick fix

#### Changed
- Updates to README

#### Fixed
- Copybook extension check
- Address StackOverflow exception during build
- Make document extension check case-insensitive

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
