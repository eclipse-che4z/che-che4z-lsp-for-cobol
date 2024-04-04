# Changelog
All notable changes to the COBOL Language Support extension are documented in this file.

## [2.1.2](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/compare/2.1.1...2.2.0) (2024-04-03)

### Bug Fixes
* Add benchmark service ([a313cc2](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/a313cc20340e819a6b4d079740b123f1ac65eb74))
* Apply matching threshold while parsing different divisions of COBOL code ([4f20ce9](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/4f20ce9c11661321ad33058f01bbb0af658d7ac0))
* Fix folding for evaluate block ([70a752d](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/70a752de324b560277af9ea4fa45aa04615bb8d0))
* Fix folding when IfNode has a copynode child ([0c9717d](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/0c9717d161dd7c3c7f595c35c0a8b2be6e533aca))
* Hardware parser tests ([cb98e83](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/cb98e83740c60fe48a41663b098d47896d9feca9))
* Update CICS delay statement as per doc ([3aed670](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/3aed670a8ff661d3e958c6b30ad0f3288ae3643c))
* Update new keywords introduced by CICS EXCI grammar ([f9a8e91](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/f9a8e91e16b3b4624acdbb1147c79d32016c30fd))

### Features
* Add CCF support for CICS RETURN statement ([#2229](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/issues/2229)) ([cbcd098](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/cbcd09873b34b3e841efc72b29ece7aaefcc3196))
* Add CCF support for not supported statements ([#2242](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/issues/2242)) ([dcb5de5](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/dcb5de5483e3740e193de818bee870241d85e51c))
* Add CCF support for the 'XML PARSE' statement ([#2237](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/issues/2237)) ([3c09a11](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/3c09a11fda5bd1f1ffabfc21e8d14e45a3748381))
* Allow floating comments in DaCo COPY MAID statements ([deb5811](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/deb581168bd5c6c05ef9c791b1a8ca2ff73cd5c9))
* Make COBOL code layout configurable ([26b3388](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/26b3388a9237b46f9fd8b62e831380c8317827fb))
* Support EXCI command in CICS ([3dcd0f5](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/3dcd0f5a80f26d8de88cc07992d481916194c0ca))

## [2.1.1](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/compare/2.1.0...2.1.1) (2024-01-30)
### Bug Fixes
* Add grammar for the CICS INQUIRE URIMAP statement ([f45d384](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/f45d38410a5f08d785ee8a9ddc2dd6fde8862846))
* Allow Db2 DECLARE statement in the working-storage and linkage sections ([c4e7f64](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/c4e7f6424d5dd6e667cba1912ac6138ccb445599))
* Do not invalidate cache during a running analysis ([b60e5c7](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/b60e5c7b6f4fcf64422f611df51428a09e0cb746))
* Exception on analysis of some programs in CLI mode ([d6831fa](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/d6831faaf5cbc3f43126fa6558d2fb67f0588e7e))
* Fix definition and references URI for virtual documents ([4960389](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/4960389068eea87ae721091cd1a28a40fed89662))
* Fix popup message for copybook downloads ([34fcd98](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/34fcd98928909223341b8085ccff22e45aa6587b))
* Improve folding ([721a498](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/721a4983114af4de2c9ac15f3910d6a7a76d4e15))
* Remove COBOL control keyword from IDMS dialect ([a696efd](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/a696efd052254399ea5ee11234caeb993dd2778c))
* Remove COBOL control keywords common to COBOL and dialect ([02ef1ad](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/02ef1adc11bfbc6fa7bbef5195578d8a8b3f9c36))
* Remove COBOL keywords from DaCo dialect which are common for DaCo dialect and COBOL ([bcdf624](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/bcdf62413e6f458624b9f751f1fe53312d3f1c02))
* Remove unused coloring rule ([22c9508](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/22c9508a891542cb380e3a7046b5bdb3f27a44ba))
* Send same diagnostics URI as the one received from the client ([513229c](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/513229cd2e99b8bc5ab73283e6a5decde3eb522a))
* Smart tab completion not showing up ([f06e3f9](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/f06e3f932360cf9be27929667393f722715d3fb7))

## [2.1.0](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/compare/2.0.3...2.1.0) (2023-12-20)
### Bug Fixes
* Adopt changes from PR[#2081](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/issues/2081) ([f096df7](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/f096df79c3073ab298ec05819c674529a3c40585))
* Fix 'PERFORM THRU' node ([#2093](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/issues/2093)) ([403ef77](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/403ef773f601db0c6639a5b633aae2007f5b7c49))
* Fix CICS coloring ([467988c](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/467988ca7bd09fd300d21e7e2778bd6eb67c45c4))
* Fix CICS web receive grammar ([2d8e6a1](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/2d8e6a19e268659664dd1278242d17518015ea56))
* Fix completion for file without a workspace ([f6d117b](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/f6d117bbb7f11524b6921011eba03f62d96567e4))
* Fix copybook detection based on a content ([#2100](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/issues/2100)) ([3b8003d](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/3b8003da3f5e2e0a18d9d3222d7657417458c30c))
* Fix joined query grammar ([de572c2](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/de572c26a6628afdbcc5775bfb3f12716475a8d9))
* Fix NPE and add a message for retrieving analysis result for a copybook ([#2111](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/issues/2111)) ([21b9b09](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/21b9b096348d1db7d5c3bfd4343c8dc7874985a7))
* Fix variable usage rule for CICS ([6b2985a](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/6b2985a71b3c885e2016c0fb73cb264f313a2d67))
* Fix wrong diagnostics error ([b715bda](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/b715bdaa830f01ffa2df94b7b6e2dc8862a41670))
* Include Db2 keywords in the SQL coloring ([6892b2d](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/6892b2d7b709de42abfd996c236a2e028032b695))
* Propagate preprocess error in copybook to the cobol source ([706bbe6](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/706bbe61eaa883811654ee6c731fcb785e67b89f))
* Test code coverage publication ([8c71071](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/8c7107129a12a11f5c296d7b8c814c9df545eef8))
* Update Db2 insert grammar ([a2a65f9](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/a2a65f93f7804955fbdd4e3a4c4d6f4fa6f03294))
* Update Db2 select grammar as per doc ([3f88299](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/3f882991435e1f10667a8c37f542667c3f6d0979))
* Update divide statement syntax ([3ebe72a](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/3ebe72a06c22c5f65e3e06bb894e0978860e9476))
* Update message for input mismatch error while parsing ([e549426](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/e549426b5245468636580cf24e3813d07fcb68d8))
* Fix: Filter outdate diagnostics ([5021fe9d2](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/5021fe9d2))
* Fix: Add location to all CFAST nodes ([4aa980b49](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/4aa980b49ce47b1fa956deb2a5427067a06cb235))
* Fix: Textmate grammar ([729a308](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/729a308b4652c39e82a925412ccf88a0253074ca))
* Fix: Outline display ([dd85b1d](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/dd85b1df5ae859cdb34c833f049c642bb9ba87d7))
* Tests/automation: Support for replacing and mapping statement ([fa15459](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/fa15459e8e7ab28d423253f5b064edcc9f78fda2))
* Fix: Outline sometimes missing with copy statement change ([ed5b623](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/ed5b623addfd4979121f5fbc8be8b55453f7ff93))
* Refactor: Extract Db2 embedded code as a dialect ([e68c658](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/e68c658f48742b2645a3f232f50d4c4e0e9b8209))
* Refactor: Remove CopybookConfig.java ([b688d8f](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/b688d8f582526f513fd665fb417c07027db1d0e3))
* Fix wrong analysis for sql code inside a copybook ([6dd0a7f](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/6dd0a7fb29503a3a387d0c1bcf85e3d98b9e15b5))
* Fix: Expect analysisResult could be null ([642896d](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/642896d02b3349a0ecdb3a8a2084813d213d6f43))
* CI: Run independent steps concurrently ([5f839c1](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/5f839c1cf84e84fcaa9d0949b7cdb70cc6129dd3))
* Chore: Change dialect API version ([715d209](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/715d209d5dbfd50ac378f70c5d8edb59ca67fc2b))
* Fix: Completion ([7fd3fe4](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/7fd3fe4402827a070a767de6894622cc3e25234e))
* Fix: author.name support ([f7c1d68](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/f7c1d68f2a4b5cd399ad107e689afa36041d9d1d))
* Fix reanalysis of opened programs ([f15a12d](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/f15a12dc2e93b1ca73b075fca25ac966b739e970))
* Fix: Tolerate unexpected comma char in string statement ([c58e544](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/c58e544621118ee4f46d66ff73d707146baa5e11))
* Fix: Allow LEADING / TRAILING as a function argument ([#2139](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/issues/2139)) ([13c0d31](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/13c0d31fea58901590810439d74eae493a26e06b))
* Build: bump ch.qos.logback:logback-classic to 1.2.13 ([aa85a13](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/aa85a132e192256c2c784654999bb0847f91b5e5))
* Fix/reanalysis for open prgms ([67d30f9](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/67d30f95fc7f869050f87a4e1105df26743c3ad8))
* Fix outline for a partially analyzed document ([8906c40](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/8906c40f05cd19b6dbb911aa9afe1a90d7dfc2bc))
* Test: Enable back positive tests ([47ec3bf](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/47ec3bfee823166554011de0f17d8b1819c14b09))
* Fix: Outline display on first analysis ([443a04e](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/443a04edf1d5d656c3d9019eb533702c3975caf2))

### Features
* Serialize LSP request to better control of request processing ([d2fbd56](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/d2fbd56f05ddc0495033b9b5733d6843903c97c8))
* Add an interface for a parser to unbind from ANTLR implementation ([d29b8ab](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/d29b8ab0c801572e4f1f930665a800c7a693e006))

## [2.0.3](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/compare/2.0.2...2.0.3) (2023-09-20)
### Bug Fixes
* Allow WHENEVER in data division ([be50acf](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/be50acfc63c76da3b388c7eb831e02a33f47fbab)), ([be50acfc6](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/be50acfc6))
* Update DB2 SELECT grammar as per doc ([47a48696c](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/47a48696c))
* Tolerate CICS format time syntax when TIMESEP and TIME are not present is a fixed order ([222d558a6](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/222d558a6))
* Fix wrong diagnostic location for embedded code present inside a copybook ([9a99e14ae](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/9a99e14ae))
* Add support for 'PERFORM THRU' CCF node ([#2064](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/#2064)) ([99d51ef16](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/99d51ef16))
* Unbounded OCCURS support added ([1a0bb2f06](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/1a0bb2f06))
* Fix issues with inline comment. ([ccda2be9d](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/ccda2be9d))
* Server initialization when file is opened without workspace ([3571332a3](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/3571332a3))
* Fix CCF extended API call ([#2054](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/#2054)) ([4e1df638f](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/4e1df638f))
* Inline comments shouldn't be analyzed while preprocessing ([481688f03](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/481688f03))
* Update CICS rules for sent text and asktime ([fe6123dc0](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/fe6123dc0))
* Add semantics check for file IO operations ([ad9e331e6](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/ad9e331e6))
* Change scope of WAIT to be used same as NOHANDLE ([082059219](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/082059219))
* Update DB2 SELECT clause ([45f70183c](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/45f70183c))
* Add inline exception handle for EXEC CICS commands ([2ca8ae648](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/2ca8ae648))
* All tokens are passed and matched for embedded language (CICS and SQL) ([274ce6d87](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/274ce6d87))
* DB2 predefined variables ([7ceda1a56](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/7ceda1a56))
* Error out the usage of deprecated cobol 5 compiler directives ([b34bebf06](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/b34bebf06))
* Validate variable name length ([6fdae199d](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/6fdae199d))
* Remove area A warning for EXEC SQL block ([aefe2f646](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/aefe2f646))
* Allow CLOSE as paragraph name ([5af11159e](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/5af11159e))
* Allow EXEC SQL in LOCAL STORAGE ([bea2ec5b4](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/bea2ec5b4))
* Allow SYMBOL as variable name ([7fc0bcc13](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/7fc0bcc13))
* Allow fetch into variable ([0e5532ea5](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/0e5532ea5))
* Expect a mandatory END-EXEC for EXEC block ([5550bd76b](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/5550bd76b))
* Show no error for inline comment with just comment tag ([478f377db](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/478f377db))

# [2.0.2](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/compare/2.0.1...2.0.2) (2023-08-15)
### Bug Fixes
* Fix pop-up error for completion requests ([658f6cb](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/658f6cb86bc5993c2f8f0624cd523ccc8eba4104))
* Add default compiler directives while processing when no compiler directive configuration present ([06769fa](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/06769faa256d34f1d6114f9f603a1cbfacdc666c))
* Allow defining CICS condition names as variables ([2682568](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/2682568ef07f713b626babbd8a24995454d56317))
* Allow hex token with lowercase alphabets ([54ff8c8](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/54ff8c8645a5c75844f8302b5566286d2d4f34c9))
* Recognize COBOL language ID if a compiler directive is specified in the first 7 columns of the first line ([83dfd27](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/83dfd27abfb80571daec41a2cc6fdf69b2761226))
* Fetch copybook for dialect from the dialect configured settings ([a9765f5](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/a9765f537b08fb10da165b0dfb48719c5fbddee5))
* Fix coloring for EXEC block ([fab389c](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/fab389c36783411eb1e4ad81cdf6cbb39768c916))
* Fix copybook content substitution [#1961](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/issues/1961) ([2a0f605](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/2a0f6053599580fbba4ddaa9d030df893bb9739d))
* Fix group variables for SQL statements ([#2001](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/issues/2001)) ([6db4f0b](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/6db4f0ba761519b911088c76e21db0d24ece549a))
* Fix runtime copybook watchers ([d24ce81](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/d24ce8122d4e71be5f27f4787d9eeefebd80dffc))
* Handle 77 level as first level ([091d1b5](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/091d1b59d2cd4d7ebe6faa920458c034a56d9e13))
* Handle implicit registers introduced by CICS translator ([703aa60](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/703aa601c3d2db52aaea64e6a5adf26368430a64))
* Maintain mapping for embedded code ([bcde14c](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/bcde14cd1bb32bfa92ebbabd65e6d17e5d488232))
* Maintain mapping for multiple instances of embedded code ([449dfba](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/449dfbaddf73faa45ee1548adaae69df6310a352))
* Respect processor group configuration for copybookName autocompletion ([8f2f1cd](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/8f2f1cd765dc4b3c8a6d3472ed27813deadaa1f2))
* Skip analysis for not used copybook ([#1996](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/issues/1996)) ([cee3b08](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/cee3b08d6f8fb707d8093823a2bca0fb52561ebe))
* Tolerate CICS LINK EXCI statement ([70bcbcb](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/70bcbcb69d9d972f4dcfbe79f070fcf634c5eab6))
* Tolerate FD data record mismatch clause as per IBM doc ([5fff092](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/5fff0922abef1390489a44bad3de162fa7db32f3))
* Update copybook extended text position ([813703f](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/813703f41621c35997af446964ba73cc9e06c2e2))
* Update grammar to restrict only reserved word for COBOL identifiers [#1761](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/issues/1761) ([17d12b1](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/17d12b1e0232e8ff4ebc752f2b94321c587dd2cc))
### Features
* Show diagnostic only for opened documents ([#1965](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/issues/1965)) ([28631ab](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/28631abe14878b99cb49782b51daa21a76fedbd3))
* Log Server messages to VS Code output panel([#1949](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/issues/1949)) ([cab35d7](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/commit/cab35d71cc0b2301c6a044450add422f77b37196))

## [2.0.1](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/compare/2.0.0...2.0.1) (2023-06-29)

### Bug Fixes
* Call + using statement
* Coloring for quoted string
* Disable indent lines for cobol
* Expose analysis API
* Fix copybook error processing
* Fix copybookName completion list in case of glob patterns
* Fix dialect copybook downloading
* Fix mapping for multiple copybooks processing
* Handle settings value coming as null
* Improve cobol file recognition
* Tolerate cobol5 compiler directives
* Tolerate FD label records mismatch clause as per IBM doc

## [2.0.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/1.2.1...2.0.0) (2023-06-02)

### Bug Fixes
* Clear diagnostics when the changed content is not analysed
* Issues with proc_grps json schema
* Broken SSQ CASE statement grammar
* Same copybook used more than once within a program shows error if copybook refers to another copybook #1833
* Support repository paragraph
* Tolerate json syntax
* Enable ** match for .folders
* DaCo extensionDependencies as per new naming convention.
* Support SUPPRESS keyword in the copy statement #1816
* SQL special words recognition
* programId paragraph syntax as per docs
* Completions for untitled files
* Completion error when working with un-analyzed file
* Close analysis and log message when exception encountered while analysing document
* Mapping for SQL statements
* Use file path instead file names
* Do not show diagnostics of closed files
* Dialect copybook diagnostic propagation
* Copybook names duplication in suggestions
* Do not show loading in the outline for a copybook
* Show progress notification on actual analysis start up
* Resolve program name variables in autocompletion
* Broken smart tab #1740
* Data record definition is optional #1636
* Variable in copybook resolution and windows paths in processor group

### Features
* Support JSON parse statement #1746
* Allow user defined dialect order
* Allow to setup SQL backend in processor groups

## [1.2.1](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/1.1.1...1.2.1) (2022-12-22)

### Bug Fixes
* Fix copybook download and clear ([44dff94](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/44dff946fabb0089b3c61e95cb6b1464c0167db5))

## [1.1.1](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/1.1.0...1.1.1) (2022-12-07)

### Bug Fixes
* Add Exit node for EXEC CICS RETURN statement ([#1603](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1603)) ([ac8e757](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/ac8e757ade3ae52832075824cb1d6a6e7b4ed8e4))
* Allow SPACE and literal in DaCo ROW ADD stmt ([80778fe](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/80778fe1efa36857a96e6e2a47eaf202f38a5858))
* Create symbolic accumulator on stack ([c939afd](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/c939afda23ccb6483a777154d3d2a8aafab36ff5))
* Exclude DaCo from test coverage ([7487839](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/7487839288102dc549b9f4446792a548cac61989))
* Exclude DaCo from test coverage ([872583a](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/872583abc4ad9f2a7d59ce76cbb8a62624f84b09))
* Fix dialect's interface ([03ab46b](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/03ab46b912d96894b2813076b80b964f2df2f0c0))
* Fix lost changes after formatting document ([#1634](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1634)) ([9acede8](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/9acede80871abf9a2f874221ef25a9b7fe025d10))
* Fix module coverage ([6743043](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/67430430fb13686c46d548d2b9253464986af2e3))
* Increase product version ([6b8701e](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/6b8701ea5cd531f1ee7997671f5006ef61780ac7))
* Increase test coverage ([cf65107](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/cf65107d4d89eba633fab1468e29c4e9bd0c06d3))
* Move logic from code block and section name node classes ([9a77df6](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/9a77df6467bd30b15c7fd9ed83583da516738cfc))
* Store symbols in a repository ([466a6df](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/466a6df64f4c5d59eca9a2c77e1583d307d2f5c4))
* Support AT END for CFAST graph ([#1613](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1613)) ([c325bf9](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/c325bf99041e1d4b940f30882344a75fb4011c6d))
* Update copybook identification regex to support  all use cases ([#1618](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1618)) ([49d74aa](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/49d74aa85799e7f4d68bae09b3ff33491fa3f586))

### Features
* Add 'textDocument/diagnostic' support to LS ([583479b](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/583479bb6f89a67e2df865c729ed7a0cb47f5df2))
* Automatic Cobol Detection ([00954df](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/00954df4ab450ca0a9235baddbc172d8f1e1639f))
* Normalize model classes ([22fb5b3](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/22fb5b31c7f29ca98e2d37b18721900a8c154e94))
* Update grammar ([baad971](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/baad971e4feb670a67a9e85deb03bdcbfc817978))

## [1.1.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/1.0.0...1.1.0) (2022-11-03)

### Bug Fixes

* Add exit section CFAST node. ([2ae8b60](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/2ae8b6068b392da8211eee7c86034eccf0847eb9))
* Add XML-EVENT to special registers ([e0b9973](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/e0b9973a7f3c0502bd0ff36803f14fc8b1f1d8c6))
* Allow comma separator for COBOL statements. ([3747d2b](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/3747d2b2f2e96955f86b57c942414c280510e924))
* Allow DATA keyword in the optional paragraphs of Identification division. ([5279c23](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/5279c2364d764e60918e082243beddb198f43a15))
* Allow elementary items with only usage index clause. ([3ecbca1](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/3ecbca153def72698671bb614d714341e21c45de))
* Allow global FD variable usage inside nested programs. ([ff168c2](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/ff168c288bfc4d9913e269e4027d525537d6189e))
* Allow level 77 variable to be used for setting fields. ([57253e8](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/57253e80279cba961f87ed762ee195e3a14f5f7a))
* Allow MAX as allowed intrinsic function name. ([6aec5a3](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/6aec5a3125707303825a1301b193b897d702ed37))
* Allow multiple assignment names for a file control entry assign clause. ([03694be](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/03694bef05ee49e09c9942b5bee18c09c4f93222))
* Allow qualified names for level 66 variables. ([0e9cdb2](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/0e9cdb210c51cb2306ce36a5548c8c14bd613875))
* Allow semicolon separator to grammars. ([d41bd53](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/d41bd53fb6c3b853ec85e3c98c9eedc1b5f6a52e))
* Allow set field to be set to any integer elementary variable. ([8a78937](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/8a78937cd7e29eed11671ccfc0c8288f570561e6))
* Allow timestamp as a column name. ([c27b44d](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/c27b44d6870b9e5c6ca1933a90f6f3ffc020dff7))
* Apply mapping for IDMS copy nodes after line concatination. ([85871e5](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/85871e516c6539fc57428b27886993c8cf867730))
* Change strategy for copybook identification. ([7497ec3](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/7497ec3c25fc6478c66d427cd79acb765db8c585))
* Fix continuous lines processing. ([093bb12](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/093bb12c03b82361eca6f7864b56618a51cfb72c))
* Copybook navigation with name collision fix. ([dc42857](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/dc4285787eba246733146136339535c805f9e055))
* Copybook unwrapping order fix. ([9896dde](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/9896ddeff811e49ff505ddc4d106f9a9d60005fb))
* Copybooks mismatch in cache. [#1328](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1328) ([d75b531](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/d75b5310579cf278faf9c68a6a50fdc8182d8e78))
* Cut multiline dialects fix. ([9a63479](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/9a63479411657b9a551a2a0c913e61931df49acf))
* Don't include Record description entries within FD entry. ([e657cb9](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/e657cb99046e220b0a9b4f43313f1fb82f18246f))
* Download copybooks in parallel and support extensions. ([b8447cb](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/b8447cbb9c14639699cb359bdf2b81082bf3f7aa))
* Fix copybook download functionality. ([0374670](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/0374670d2d9b580235c00b2c511f47a337c11897))
* Enable navigation for DATA RECORD variable ([12fb957](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/12fb9572e62e8f15d94cfd782feb366014c52f5e))
* Fix ambiguous reference detection ([2ea5471](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/2ea54714d23257d20b0c3e2d333b48c88d064cca))
* Fix broken mapping for improper data clause. ([dce7774](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/dce77741f5b96c48c6f4f1e5c34fe3f0269198eb)) ([1a39aa7](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/1a39aa73e29eaed9bf13990bc037bcb98e24b2dd))
* Fix CFAST `exit program` node ([4327880](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/432788004717ef7f596e21eabda5e4b3fdeedb85))
* Fix CFAST exit and stop nodes ([8ee2f1e](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/8ee2f1e6290053c9f57e4dd727a04227a441109b))
* Fix CFAST graph generation ([0923955](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/0923955dc4f392810f13cb42a08e2da67cb33237))
* Fix DB2 grammar for expressions, column names and host names ([246e3e2](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/246e3e2adfd383c4e162b320559e0378aa17a673)) ([f282be7](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/f282be73a414920638fcf1048c375f1fd6bdf5f7)) ([8ff6052](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/8ff6052a64f7ae272ba2a9258ca3c2fe554f85be)) ([62e31b9](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/62e31b96f9357caf3efdbbd715ba998b0a78ed49)) ([6ca07be](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/6ca07be784654844390be6c133387a2e6ddb3c4a))
* Fix DB2 host variable references. ([b19e119](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/b19e1198b38917a09d5874d143769c55249b1b56))
* Snippet-related fixes. ([8122b26](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/8122b264167a547c845ce462d35532b519025a29))
* Fix EXEC statement parsing. ([32630a4](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/32630a457517fa053960380909f48b4cb50ce42b))
* Fix missed copybook report line number. ([6f8ce1a](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/6f8ce1aa081d472032a54a29a02e641365b24c0e))
* Fix multiline variable definition mapping. ([44cec9e](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/44cec9e77aa0c9b8099fa1480f762ff24c164624))
* Fix multithreading issues. ([aaff27c](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/aaff27ca1a2aac0289bbc1686d97c0b308c525c0))
* Fix nested copybook resolution with program name in path. ([48ef33d](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/48ef33db4d4dba1a94e06144d7bdf4a2707a6048))
* Fix smart-tab schema. ([30f28bb](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/30f28bb278dc118896ece2f1508186b3bb4d1a18))
* Fix the snippets suggestion for the unsaved file. ([9f0e40b](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/9f0e40b9e8a181e3da8dc19c321c797947a4d4ce))
* Fix go to definition for variable with predefined copybooks. ([bdfec37](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/bdfec375e61007f91ed6e8decc38541c66b2c33e))
* Identify different literal when continuation line started by 2 quotes. ([239425e](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/239425ed614132d2e27550bc11bc3f9675a60eca))
* IF condition can consist of dialects. ([3c5bb74](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/3c5bb74056a013bb74257f555f826c7834375e22))
* Implement waiting for config before first analysis. ([a62e0b4](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/a62e0b42e36edd53c5ffcdcba274982b85644e64))
* Make replacement in copybook when a partial text is replaced by literal. ([76f086e](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/76f086e4967eb56e5c0851960b3232f25f304437))
* Minor fix for IDMS grammar ([62e217b](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/62e217bc0f5424876518827b61870dc363a9a6b6))
* Navigation to sections fix. ([65141a1](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/65141a1769f869c329ecd6edb15bef0471c87dca))
* Populate the suggestions for unsaved file. ([7dc4a37](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/7dc4a37ea3facad57e13ea39a5bd4716f98687f9))
* Provide default features list when no features are set in settings. ([d1834bd](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/d1834bd0e8e710e5f04c667220bd777b6edc7593))
* Reanalyze on copybook changes. ([c43e4ab](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/c43e4abc71ba65022cdb62694728acdaf579dd97))
* Recognize copybook if *copybook* is in path. ([c6f6702](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/c6f6702b93f06d4512f182cc5961a65a22788ffb))
* Rectify CICS security query parsing errors. ([b3c5bdd](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/b3c5bddd5f372ec0ae39b37efa8d94ae00bf5bcb))
* Remove unused keyword and commands. ([ee3bc9c](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/ee3bc9cfecdf5ba4b669c67603f305f64a290669)) ([3048eb6](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/3048eb64e7a7136b1cc3b8b1090e3b023549a612))
* Remove unnecessary COBOL document preprocess cleanup in copybooks cache. ([67a7b3e](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/67a7b3e9e7be6c384bd4795100205af648a17c95))
* Report about missed IDMS copybooks. ([f10ac3b](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/f10ac3be1479b0056a6d113ea90e0ef13b0f9fb9))
* Resolve downloaded copybooks. ([5d7e5d0](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/5d7e5d00d492a2e282ff873aa163833bff6e0534))
* Show duplication error for predefined section ([c68b5ee](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/c68b5ee278fce4f57b45a635fd603f50163bf666))
* Stop processing infinite idms copybooks loop ([b0abbc9](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/b0abbc9732fe8d529c6bcaaa4abd40ae70f775a2))
* Support exit section statement. ([7261c56](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/7261c56754beb0f1e25c64803a81d9b0fbbc49d9))
* Support figurative constant in variable usage. ([7446bbd](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/7446bbdfc524250cff978bbc00a21688683817e8))
* Support for path variables in watchers ([814a032](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/814a0327b6e84b4ec7d255f9e04303167d30b2c1))
* Support IS after PICTURE keyword in dataPictureClause. ([3735424](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/373542402bfa0d7bd22b4f47ee2493ece11977d2))
* Support use of declarative section in the cobol document. ([30961ef](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/30961ef4234a1dae9f886018dc0940a495d8b814))
* Tolerate conditional compiler directives. ([e4ebfc9](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/e4ebfc9f649503f2d4294b35b0778d6843f7eb6b))
* Update File Description grammar as per docs. ([26c8435](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/26c8435db0c1dd17f8e3534e8c6d3ba0dff741d4))
* Update ruler settings for copybook. ([13d1625](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/13d162524b8f570b2d3555084ed1344df9b70f58))
* Update the missing copybook text. ([98347c4](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/98347c463dcf609715c2715420ac4e0e8dbe62bb))
* Update the ON clause to handle the NEXT SENTENCE. ([7318333](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/7318333ae36dad81e1d4414d448c2877dc5d3b21))
* Update the rulers configuration for copybooks. ([3c2fab8](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/3c2fab83253c665cbc6b9c45dc769cf750e69b89))
* Update try-catch with resource. ([d91dc70](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/d91dc704b8a9e98ae1fee0fd2e65cd21b68e889c))
* Update version of LSP4J. ([3735c92](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/3735c92c3f36c77cb7f0399fade9bff9973d249e))
* Variable declaration hover converts hyphens to underscores. ([09a016c](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/09a016cb18ce28a66f29395f0d9ef806c5547e52)), closes [#1319](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1319)
* Watch folders specified using fileBasenameNoExtension variable. ([bb9ac58](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/bb9ac58de6651f47e74c486b6c2c8b3447e75a1d))
* Fix missing IDMS variables mapping ([8440dd4](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/8440dd4f0fd987f24116919d182201e11fb906d0))
* Fix missing IDMS copybook error processing ([fc70701](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/fc70701c146b64181d37110b2b21fd18c7a3541b))
* Fix copybook definition statement location ([b9e22f6](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/b9e22f6b951f31be5d98a2423704b8834e72ab0b))

### Features

* Add error source in the generation. ([069e3bf](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/069e3bf92721babd719a9a9f2e7fee9f834c7596))
* Allow nested IDMS copybooks. ([a705f5c](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/a705f5c0021eda7dc603a76ca6f184a4efb72867))
* Allow parallel analysis. ([e8915b2](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/e8915b284fbbe3aefbd24d4f9fd043b7aabb2dec))
* Analyse the subroutines only when settings is defined. ([11b3ccf](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/11b3ccff340f80f9221485e72e28be52853bb05a))
* Compare LS engine analysis against compiler SYSPRINT for positive tests. ([76e8408](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/76e8408b771e4bddc751c746b2b7a2d61f3a9162))
* Configurable CICS translator. ([b083c55](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/b083c55cae9b283a558150b568fc7af2ead7d748))
* Convert language ID from "COBOL" to "cobol" [#1508](https://github.com/eclipse/che-che4z-lsp-for-cobol/pull/1508)
* Support different smart tabs settings for different divisions. ([e2d5c28](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/e2d5c28dafdd46d5e20ffee361b7dabb38a47e29)) ([15dd23e](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/15dd23ed4f989a304b9862eb19d095a2d05b8c31))
* Process IDMS Records. ([87794d1](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/87794d1b00fd7d2cfe59f8b3baca24a72e8f68bf)) ([29d6574](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/29d657488ff6182b81ad440878b20cb90868ed9f))
* Separate IDMS copybook lexer and parser. ([3e0a3f0](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/3e0a3f074230a5b146d8e2587db78f5e5464d1e1))
* Separate IDMS copybook processing to a separate service. ([bd90ff7](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/bd90ff7cf8568036d4cc04ebd6606fa4162be98f))
* Source code folding support . [#1164](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1164) ([d6d8972](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/d6d89724c6c5fc1a46b19972cc246546a3a83582))
* Support NEXT SENTENCE for IDMS SNAP and ABEND statement ([05b1e44](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/05b1e44b2279f938a722160ea1faf1f138e992a9))
* Update diagnostics when copybook are updated ([0c5b8f2](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/0c5b8f2abd508b06f5df4294a4c37e43f88829c7))

## [1.0.2](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/1.0.1...1.0.2) (2022-06-29)

### Documentation
- Updates to README([85543b4](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/85543b4b4aee89953c1db841abe76473b42e7d5b))

## [1.0.1](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/1.0.0...1.0.1) (2022-04-05)

### Bug Fixes
* Provide default features list when no features are set in settings ([d1834bd](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/d1834bd0e8e710e5f04c667220bd777b6edc7593))

## [1.0.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.21.0...1.0.0) (2022-03-31)

### Bug Fixes
* Add .copy as supported copybook extension ([444b31d](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/444b31d13837351d2ddd41ec935524c6e9d8e757))
* Allow redefining when data names have the same level [#1211](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1211). ([3888bc5](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/3888bc5242b4501f3eb3333d56a916fa894c19ee))
* Download copybook even with IBM Z Open Editor ([82cbd50](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/82cbd502362717f8713d4d2ad3d0c79372780f98))
* Fix copybook definition lookup ([d3f7089](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/d3f7089a9f762077648092d49a3bfc92ae859684))
* Fix exception on typing EXEC SQL [#1125](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1125) ([d422c18](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/d422c1849d39245a7b1719c6afe653c0df8a8548))
* Fix IDMS entity length error locations [#704](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/704) ([#1146](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1146)) ([2890740](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/28907406a4020b454752eeb53fe63194ae1068a5))
* Fix resolving SQLCA from workspace [#1189](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1189) ([f2d2972](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/f2d29723945f771989664becd76bbd910fde3314))
* Fix server freeze on EXEC statement ([befd48d](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/befd48d347c2e9858bad6d5da4cef310ae51bfc6)), closes [#1122](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1122)
* Fix tab key for suggestions ([ecc7c13](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/ecc7c13bce8f45fb543b0c081d0a510a8d8ae623))
* Give option to download Zowe Explorer ([bf9bded](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/bf9bded5bbf38bf9a26388d71cc21e447a306583))
* Make dot optional after END-IF ([db9b292](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/db9b292aebd9f45a11a598094bc6d3d3c4723c14))
* Fix quoted string replacement ([fe15cb0](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/fe15cb041df1a0d8b5539847727305cbed486c81))
* Fix ClassCastException while analysis for CCF ([032c469](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/032c46930db0da982bf8dc25496b77045609de9f))
* Prompt proper error message for copybook download ([4eed5b1](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/4eed5b1491aefc39e273ccc3b9bce4d3ae7c7b83))
* Provide a setting to define encoding for USS files ([62edeaf](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/62edeaf97bb4061d6c84340c08d306ae6059a744))
* Remove confusing tokens from error messages ([3f2eefb](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/3f2eefb32188d065a7ae644604183f797e82b258))
* Remove identifier tokens from error messages ([e343ebb](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/e343ebb92a5aefc74c9eb4aa99dbc8cd203f6cdf))
* Remove technical tokens from error messages ([41434fd](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/41434fde94ec4d095e6fbf36726ff4b1e27756bf))
* Remove unnecessary requests to Zowe ([6f7ffb2](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/6f7ffb225c8dae55d3fc5ed30729a4f866f69891)), closes [#1132](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1132)

### Features
* Add an ability to enable/disable analysis features ([d55dd09](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/d55dd09c8df188437bb836d19223cc7488f8f579))
* Add the enable/disable dialects feature ([8972150](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/897215099eed0de262832713403b324510935d9f))
* Add line commenting ability ([f4083a3](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/f4083a3576ca066545929993b51593dd2d40d08c))
* Add IDMS snippets [#704](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/704) ([af98cbc](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/af98cbcacccd9b7a89a3d4da1da3c64b4af62776))
* Adjust level numbers for COPY IDMS ([3757275](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/375727583dd559ecf216bed5d3e065953b8a354f))
* Allow paths for different types of copybooks ([47a88f7](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/47a88f72249b7721e43759f810a25fff55f251a6))
* Evaluate variables for the path in the settings ([a33f0fb](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/a33f0fb09704d17e99f15e8594f4e122f4d9ca0b))
* Resolve local copybook names for autocompletion ([6f6f942](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/6f6f942fb1c1d88cb680a07f5515c95d3963f788))
* Support ++INCLUDE statement for copybooks [#20](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/20) ([#1142](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1142)) ([a833604](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/a833604cf70a6d94aba70a2563c2f95a3cfbe00a))
* Support compiler directives for COBOL 6.3 ([d36f2af](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/d36f2af794f94a9b13c8f48d416b55cec8d3e39f)), closes [#1210](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1210)
* Support USS file download for copybooks ([5cdbc45](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/5cdbc457bc48ea9a53cb3fd99ff5dd7c117a48dc))

### Performance Improvements
* Remove memory leak in AST ([3f9dca9](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/3f9dca932c550b5f13b58a3e04c45a758cf4ff77))
* Simplify replacing of special tokens in errors ([ed36da3](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/ed36da3ac571c934e002c2c5985f1fc87cdb45e6))

## [0.21.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.20.0...0.21.0) (2021-09-09)

### Bug Fixes
* Fix consuming of extra tokens by statements ([c81c25d](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/c81c25d724fb5337ba758f9f11eee71c072d87b9)), closes [#1020](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1020)
* Fix an exception on EXEC variable name ([f684dc5](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/f684dc5c34d7d2b8cb00d529c2ee6ee88ae515fd)), closes [#1077](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1077)
* Fix an exception on OCCURS clause ([fcbeaf2](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/fcbeaf250145123b676d82ed9d5209a5930d5047)), closes [#1071](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1071)
* Fix an exception on incomplete 88 definition ([5486dbf](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/5486dbfac49da55eae4064f22981898576d288af)), closes [#1070](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1070)
* Fix an exception on empty USAGE clause ([24abd6f](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/24abd6f4d41bbb9ef51755f2046e1cd4af5d8d28)), closes [#1074](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1074)
* Fix an exception on END token ([35ab62c](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/35ab62c18f950254e2cf6aadd447c474daa23916)), closes [#1072](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1072) [#1075](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1075)
* Fix an exception on incomplete EXEC statement ([02ab9fa](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/02ab9fa8f4caba04ce96a8b9d07b654e0d7c7d56)), closes [#1076](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1076)
* Fix an exception on incomplete OCCURS TO clause ([4f09357](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/4f09357f4face1580b048c2d20dcef709e83a183))
* Fix an exception on incomplete SET UP statement ([a88d0f4](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/a88d0f41f3c4635bc2ab812a33ec957f05ea1631)), closes [#1093](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1093)
* Fix an exception on SNAP TITLE statement [#1011](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1011) ([a3581ad](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/a3581ad4be78734d50168550d53ec9a499a64a67))
* Fix an exception on empty continuation line ([d96b2f7](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/d96b2f77500ba4f01c2191b94ef8e4cceb7e2bd5)), closes [#1078](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1078)
* Fix an exception on incomplete DECLARATIVES Section ([574cdd4](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/574cdd4d1cb3cdccc059856b55ec8657f7606c3e)), closes [#1095](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1095)
* Fix an exception on incomplete COPY REPLACING statement [#1080](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1080) ([9935151](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/9935151ae6f8ac070be3ece61aa4745ef8e555be))
* Fix an exception on incomplete variable definition ([00ec825](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/00ec8252633350bf9ea225945fd826ba7faf2b7e)), closes [#1079](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1079)
* Fix incorrect error message on EXEC CICS [#965](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/965) ([0333af6](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/0333af6ca777b53d55588c7ca3a063043ab13480))
* Fix server freeze on typos in MAP SECTION ([e54f322](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/e54f322a0b55b67f62882324667af8a325107138)), closes [#1035](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1035)
* Fix syntax check for missing END-PERFORM ([c28f5c7](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/c28f5c7d4caee82becf9ce514965c65fa28a47cf))

### Features
* Support coloring for floating comment ([7d27b66](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/7d27b6640227ca609fe764fbf34bbab95abe9e77)), closes [#1039](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1039)
* Support FD and SD definitions ([8c8109f](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/8c8109f91a0c7e7d4859cfd8726f1c77d460f80b))

### Performance Improvements
* Avoid recursion in position lookup ([9232d47](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/9232d4793239b295639cf970dfe7d17fd655f4f8))
* Optimize identifier rule in CobolParser([494dc1d](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/494dc1ddfd6523be717a06078a82f33cd57fc223))
* Optimize identifier rules in CICSParser ([994e195](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/994e1957f8cfa0e20515a4d69e0e59f5cb473646))
* Optimize PERFORM statement ([bd9dedd](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/bd9deddb3f21dac309d646152258f8df96c78130))
* Remove ambiguities in CONFIGURATION section ([ef954f2](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/ef954f266eef8de0ac47c7d70bbce228d1360eb8))
* Remove ambiguity in GO TO statement ([75da39c](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/75da39c8ad844dae1c903942d0d14fca5d910d4d))
* Remove context dependency on EXEC statements ([72ecfa0](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/72ecfa0504b3d2d6978b515bedb766108010027a))
* Simplify condition rules ([7aaa3c9](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/7aaa3c9591a52e4024dc2d650894b07013ca1126))
* Simplify DISPLAY statement grammar ([b0b8568](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/b0b8568791bd1cd8ada2f50e83563b6475ec2c4a))
* Simplify table calls to decrease ambiguity ([bd7e921](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/bd7e921bd1badb855f547f8668dfd38a7783a443))
* Simplify WRITE statements ([63b4bbc](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/63b4bbc451b8386d9169585486abb66995d48f29))

## [0.20.0](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.19.1...0.20.0) (2021-07-22)

### Bug Fixes
* Allow semicolons as statement terminators ([127d7b8](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/127d7b8f76bd4152dfdfffaf43a17be1127a164e)), closes [#998](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/998)
* Allow TOP as an identifier [#1004](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1004) ([95d02be](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/95d02be8584a0284f336513645b70b347e5ffef7))
* Fix syntax analysis with misplaced indicators ([52aced7](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/52aced7016da3e9b517e264a0c81f222e5bf6728)), closes [#1013](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/1013)
* Maintain string length while replacing [#974](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/974) ([4d2ae8b](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/4d2ae8b6f7b5cdfbf6132473b9be957b31b856e8))

### Features
* Add support for IDMS COPY statements [#704](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/704) ([fbbc52f](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/fbbc52f7b9b6facb7df7465af75169ccda8db48c))
* Add support for COPY MAID statements [#986](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/986) ([ab29eb5](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/ab29eb5cfab4f5d5f4124ad9044c4e2f6b387838))
* Add variable support in IDMS statements [#963](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/963) ([b1b04c6](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/b1b04c669da5926d15aebaf46cbca1bfd45a8de5))
* Show condition names in variable description ([d9049d7](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/d9049d728da3af36ec5739c28bcd5e6093603ede)), closes [#994](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/994)

## [0.19.1](https://github.com/eclipse/che-che4z-lsp-for-cobol/compare/0.19.0...0.19.1) (2021-06-25)

### Bug Fixes
* Allow IDMS statements in conditional blocks [#952](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/952) ([5b2ea84](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/5b2ea84f9b3368c56a82062d49767755426ba39b))
* Clarify error message for invalid definition ([4918a18](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/4918a18ae5682242b1328075fe2a84eee9089156)), closes [#979](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/979)
* Fix access to undefined element error in no workspace case [#957](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/957) ([0554b52](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/0554b5229f3144d5471e5c89f46232f2c480871b))
* Fix error on multiline optional paragraphs ([77b562e](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/77b562e6e2974497366847bbb4d62b15809b3a85)), closes [#953](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/953)
* Fix hover for group items [#970](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/970) ([1894fc5](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/1894fc5aeb3d72a648140c4f1ec2b07298f17db0))
* Fix incorrect IF statement parsing [#828](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/828) ([04484d7](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/04484d72b3a6d7925f3794c6e8d44718d39b2f5a))
* Fix loading copybooks with any encoding [#956](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/956) ([b6f00e8](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/b6f00e832246439e4aa5d27e92496cf10cccc1ae))
* Make analyse exceptions propagate to Extended API responses [#960](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues/960) ([91fae1b](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/91fae1b5fea4983e7a9a9d4dad9ca08fdde5d238))
* Add new node type to CFAST to fix the conditional stop issue ([9894793](https://github.com/eclipse/che-che4z-lsp-for-cobol/commit/9894793608b93fbf61edf810ebb190743dd4d301))

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
