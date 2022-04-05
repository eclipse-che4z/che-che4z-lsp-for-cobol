# Changelog
All notable changes to the COBOL Language Support extension are documented in this file.

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
