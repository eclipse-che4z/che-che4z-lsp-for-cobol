/*
 * Generate fixed-format COBOL fixtures from the parameterized Java IDMS usecases.
 * Run from this package with `node scripts/generate-java-usecase-fixtures.cjs`.
 */

const fs = require("node:fs");
const path = require("node:path");

const javaDirectory = path.resolve(
  __dirname,
  "../../../server/dialect-idms/src/test/java/org/eclipse/lsp/cobol/dialects/idms/usecases",
);
const outputDirectory = path.resolve(__dirname, "../test_files/parameterized");
const manifestFile = path.join(outputDirectory, "manifest.json");
const previousFiles = fs.existsSync(manifestFile)
  ? JSON.parse(fs.readFileSync(manifestFile, "utf8"))
      .map((entry) => entry.file)
      .filter((file) => file?.startsWith("parameterized/"))
  : [];
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

const entries = [];
for (const javaFile of fs
  .readdirSync(javaDirectory)
  .filter((name) => name.endsWith(".java"))) {
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
          file: `parameterized/${file}`,
          diagnostics: cleaned.diagnostics.map((diagnostic) => ({
            ...diagnostic,
            message: `Variable ${diagnostic.name} is not defined`,
          })),
        });
        continue;
      }
      entries.push({
        ...item,
        status: "deferred",
        reason:
          "Name-length or SUBSCHEMA-NAMES LENGTH diagnostic; covered by the IDMS-specific diagnostics story",
      });
      continue;
    }
    if (!cleaned.text.includes("PROCEDURE DIVISION.")) {
      const key = `${javaClass}/${variant.name}`;
      if (key === "TestIdmsSections/IDMSSS_NO_CS_NO_VERSION") {
        entries.push({
          ...item,
          status: "deferred",
          reason:
            "Subschema name exceeds eight characters; covered by the IDMS-specific diagnostics story",
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
    const lines = cleaned.text.split("\n");
    const omittedUsages = [];
    const usages = cleaned.usages
      .filter((usage) => definitions.get(usage.name)?.length === 1)
      .flatMap((usage) => {
        const definition = definitions.get(usage.name)[0];
        const prefix = lines[usage.line].slice(0, usage.character);
        if (/\bON\s+$/i.test(prefix)) {
          omittedUsages.push({
            ...usage,
            reason:
              "ON path-status references are not mapped by the TypeScript dialect yet",
          });
          return [];
        }
        if (/\bINDEXED\s+BY\b/i.test(lines[definition.line])) {
          omittedUsages.push({
            ...usage,
            reason:
              "INDEXED BY names are not navigable through dialect mapping yet",
          });
          return [];
        }
        return [{ ...usage, definitionLine: definition.line }];
      });
    if (usages.length === 0) {
      entries.push({
        ...item,
        status: omittedUsages.length ? "knownGap" : "notApplicable",
        reason: omittedUsages.length
          ? "Its only Java-marked references are not yet navigable in the TypeScript port"
          : "Literal/option-only parser permutation with no Java-marked reference or expected diagnostic; no distinct editor result to assert",
        ...(omittedUsages.length ? { omittedUsages } : {}),
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
      file: `parameterized/${file}`,
      usages,
      ...(!expectSentinel ? { expectSentinel: false } : {}),
      ...(omittedUsages.length ? { omittedUsages } : {}),
    });
  }
}
fs.mkdirSync(outputDirectory, { recursive: true });
const currentFiles = new Set(
  entries.map((entry) => entry.file).filter(Boolean),
);
for (const file of previousFiles) {
  if (!currentFiles.has(file)) {
    const previousPath = path.resolve(outputDirectory, path.basename(file));
    if (path.dirname(previousPath) !== outputDirectory) {
      throw new Error(`Refusing to remove fixture outside ${outputDirectory}`);
    }
    fs.unlinkSync(previousPath);
  }
}
fs.writeFileSync(manifestFile, JSON.stringify(entries, null, 2) + "\n");
const counts = entries.reduce((result, entry) => {
  result[entry.status] = (result[entry.status] || 0) + 1;
  return result;
}, {});
process.stdout.write(`${entries.length} variants: ${JSON.stringify(counts)}\n`);
