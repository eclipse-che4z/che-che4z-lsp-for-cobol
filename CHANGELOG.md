# Changelog
All notable changes to the COBOL Language Support extension are documented in this file.

## [0.14.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.13.0...0.14.0) (2020-09-10)

### Bug Fixes
* Allow multi-line errors underscoring GH-486 ([b79bd82](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/b79bd82a1446e22316d3b4aec03e1cd9b1159a88)), closes [#486](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/486)
* Fix a typo in DIVIDE-REMAINDER code snippets ([00cd27d](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/00cd27d1e63369d6695be05654bad7fdca4aa7a7))
* Fix checking program ID with quotes [#477](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/477) ([2c247ff](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/2c247fff1766262a3651a8fa9a4e587b54af3921))
* Fix incorrect indicator area error message [#494](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/494) ([5a6501e](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/5a6501ead0feffb4038ce67424b04d2e28b82c21))
* Fix syntax analysis termination with unexpected copy statements GH-464 ([6b0ad8e](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/6b0ad8e5eabbd4f97edaa625184358255ae3e1f6)), closes [#464](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/464)

### Features
* Outline view support [#481](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/481) ([16ba495](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/16ba495c5226575a2d530a3c1bc9a9dec156d2d5))
* Provide default COBOL code snippets [#484](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/484) ([c98df71](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/c98df710f945cc25e849563e2f89a864db8d06c7))
* Underscore the copy statement if it contains a syntax error [#450](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/450) ([082bbf7](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/082bbf7765158ea4bc54ac31b41972c0938dbcc4))

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
