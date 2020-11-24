# Changelog
All notable changes to the COBOL Language Support extension are documented in this file.

## [0.16.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.15.0...0.16.0) (2020-11-26)

### Bug Fixes
* Fix syntax error on copybook name in quotes [#620](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/620)
* Fix analysis stop on a client exception [#643](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/643)
* Fix exception logging after analysis [#546](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/546)
* Fix exception on not formatted line [#605](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/605)
* Fix exposing semantic errors from copybooks to the document [#652](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/652)
* Fix syntax error on ERASE in CICS SEND statement [#617](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/617)
* Fix syntax error on SKIP directives [#630](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/630)
* Fix syntax error on VALUE 77 definition [#611](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/611)
* Fix table call variable recognition [#543](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/543)
* Fix syntax error on TITLE statement [#595](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/595)
* Fix variable usage recognition in the call statement [#550](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/550)
* Add missing RES compiler options [#631](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/631)
* Allow "CICS" to be a variable name [#597](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/597)
* Allow FILLER for all level definitions [#673](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/673)
* Move unsupported file notification into "Problems" console [#173](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/173)
* Remove deprecated COMMUNICATION SECTION support [#589](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/589)
* Remove deprecated sections support [#614](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/614)

### Features
* Introduce support for locally present subroutines [#582](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/582)
* Support INCLUDE in EXEC SQL for copybooks [#480](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/480)
* Add language features support for sections [#502](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/502)
* Improve semantic analysis for paragraphs [#526](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/526)
* Introduce predefined EIB variables support [#527](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/527)
* Add "Go To Definition" and "References" for the predefined variables [#527](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/527)
* Make copybook coloring work without analysis [#654](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/654)
* Introduce completion suggestions for predefined variables [#527](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/527)
* Interrupt the document analysis on closing request [#546](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/546)
* Introduce index variable definition support [#358](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/358)
* Introduce setting log level for the server from the client [#10](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/10)
* Introduce termination requests support [#590](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/590)
* Add code snippets for EXEC SQL INCLUDE and EXEC CICS [#584](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/584)
* Add JNIENVPTR special register support [#479](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/479)
* Add JSON special register support [#479](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/479)
* Add XML special registers [#479](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/479)

## [0.15.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.14.0...0.15.0) (2020-09-30)

### Bug Fixes
* Correct coloring for CICS statements [#469](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/469)
* Disable the spellchecker for variables [#478](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/478)

### Features
* Add syntax analysis for CICS statements [#469](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/469)
* Introduce telemetry events recording [#472](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/472)
* Lock copybook download queue in case of wrong mainframe credentials [#488](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/488)
* Show missing copybook status only on demand [#489](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/489)
* Add CICS variable support [#520](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/520)

## [0.14.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.13.0...0.14.0) (2020-09-10)

### Bug Fixes
* Allow multi-line errors underscoring GH-486 [#486](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/486)
* Fix a typo in DIVIDE-REMAINDER code snippets
* Fix checking program ID with quotes [#477](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/477)
* Fix incorrect indicator area error message [#494](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/494)
* Fix syntax analysis termination with unexpected copy statements GH-464 [#464](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/464)

### Features
* Outline view support [#481](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/481)
* Breadcrumb support [#487](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/487)
* Provide default COBOL code snippets [#484](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/484)
* Underscore the copy statement if it contains a syntax error [#450](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/450) 

## [0.13.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.12.0...0.13.0) (2020-08-18)

### Bug Fixes

* Dispose diagnostic messages when user closes the document #434
* Allow keywords as copybook names #304
* Remove technical tokens from completion suggestion for keywords #348

### Features

* Disable copybook analysis for extended documents #448
* Add support for Area A&B #437
* Add margin A check for FD and SD level indicators #440
* Performance improvement #425
* Syntax coloring support #423
* Add REPLACING support for COPY statements #335
* Add syntax analysis for copybooks #220
* Show syntax and semantic errors in the appropriate files #351
* Underline the entire incorrect variable structure #321
* Add 'Go to Definition' support for copybook names to open the files #387
* Java 11 migration #422

## [0.12.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.11.1...0.12.0) (2020-07-07)

### Bug Fixes

* Avoid many error messages for copybook downloading #384 (8f3ab6f)
* Change log archive path pattern to relate on the user directory #307 (9c6c882)
* Create a .gitignore file if it doesn't exist #329 (40ca9f7)
* Fix glob pattern for dynamic registration #355 (7117683)
* Fix issue related to copybook with extensions that were not recognized as valid URIs GH-355 (39169e2), closes #355
* Fix issue with indirect overwrite settings conf for dsn paths (1afe039)
* Fix representation of settings.json in Theia #393 (b4cd52b)
* Hide 'no errors found' message GH-312 (6f19c9b), closes #312
* Remove popup message, track event in log file #318 (ba33f88)
* Unexpected Java 8 expected error message #333 (#396) (9c224a6)
* Update activation event #331 (ac65f46)
* Use sync APIs to create folder and write to file to avoid unexpected behavior (17b8908)

### Features

* Adjust the info message about missing copybooks #391 (54a3386)
* Fetch copybooks without .dep files GH-327 (098f4bc), closes #327
* Inform user about wrong credentials and stop sending other MF requests (0dc0548), closes #237
* Introduce dynamic registration for watchers GH-355 (0358b95), closes #355
* Retrieve local copybooks if they exist GH-327 (7d3a068), closes #327

## [0.11.1](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.11.0...0.11.1) (2020-04-23)

#### Bug Fixes

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
