<!---
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
-->

# COBOL LS positive tests in VS Code

This project runs the COBOL Language Support extension inside a real VS Code instance over a folder tree you provide. For every program it checks two things:

- The analysis has no errors.
- If a snapshot exists, the definitions and references found by the language server match it.

It is the client-side counterpart of the engine's `PositiveTest`, with no test data or configuration built into the engine.

## Input layout

Pass a root folder. A **test folder** is any folder below it (including the root) that contains `.cobolplugin/pgm_conf.json`. Test folders can be nested: a test folder tests the programs matched by its own `pgm_conf.json`, except the ones inside a nested test folder, which are tested with that folder's configuration.

Each test folder is opened as its own workspace, so copybooks, dialects and the other settings come from its `.cobolplugin` (`proc_grps.json`, `pgm_conf.json`), exactly as for a user.

```
<root>/
  <any>/<nesting>/<test-folder>/
    .cobolplugin/
      proc_grps.json
      pgm_conf.json          "program" globs select the files to test
    <programs and copybooks, any layout>
    compileListing/snapshot/ optional: <program file name> -> expected results
    .positive-include        optional: globs, one per line; only matching programs are tested
    .snapshot-ignore         optional: program file names whose snapshot is not compared
```

- **Programs:** every file in the test folder matched by a `pgms[].program` glob. Matching is relative to the test folder and case-insensitive, the same as the extension. `.cobolplugin`, `.vscode` and `compileListing` are not searched.
- **`.positive-include`:** narrows the programs to test without touching `pgm_conf.json`, which still configures every program. For example, `COBPGM/Working/*` tests only the programs that are expected to work. Lines starting with `#` are comments.
- **Snapshots:** they use the same format as `tests/test_files/Cobol85PositiveTestsSuite/compileListing/snapshot`. There are three sections, `DATA_NAMES`, `PROCEDURES` and `PROGRAMS`, and each row is `<definition>\t<name>\t<comma separated references>`. Positions are either 1-based line numbers or 0-based ranges `line:char-line:char`.
- **Without a snapshot,** only the no-errors check runs.

## Running

The tests use the extensions of this repository, the same way as `clients/cobol-lsp-vscode-extension/src/test/runTest.ts`: `clients/cobol-lsp-vscode-extension` plus the IDMS, DaCo and sample dialect extensions next to it. Before running, all of them have to be built and contain current jars:

- `server/engine/target/server.jar` copied to `clients/cobol-lsp-vscode-extension/server/jar/`;
- `server/dialect-idms/target/dialect-idms.jar` and `server/dialect-daco/target/dialect-daco.jar` copied to `server/jar/` of their dialect extensions. An outdated dialect jar makes DaCo/IDMS programs time out instead of failing;
- `npm run build` in each extension.

```
npm install
npm test <root folder>
```

| Environment variable             | Meaning                                                                                       |
| -------------------------------- | --------------------------------------------------------------------------------------------- |
| `POSITIVE_TESTS_ROOT`            | root folder, if not given as an argument                                                      |
| `POSITIVE_TESTS_FILTER`          | regular expression, only test folders whose path matches are run                              |
| `POSITIVE_TESTS_TIMEOUT`         | timeout per program in ms, default `150000`                                                   |
| `POSITIVE_TESTS_SNAPSHOT_IGNORE` | comma separated program file names whose snapshot is not compared                             |

Test folders run one after another, each in a fresh VS Code instance with a new user data folder. A summary lists each test folder with PASS or FAIL, and the process exits non-zero if any folder fails. The VS Code logs of a failed folder, including the COBOL Language Support output, are kept in `logs/<folder>-<timestamp>/`.

### Dialects (IDMS, DaCo)

A program uses a dialect when its processor group in `proc_grps.json` has a `preprocessor` entry such as `{"name": "IDMS", "libs": [...]}`. Dialect copybooks are resolved from those `libs`, just as in the extension. DaCo needs IDMS as well, e.g. `"preprocessor": [{"name": "DaCo", ...}, {"name": "IDMS", ...}]`.

Before the first program is opened, the suite activates the dialect extensions, which waits for them to register with the COBOL extension.

## How it works

The runner `src/runTest.ts` finds the test folders and starts VS Code for each one. Inside VS Code, `src/suite/positive.test.ts` opens every program and calls the `analysisResult(uri)` API exported by the COBOL extension. That API sends the `extended/analysisResult` request, and the server answers with the programs, variables, procedures, copybooks and diagnostics of the last analysis. The results are checked by:

- `src/lib/assertions.ts`: a port of `PositiveTestUtility` and `PositiveTest.assertNoError`;
- `src/lib/snapshot.ts`: a port of `SnapshotReader`.
