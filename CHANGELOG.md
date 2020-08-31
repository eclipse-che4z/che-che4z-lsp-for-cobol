# [0.12.0](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/compare/0.12.0-alpha.1...0.12.0) (2020-08-31)


### Bug Fixes

* Allow keyword as a copybook name [#304](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/304) ([c526007](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/c5260076fb66b30bdef759d0e83f848ed3c8402c))
* cleanup diagnostic messages when did_close event is triggered [#385](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/385) ([#434](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/434)) ([0d04d8a](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/0d04d8ab1378f53c8d2998e16de210308b6a316b))
* disable copybook analysis only on extended document ([#452](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/452)) ([bf497cf](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/bf497cfd4431f8d1073c88eda669925f145d8a3c))
* Fix syntax analysis termination with unexpected copy statements GH-464 ([6b0ad8e](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/6b0ad8e5eabbd4f97edaa625184358255ae3e1f6)), closes [#464](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/464)
* Make COPY accept only one REPLACING with multiple patterns [#335](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/335) ([ff12181](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/ff1218129ce6538128f8732ddbff068f91a86e3e))
* Make variable usage processing left-to-right GH-220 ([2a73c38](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/2a73c38ef05a67ee856f2604784196b16b4b9bd3)), closes [#220](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/220)
* Remove techincal tokens from keyword completion suggestions [#348](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/348) ([12ad47a](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/12ad47aaf984d714f2547786a2707cc9aceffba1))


### Features

* Add content areas A and B support - issue [#12](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/12) ([e68df24](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/e68df24b27fec0594aa19189ec357ac51a236b27))
* Disable copybook analysis for extended documents [#441](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/441) ([#448](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/448)) ([af9116d](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/af9116d8c304e246369cea5485deefd168958e16))
* improve grammar performance ([604dea1](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/604dea11ddc82135b96e25622209ddd72c012269))
* Introduce full document syntax analysis GH-220 ([fa0db94](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/fa0db94c2366d55086a675cb603cbac4a523aa1b)), closes [#220](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/220)
* Introduce Go To Definition for copybooks [#387](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/387) ([4fc5ab4](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/4fc5ab4c5119fb1dfb29af11df39b19a4f5f6504))
* Introduce replacing support GH-335 ([5a89002](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/5a89002df6587955c953ec002998f2bf98b5a57b)), closes [#335](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/335)
* Outline view support [#481](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/481) ([16ba495](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/16ba495c5226575a2d530a3c1bc9a9dec156d2d5))
* Show rulers in editor ([29929be](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/29929be47f3b57b8998a9d7a4876097a50fcdfac))
* Show rulers in editor ([70f9517](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/70f95178191154b9c1bd1b1ef971a004c9118644))
* Show syntax and semantic errors in copybooks GH-351 ([72f3cfe](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/72f3cfecdaaeca9b896b411f7f0b163097a0f793)), closes [#351](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/351)
* Support copybook usages everywhere GH-352 ([ee1f38a](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/ee1f38ae68b2ab6d83ad412f00883abf7237ddb8)), closes [#352](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/352)
* Syntax coloring support ([8fa00c5](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/8fa00c50335f72456bc201b56341ccf9ddea09e6)), closes [#421](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/421)
* Syntax coloring support ([efe8e5c](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/efe8e5c147efdf597a9c165b8882166e364e2553)), closes [#421](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/421)
* Underline the entire incorrect variable structure [#321](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/321) ([36bda6a](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/36bda6abc1e1b8eb0330d975ba044096249d528a))
* Underscore the copy statement if it contains a syntax error [#450](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/450) ([082bbf7](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/082bbf7765158ea4bc54ac31b41972c0938dbcc4))


### Performance Improvements

* Add position shifts for compiler directives ([c97770d](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/c97770d1275f7fdefd2eda796290244137cb8764))
* Adjust copybook position shifts on mapping ([d3d4404](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/d3d44049fc9b534046c0d3b1efe42db4ef02b26c))
* Drop unnecesary text writing operations ([149b5d9](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/149b5d96d45183d0265fba00d284ef84a2d10e4c))
* Fix collecting unnecessary positions ([7abf90e](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/7abf90e5f70e00a855e92bc8475fe8907f31ffff))
* Move document cleaning to cobol preprocessor GH-220 ([a54d187](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/a54d1879e1a2fa811c7471084ac2f55547f2f5a8)), closes [#220](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/220)
* Move EXEC statements processing to parser ([92c0c93](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/92c0c93e9c7dd455a163a9a81904d068a3ab962b))
* Move exec statements to Preprocessor GH-220 ([d3dfa88](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/d3dfa8868d86e89779e5536d9590eecb6903036a)), closes [#220](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/220)
* Remove copy tags ambiguities to speed up processing ([a1e42f6](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/a1e42f6851b615205b409f19461b91b3c1abbd33))
* Remove deprecated parallel copybooks processing infrastructure GH-220 ([2f1566e](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/2f1566e08782b59cf2f795d99db726018ff9a304)), closes [#220](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/220)
* Remove redudant cleaner grammar GH-220 ([6250c8a](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/6250c8a4bf8a5a3801676648368c3fc92721b783)), closes [#220](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/220)
* Remove separate cleaner on preprocessor stage GH-220 ([da11026](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/da1102682c28e6410e15fa783f527798862d4ca4)), closes [#220](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/220)
* Remove unnecessary preprocessor grammar rules GH-220 ([1f15963](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/1f1596361c32d6a69ce28cee760ca55635469116)), closes [#220](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/220)
* Remove unnecessary token operations on replacing ([0a59352](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/0a593526182e9259dbb30e6a329363fe9686e8e0))
* Remove unused rules from preprocessor grammar ([5a9b005](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/5a9b005484a7d39cec3cb64a08ab6420b3fc6e40))
* Replace token string check with type check to speed it up ([7debe57](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/7debe578042136ce437281d67d5d385eafc1ec5a))


### Reverts

* Revert "Release 0.12.0 (#419)" ([57f8b8a](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/commit/57f8b8a837b1d88d5daadd164aa903dadc48033a)), closes [#419](https://github.com/grianbrcom/che-che4z-lsp-for-cobol/issues/419)

# Changelog
All notable changes to the COBOL Language Support extension are documented in this file.

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
