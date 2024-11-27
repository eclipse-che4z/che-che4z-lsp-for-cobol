import * as helper from "./testHelper";
import * as assert from "assert";

suite("Integration Test Suite: Subroutines resolving", () => {
  suiteSetup(async function () {
    this.timeout(0);
    await helper.updateConfig("subroutines.json");
    await helper.activate();
  });

  test("Diagnostics report missing subroutine", async function () {
    await helper.showDocument("CALL.cbl");
    const editor = helper.getEditor("CALL.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    assert.strictEqual(diagnostics[0].message, "SUB2: Subroutine not found");
  });
});
