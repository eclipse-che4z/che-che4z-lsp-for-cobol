import * as helper from "../../../test/suite/testHelper";
import * as vscode from "vscode";
import * as assert from "assert";

suite("Web Extension Test Suite: Snippets", () => {
  beforeAll(async () => {
    // helper.updateConfig("basic.json");
    // await helper.activate();
    await helper.sleep(10000);
  });

  test("Sample test Snippets", () => {
    assert.strictEqual(-1, [1, 2, 3].indexOf(5));
    assert.strictEqual(-1, [1, 2, 3].indexOf(0));
  });

  test("Insert Snippet Command", async () => {
    await helper.sleep(10000);

    await helper.showDocument("SNIPPET.cbl");
    await vscode.commands.executeCommand("cobol-lsp.snippets.insertSnippets");
  });
});
