/*
 * Generate fixed-format COBOL fixtures and explicit TypeScript tests from the
 * parameterized Java IDMS usecases.
 * Run from this package with `node scripts/generate-java-usecase-fixtures.cjs`.
 */

const fs = require("node:fs");
const path = require("node:path");
const prettier = require("prettier");

const javaDirectory = path.resolve(
  __dirname,
  "../../../server/dialect-idms/src/test/java/org/eclipse/lsp/cobol/dialects/idms/usecases",
);
const outputDirectory = path.resolve(__dirname, "../test_files/usecase");
const testFile = path.resolve(
  __dirname,
  "../src/test/suite/java_usecases.test.ts",
);
const javaUrl =
  "https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob/development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol/dialects/idms/usecases/";
const dedicatedCoverage = {
  "TestIdmsControlSectionAll/IDMSCS_WITH_ALL_CLAUSES": "ControlWorking.cbl",
  "TestIdmsControlSectionAll/IDMSCS_WITH_ALL_CLAUSES_PUNCT":
    "ControlLinkage.cbl",
  "TestIdmsControlSectionAll/IDMSCS_WITH_SSN_IDMSREC": "ControlIncrement.cbl",
  "TestIdmsControlSectionAll/IDMSCS_WITH_ONLY_PROTOCOL": "ControlProtocol.cbl",
  "TestIdmsControlSectionAll/IDMSCS_MANUAL": "MixedCopybooks.cbl",
  "TestIdmsSections/IDMSSS_WITH_ALL_CLAUSES": "ControlWorking.cbl",
  "TestIdmsSections/IDMSMS_WITH_ALL_CLAUSES": "MapDefinition002.cbl",
};
const genericUndefinedVariableDiagnostics = new Set([
  "TestAttachTaskCode",
  "TestChangePriority",
]);
const idmsDiagnosticTypes = {
  TestIdmsBindStatement: { 1: "procedure name" },
  TestIdmsLoadStatement: {
    1: "table name",
    2: "node name",
    3: "dictionary name",
  },
  TestIdmsReadyStatement: { 1: "db entity name" },
  TestIdmsSections: {
    1: "subschema name",
    2: "schema name",
    3: "map name",
  },
  TestIdmsStartpageStatement: { 1: "map name" },
  TestIdmsTransferStatement: { 1: "program name" },
};

function idmsDiagnosticMessage(javaClass, diagnostic) {
  if (javaClass === "TestIdmsControlSectionAll") {
    return `The length ${diagnostic.name} is not allowed. Allowed values are 16, 18.`;
  }
  const type = idmsDiagnosticTypes[javaClass]?.[diagnostic.id];
  if (!type)
    throw new Error(`Unknown IDMS diagnostic ${javaClass}/${diagnostic.id}`);
  const length = type === "db entity name" ? 16 : 8;
  return `Max length limit of ${length} bytes allowed for ${type}.`;
}

function readExpression(source, start) {
  let quoted = false;
  let escaped = false;
  for (let index = start; index < source.length; index++) {
    const character = source[index];
    if (quoted) {
      if (escaped) escaped = false;
      else if (character === "\\") escaped = true;
      else if (character === '"') quoted = false;
    } else if (character === '"') {
      quoted = true;
    } else if (character === ";") {
      return source.slice(start, index).trim();
    }
  }
  throw new Error("Unterminated Java expression");
}

function splitArguments(expression) {
  const argumentsList = [];
  let start = 0;
  let depth = 0;
  let quoted = false;
  let escaped = false;
  for (let index = 0; index < expression.length; index++) {
    const character = expression[index];
    if (quoted) {
      if (escaped) escaped = false;
      else if (character === "\\") escaped = true;
      else if (character === '"') quoted = false;
    } else if (character === '"') {
      quoted = true;
    } else if (character === "(") {
      depth++;
    } else if (character === ")") {
      depth--;
    } else if (character === "," && depth === 0) {
      argumentsList.push(expression.slice(start, index).trim());
      start = index + 1;
    }
  }
  argumentsList.push(expression.slice(start).trim());
  return argumentsList;
}

function evaluate(expression, constants) {
  const names = Object.keys(constants);
  return Function(
    ...names,
    `return (${expression});`,
  )(...names.map((name) => constants[name]));
}

function readConstants(source) {
  const declarations = [];
  const pattern = /(?:private|public)\s+static\s+final\s+String\s+(\w+)\s*=/g;
  for (const match of source.matchAll(pattern)) {
    declarations.push({
      name: match[1],
      expression: readExpression(source, match.index + match[0].length),
    });
  }
  const constants = {};
  for (const declaration of declarations) {
    constants[declaration.name] = evaluate(declaration.expression, constants);
  }
  return constants;
}

function readVariants(source, constants) {
  const start = source.indexOf("return Stream.of(");
  if (start < 0) throw new Error("Missing Stream.of");
  const expression = readExpression(source, start + "return ".length);
  const opening = expression.indexOf("Stream.of(") + "Stream.of(".length;
  let depth = 1;
  let closing = opening;
  while (depth > 0 && closing < expression.length) {
    if (expression[closing] === "(") depth++;
    if (expression[closing] === ")") depth--;
    closing++;
  }
  const prefixed = /\.map\(s\s*->\s*BOILERPLATE\s*\+\s*s\)/.test(
    expression.slice(closing),
  );
  return splitArguments(expression.slice(opening, closing - 1)).map(
    (value) => ({
      name: value.split("+").at(-1).trim(),
      text:
        (prefixed ? constants.BOILERPLATE : "") + evaluate(value, constants),
    }),
  );
}

function positionAt(text, offset) {
  const preceding = text.slice(0, offset);
  const line = (preceding.match(/\n/g) || []).length;
  return { line, character: offset - preceding.lastIndexOf("\n") - 1 };
}

function normalizeProcedureIndent(source) {
  let procedure = false;
  return source
    .split("\n")
    .map((line) => {
      if (/^\s*PROCEDURE DIVISION\./i.test(line)) {
        procedure = true;
        return line;
      }
      if (!procedure || !line.trim()) return line;
      const leading = /^ */.exec(line)[0].length;
      // The Java engine does not impose fixed-format Area B, but the VS Code
      // integration host does. Keep the statement text while making it valid.
      return leading >= 7 && leading < 11
        ? " ".repeat(11 - leading) + line
        : line;
    })
    .join("\n");
}

function cleanMarkup(source) {
  let text = "";
  const definitions = [];
  const usages = [];
  const diagnostics = [];
  let cursor = 0;
  for (const match of source.matchAll(/\{([^{}]+)\}/g)) {
    text += source.slice(cursor, match.index);
    const marker = match[1];
    const variable = /^\$(\*?)([^|]+?)(?:\|(\d+))?$/.exec(marker);
    const diagnostic = /^([^|]+)\|(\d+)$/.exec(marker);
    if (!variable && !diagnostic) {
      throw new Error(`Unknown Java usecase marker: ${marker}`);
    }
    const value = variable ? variable[2] : diagnostic[1];
    const at = positionAt(text, text.length);
    if (variable) {
      (variable[1] ? definitions : usages).push({ name: value, ...at });
      if (variable[3])
        diagnostics.push({ name: value, id: variable[3], ...at });
    } else {
      diagnostics.push({ name: value, id: diagnostic[2], ...at });
    }
    text += value;
    cursor = match.index + match[0].length;
  }
  text += source.slice(cursor);
  return { text, definitions, usages, diagnostics };
}

function fixtureText(text, javaFile, withSentinel = true) {
  let program = text.trimEnd().replace(/\r\n/g, "\n");
  if (!program.endsWith(".") && !program.endsWith(";")) program += ".";
  program += withSentinel
    ? "\n           DISPLAY NOT-EXISTING.\n           STOP RUN.\n"
    : "\n";
  program +=
    "      * Java usecase:\n" +
    "      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob\n" +
    "      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol\n" +
    `      */dialects/idms/usecases/${javaFile}\n`;
  return program;
}

function renderTests(entries) {
  const lines = [
    "/*",
    " * Copyright (c) 2026 Broadcom.",
    ' * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.',
    " *",
    " * This program and the accompanying materials are made",
    " * available under the terms of the Eclipse Public License 2.0",
    " * which is available at https://www.eclipse.org/legal/epl-2.0/",
    " *",
    " * SPDX-License-Identifier: EPL-2.0",
    " *",
    " * Generated by scripts/generate-java-usecase-fixtures.cjs.",
    " */",
    "",
    'import * as vscode from "vscode";',
    'import * as helper from "./testHelper";',
    "",
    'suite("Java IDMS usecases", function () {',
    "  this.timeout(helper.TEST_TIMEOUT);",
    "  suiteSetup(async () => helper.activate());",
    "  this.afterEach(async () => helper.closeAllEditors());",
    "  this.afterAll(async () => helper.closeAllEditors());",
  ];
  let currentClass;
  for (const entry of entries) {
    if (entry.javaClass !== currentClass) {
      if (currentClass) lines.push("  });");
      currentClass = entry.javaClass;
      lines.push(
        "",
        `  // Java usecase: ${entry.javaUsecase}`,
        `  suite(${JSON.stringify(entry.javaClass)}, function () {`,
      );
    }
    const title = JSON.stringify(entry.variant);
    if (entry.status === "integration") {
      lines.push(
        `  test(${title}, async () => {`,
        `    const editor = await helper.${
          entry.expectSentinel === false
            ? "showDocument"
            : "openWithoutIdmsErrors"
        }(${JSON.stringify(entry.file)});`,
      );
      for (const usage of entry.usages) {
        lines.push(
          `    await helper.checkDefinition(editor, new vscode.Position(${usage.line}, ${usage.character}), ${usage.definitionLine}); // ${usage.name}`,
        );
      }
      lines.push("  });", "");
      continue;
    }
    if (entry.status === "diagnostic") {
      lines.push(
        `  test(${title}, async () => {`,
        `    const editor = await helper.showDocument(${JSON.stringify(
          entry.file,
        )});`,
        "    const diagnostics = await helper.waitForDiagnosticMessages(",
        "      editor.document.uri,",
        "      [",
      );
      for (const diagnostic of entry.diagnostics) {
        lines.push(`        ${JSON.stringify(diagnostic.message)},`);
      }
      lines.push("      ],", "    );");
      for (const diagnostic of entry.diagnostics) {
        lines.push(
          "    helper.checkDiagnostic(",
          "      diagnostics,",
          `      ${JSON.stringify(diagnostic.message)},`,
          `      new vscode.Range(${diagnostic.line}, ${
            diagnostic.character
          }, ${diagnostic.line}, ${
            diagnostic.character + diagnostic.name.length
          }),`,
          ...(entry.idmsSpecific
            ? [
                "      vscode.DiagnosticSeverity.Error,",
                '      "COBOL Language Support (dialect)",',
              ]
            : []),
          "    );",
        );
      }
      lines.push("  });", "");
      continue;
    }
    if (entry.status === "smoke") {
      lines.push(`  test(${title}, async () => {`);
      lines.push(
        "    // TODO: Add a statement-specific editor assertion when one is available.",
      );
      lines.push(
        `    await helper.openWithoutIdmsErrors(${JSON.stringify(
          entry.file,
        )});`,
        "  });",
        "",
      );
      continue;
    }
    if (entry.status === "valid") {
      lines.push(
        `  test(${title}, async () => {`,
        `    await helper.openWithoutIdmsErrors(${JSON.stringify(
          entry.file,
        )});`,
        "  });",
        "",
      );
      continue;
    }
    if (entry.status === "dedicated") {
      lines.push(
        `  // ${entry.variant}: covered by the dedicated ${entry.file} integration test.`,
      );
      continue;
    }
    throw new Error(`Unknown coverage status: ${entry.status}`);
  }
  if (currentClass) lines.push("  });");
  lines.push("});", "");
  return lines.join("\n");
}

const entries = [];
for (const javaFile of fs
  .readdirSync(javaDirectory)
  .filter((name) => name.endsWith(".java"))
  .sort()) {
  const source = fs.readFileSync(path.join(javaDirectory, javaFile), "utf8");
  if (!source.includes("@ParameterizedTest")) continue;
  const constants = readConstants(source);
  for (const variant of readVariants(source, constants)) {
    const javaClass = javaFile.slice(0, -5);
    const item = {
      javaClass,
      variant: variant.name,
      javaUsecase: javaUrl + javaFile,
    };
    const cleaned = cleanMarkup(normalizeProcedureIndent(variant.text));
    if (cleaned.diagnostics.length) {
      if (genericUndefinedVariableDiagnostics.has(javaClass)) {
        const file = `${javaClass}_${variant.name}.cbl`;
        fs.mkdirSync(outputDirectory, { recursive: true });
        fs.writeFileSync(
          path.join(outputDirectory, file),
          fixtureText(cleaned.text, javaFile),
        );
        entries.push({
          ...item,
          status: "diagnostic",
          file: `usecase/${file}`,
          diagnostics: cleaned.diagnostics.map((diagnostic) => ({
            ...diagnostic,
            message: `Variable ${diagnostic.name} is not defined`,
          })),
        });
        continue;
      }
      const file = `${javaClass}_${variant.name}.cbl`;
      fs.mkdirSync(outputDirectory, { recursive: true });
      fs.writeFileSync(
        path.join(outputDirectory, file),
        fixtureText(
          cleaned.text,
          javaFile,
          cleaned.text.includes("PROCEDURE DIVISION."),
        ),
      );
      entries.push({
        ...item,
        status: "diagnostic",
        idmsSpecific: true,
        file: `usecase/${file}`,
        diagnostics: cleaned.diagnostics.map((diagnostic) => ({
          ...diagnostic,
          message: idmsDiagnosticMessage(javaClass, diagnostic),
        })),
      });
      continue;
    }
    if (!cleaned.text.includes("PROCEDURE DIVISION.")) {
      const key = `${javaClass}/${variant.name}`;
      if (key === "TestIdmsSections/IDMSSS_NO_CS_NO_VERSION") {
        // EMPSS012 is exactly eight characters, not an invalid name.
        const file = `${javaClass}_${variant.name}.cbl`;
        fs.mkdirSync(outputDirectory, { recursive: true });
        fs.writeFileSync(
          path.join(outputDirectory, file),
          fixtureText(cleaned.text + "        PROCEDURE DIVISION.\n", javaFile),
        );
        entries.push({
          ...item,
          status: "valid",
          file: `usecase/${file}`,
        });
        continue;
      }
      const file = dedicatedCoverage[key];
      if (!file) throw new Error(`No integration fixture for ${key}`);
      entries.push({
        ...item,
        status: "dedicated",
        file,
        reason:
          "Covered by a dedicated integration test with an observable result",
      });
      continue;
    }

    const definitions = new Map();
    for (const definition of cleaned.definitions) {
      const values = definitions.get(definition.name) || [];
      values.push(definition);
      definitions.set(definition.name, values);
    }
    const usages = cleaned.usages
      .filter((usage) => definitions.get(usage.name)?.length === 1)
      .map((usage) => ({
        ...usage,
        definitionLine: definitions.get(usage.name)[0].line,
      }));
    if (usages.length === 0) {
      const file = `${javaClass}_${variant.name}.cbl`;
      fs.mkdirSync(outputDirectory, { recursive: true });
      fs.writeFileSync(
        path.join(outputDirectory, file),
        fixtureText(cleaned.text, javaFile),
      );
      entries.push({
        ...item,
        status: "smoke",
        file: `usecase/${file}`,
      });
      continue;
    }
    const file = `${javaClass}_${variant.name}.cbl`;
    fs.mkdirSync(outputDirectory, { recursive: true });
    const expectSentinel =
      javaClass !== "TestAbendCode" &&
      !(javaClass === "TestIdmsAcceptDbStatements" && variant.name === "TST2");
    fs.writeFileSync(
      path.join(outputDirectory, file),
      fixtureText(cleaned.text, javaFile, expectSentinel),
    );
    entries.push({
      ...item,
      status: "integration",
      file: `usecase/${file}`,
      usages,
      ...(!expectSentinel ? { expectSentinel: false } : {}),
    });
  }
}
fs.mkdirSync(outputDirectory, { recursive: true });
fs.writeFileSync(
  testFile,
  prettier.format(renderTests(entries), {
    ...prettier.resolveConfig.sync(testFile),
    filepath: testFile,
  }),
);
const counts = entries.reduce((result, entry) => {
  result[entry.status] = (result[entry.status] || 0) + 1;
  return result;
}, {});
process.stdout.write(`${entries.length} variants: ${JSON.stringify(counts)}\n`);
