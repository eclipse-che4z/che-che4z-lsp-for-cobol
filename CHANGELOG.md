# Changelog
All notable changes to the COBOL Language Support extension are documented in this file.
Changelog:

## [0.19.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.18.0...0.19.0) (2021-06-10)

### Bug Fixes
* Fix coloring for one-char keywords ([bb2040d](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/bb2040d9e8f34293039e6c069bc56947dbdf2298)), closes [#815](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/815)
* Fix coloring for string literal in continuation line ([58dc321](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/58dc3218446801ee1fad96564b44a1abb8d6b14b))
* Fix error positions for compiler directives ([ebae2dd](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/ebae2dd76c4188af998cee8b8c2e7bada49bce23)), closes [#116](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/116)
* Fix syntax analysis for compiler directives ([bb392a0](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/bb392a0882461a0388834965f99d46caad443b43))
* Fix incorrect documentation for some tokens ([cff6848](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/cff684818feb7fd9cb79af637aec6ad18cb281c5)), closes [#916](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/916)
* Fix nested program parsing ([86b8784](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/86b87842777b2893c060b9ba997e0b971e97d2a6)), closes [#730](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/730) [#596](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/596)
* Fix REPLACE clause when replacing or replaced text contains "BY" [#900](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/900) ([7d88dc7](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/7d88dc70c5a32f4116fc7dac302722c21ed93e44))
* Fix syntax error on READY/RESET TRACE ([5871b0b](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/5871b0bc161e2c1d8a834c6ee4f07784fe396977))
* Fix integration with Explorer for Endevor [#922](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/922) ([398dc49](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/398dc49447219603c4bc5119e972ab8265313f24))
* Fix the bug with two COPY REPLACING statements in a row ([035b661](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/035b661fb0d0f0dcad41a50c4837cf99a5380b51))
* Fix color scheme ([3a383be](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/3a383be7f96ece655637b8c212be8a30069f9790))
* Fix performance issues

### Features
* Add integration with COBOL Control Flow extension [#801](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/801) ([1d9a2e6](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/1d9a2e66f7f0c6af9b28f2fbf14d1371dd21be8f))
* Add global variable support ([91e9b59](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/91e9b5957ebc59b51507d6473577b81293e011d9)), closes [#730](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/730)
* Add IDMS DML starting keyword descriptions [#704](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/704) ([45baa15](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/45baa1527ed578662602368d012bee5547e83605))
* Expand support for IDMS DML commands [#704](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/704) ([e908c8f](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/e908c8f1466b0497fd8b238cdb193ad2d5947577)) ([286c42e](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/286c42ef50eb91da4aa826aba07a93158b1026df))  ([ca0cf91](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/ca0cf9120128f29892a226d2e587c0a098e31e74)) ([91646a4](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/91646a441ce94104c29c4a64820ef021f3d58072)) ([f55cdfc](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/f55cdfc059b4834c9e7a5c163e00a09947341827)) ([05020f9](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/05020f9d0b2558024fb8ce07885b6f5902aaf4f8))
* Add support for Datacom SQLDA and SQLCA implicit fields [#885](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/885) ([e6944d3](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/e6944d3340e65fa9f93a154c8f86ff92854c54e8)) ([90a78fd](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/937))
* Customize TAB button action [#841](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/841) ([29cdaed](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/29cdaedc213cc71e179a9c6d4e55e4aabd7ef603))
* Add "Go to Definition" support for SQL hosted variables [#714](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/714) ([95c4b34](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/95c4b347f875245ac08fc933bde35857d08be050))
* Show variable definition as documentation ([284ea9a](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/284ea9a193f2cf8d702bddf9891f11538995481d))
* Support REDEFINES clause [#867](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/867) ([561ba66](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/561ba66be8a4401b77f3922f6efd6cb55ac15ca6))
* Support REPLACE statements [#116](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/116) ([cf71f2a](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/cf71f2ad9f575a03c148fce8d9e4ea76d835a33d))
* Support compiler directive statements [#116](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/116) ([c89d65b](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/c89d65b07a65e6754c67875cafa512b5f13260ca)) ([6baec08](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/6baec08918c4a623c231cc9d19432b7389564675))
* Validate variable types in SET statements [#373](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/373) ([3802683](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/3802683fc52ad6a50b686b532f706326122867e0))
* Allow analysis regardless file extension ([f3b8051](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/f3b80513d53084093f859f76c5f80d99dbf07828)), closes [#832](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/832)

## [0.18.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.17.1...0.18.0) (2021-03-12)

### Bug Fixes
* Add color to hover message ([f15e867](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/f15e867c0d3af03f75012b40ca6c83360e04f35e))
* Add coloring for divisions ([988fd45](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/988fd457fe447b7c84846301e423648485314fca)), closes [#796](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/796)
* Fix misspelled keyword warning shown on a correct token [#760](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/760) ([8958921](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/8958921e2073847ab1cccb344556e491cf502c34))
* Fix terminating SKIP compiler directive with a period ([ef52f7e](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/ef52f7e07ae5a7bdf8cdd9e93c9eb2782649f991))
* Fix autocomplete for identifiers separated with dashes  ([37213a7](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/37213a7ae6dd26b8367e3f5cc4a26d9bf3392928)), closes [#798](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/798)

### Features
* Add IDMS DML support for DB statements [#704](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/704) ([#790](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/790)) ([08574f7](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/08574f7b53728e20b49cf2c9aedb10d7e75d0b5d))
* Add support for IDMS DML commands [#704](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/704) ([f8ca612](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/f8ca61261fe9a737bcdd7289c094040e0aa5b6bb))
* Make hovering over a variable show its hierarchy definition ([d7084ec](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/d7084ec5a227f09e8a6e99592ce2af71569088be)), closes [#757](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/757)
* Support copybooks outside the current workspace [#755](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/755) ([0d3baa6](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/0d3baa6376674234012a816bc594c3635c281a2d))

## [0.17.1](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.17.0...0.17.1) (2021-02-10)

### Features
* Add COPY IDMS support [#704](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/704) ([9911e95](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/9911e95d672a57f27c7f3303e68e65c1e6ab0bf2))
* Add NPM scripts ([316e7e5](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/316e7e51721a65d5a85e4cb89119b05b7fbb6dea))
* Initial commit for the UI regression suite ([9869f97](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/9869f976a7a67e45082154c9ff3ebc0d5e457e2f))

### Bug Fixes
* Fix false-positive syntax error on SQL keywords used as variables [#766](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/766)

## [0.17.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.16.1...0.17.0) (2021-02-02)

### Bug Fixes
* Fix semantic analysis stop after XML query ([d26b848](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/d26b8481111bb3ade6eb40f89e8282383583aea3)), closes [#706](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/706)
* Fix semantic error on structure calls [#504](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/504) ([896ec1f](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/896ec1f558f4071e4cc46a3572274f779c867233))
* Fix variable recognition fail on ambguity ([86b1423](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/86b1423107ec0cfc948d9fd6bf48fb24c3926b1e)), closes [#496](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/496)
* Fix variable usages in conditions [#729](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/729) ([8f76b70](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/8f76b707c1047bc6b16fd19e4abd1d9e48af65dc))
* Fix MAPFAIL semantic error in HANDLE CONDITION [#668](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/668)

### Features
* Add IDMS DML support for IDMS-CONTROL section [#704](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/704) ([a23722a](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/a23722a89a83f987cdcf3d1a27f178b528447115))
* Add IDMS DML support for SCHEMA and MAP sections [#704](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/704) ([1b69d49](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/1b69d49810d5a757601a3ee4bfb229a85cf6dc8f))
* Add mnemonic name definition support [#627](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/627) ([c8faa4d](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/c8faa4dc203d81752eff539ee484f587918c7923))
* Add support for 5 IDMS DML commands [#704](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/704) ([0aa5281](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/0aa52818d8f57086198138de65c9c4688663b220))
* Adjust Generated Error Messages ([86b63a5](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/86b63a591a9738f13c40b8a164c5e80d7f098958))
* Add DB2 SQL Variable Length check [#723](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/723) ([91c857d](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/91c857d958174303b930666d8e682a38fecc1955))
* Extend the grammar to contain all the SQL keywords [#568](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/568) ([cbfe74f](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/cbfe74fd895f98736718b9e87c37d766c674bf21))
* Extend DB2 SQL build-in-function Keywords [#722](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/722) ([f8e8178](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/f8e81787b5ec2f1708900e70c5ca65cb685729b8))
* Improve semantic analysis for variables ([d41083e](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/d41083e501ba203282daa25f2c62b8b43b015e43)), closes [#717](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/717)
* Make it run for Java 8 ([1bc3598](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/1bc3598ed471719297ab5ef65b506f2562036700))
* Refactor the references support ([cb5d3a2](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/cb5d3a24846bf9a050ee03ae6cab0f92a604eff8)), closes [#702](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/702)
* Remove prepopulating of settings.json with empty parameters for copybooks support ([c67e75e](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/c67e75ea035c6cc9ad8904448ff3863f33944498)), closes [#701](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/701)
* Support variable references in FILE-CONTROL ([805bf71](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/805bf7185d5fa0178a07eb1db9c5ce40d1c911d5)), closes [#718](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/718)

### Performance Improvements
* Improve hierarchical variable search ([513322c](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/513322c6d4460ff31e03631d22a5fc451e4642b1))
* Memorize usage format names ([dfc6103](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/dfc61038bc2651785492ac072a0dbde7bb5902d8))

## [0.16.1](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.16.0...0.16.1) (2020-12-04)

### Bug Fixes
* Fix analysis termination on handled client exceptions [#643](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/643)
* Fix a syntax error on HANDLE AID CLEAR() [#670](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/670)

## [0.16.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.15.0...0.16.0) (2020-11-27)

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
