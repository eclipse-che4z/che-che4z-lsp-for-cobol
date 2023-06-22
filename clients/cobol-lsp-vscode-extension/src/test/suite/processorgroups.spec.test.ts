/*
 * Copyright (c) 2022 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */

import * as assert from "assert";
import * as helper from "./testHelper";
import * as vscode from "vscode";
import * as path from "path";
import * as fs from "fs";
import { getWorkspacePath } from "./testHelper";

interface PgmConf {
  program: string;
  pgroup: string;
}

function remove_pgm_cfg(pgmConf: PgmConf) {
  const pgm_conf_path = path.join(getWorkspacePath(), ".cobolplugin", "pgm_conf.json");
  const fileContents = fs.readFileSync(pgm_conf_path, 'utf8');
  const pgmConfs = JSON.parse(fileContents);
  pgmConfs.pgms = pgmConfs.pgms.filter(
    (obj: PgmConf) => obj.program !== pgmConf.program && obj.pgroup !== pgmConf.pgroup
  );
  const updatedJson = JSON.stringify(pgmConfs, null, 4);
  fs.writeFileSync(pgm_conf_path, updatedJson, 'utf8');
}

function add_pgm_cfg(pgmConf: PgmConf) {
  const pgm_conf_path = path.join(getWorkspacePath(), ".cobolplugin", "pgm_conf.json");
  const fileContents = fs.readFileSync(pgm_conf_path, 'utf8');
  const pgmConfs = JSON.parse(fileContents);
  pgmConfs.pgms.push(pgmConf);
  const updatedJson = JSON.stringify(pgmConfs, null, 4);
  fs.writeFileSync(pgm_conf_path, updatedJson, 'utf8');
}

suite("Integration Test Suite: Processor Groups", function () {
  suiteSetup(async function () {
    this.timeout(helper.TEST_TIMEOUT);
    helper.updateConfig("basic.json");
    await helper.activate();
  });

  const idmsPgmConf = { "program": "cobol-idms/*", "pgroup": "IDMS" };
  const dacoPgmConf = { "program": "cobol-daco/*", "pgroup": "DaCo" };

  this.afterEach(async () => await helper.closeAllEditors()).timeout(
    helper.TEST_TIMEOUT,
  );

  // cobol-dialect-api (development) npm install && npm run compile
  // daco-dialect-support (development) npm install && npm run package
  // idms-dialect-support (development) npm install && npm run package
  // put server.jar, dialect-idms.jar and dialect-daco.jar into their server/jar folder

  test("TC355920: IDMS - processor group", async () => {
    add_pgm_cfg(idmsPgmConf)
    const extSrcPath = path.join("cobol-idms", "DACRFI11N.cbl");
    await helper.showDocument(extSrcPath);
    const editor = helper.get_editor(extSrcPath);
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
    await helper.closeAllEditors();
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);
  
  test("TC355921: DaCo - processor group", async () => {
    add_pgm_cfg(dacoPgmConf)
    const extSrcPath = path.join("cobol-daco", "DABPA11N.cbl");
    await helper.showDocument(extSrcPath);
    const editor = helper.get_editor(extSrcPath);
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
    await helper.closeAllEditors();
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC355918: IDMS - No processor group", async () => {
    remove_pgm_cfg(idmsPgmConf)
    const extSrcPath = path.join("cobol-idms", "DACRFI11N.cbl");
    await helper.showDocument(extSrcPath);
    const editor = helper.get_editor(extSrcPath);
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length == 1,
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    await helper.closeAllEditors();
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC355919: DaCo - No processor group", async () => {
    remove_pgm_cfg(dacoPgmConf)
    const extSrcPath = path.join("cobol-daco", "DABPA11N.cbl");
    await helper.showDocument(extSrcPath);
    const editor = helper.get_editor(extSrcPath);
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length == 1,
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    await helper.closeAllEditors();
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);
});
