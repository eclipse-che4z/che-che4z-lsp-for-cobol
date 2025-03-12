import { Program } from "../model/cfast";
import fs from "fs";
import path from "path";
import { ControlFlowGraphBuilder } from "../graphbuilder";
import { Graph } from "../model/Graph";
import { Node } from "../model/Node";
import vscode from "../__mocks__/vscode";

const testsPath = path.join(
  "src",
  "__tests__",
  "__resources__",
  "cfgraph",
  "examples",
);

jest.clearAllMocks();

function compareDots(actual: string, expected: string) {
  const actualArray = actual.split("\n").sort();
  const expectedArray = expected.split("\n").sort();

  expect(actualArray).toStrictEqual(expectedArray);
}

const BEGINNING = "digraph A {\n";
const ENDING = "}";
const LANDSCAPE_MODE = "rankdir=LR";
const SEPERATOR = ";\n";

class DotConverter {
  convert(graph: Graph): string {
    const nodes: Map<number, Node> = graph.getAllNodes();
    const edges: Map<number, Set<number>> = graph.getAllEdges();

    const dotNotation: string[] = [];
    dotNotation.push(LANDSCAPE_MODE);

    edges.forEach((childNodes: Set<number>, key: number) => {
      const fromNode = nodes.get(key);
      childNodes.forEach((toNodeId: number) => {
        const toNode = nodes.get(toNodeId);
        const text = `<${fromNode?.name}>-><${toNode?.name}>`;
        dotNotation.push(text);
      });
    });

    dotNotation.push(ENDING);
    return BEGINNING + dotNotation.join(SEPERATOR);
  }
}

const converter = new DotConverter();

describe("Control Flow Graph builder case tests", () => {
  const testsPath = path.join("src", "__tests__", "__resources__", "cfgraph");
  fs.readdirSync(testsPath)
    .filter((fname) => fname.endsWith("cfast.json"))
    .forEach((fname) => {
      it(`should work for ${fname}`, async () => {
        console.log(`\r\n\r\n\r\n******** Testing ${fname}`);

        const cfastJson = fs.readFileSync(path.join(testsPath, fname));
        const forest: Program[] = JSON.parse(cfastJson.toString());

        const expectedDot = fs.readFileSync(
          path.join(testsPath, fname.replace(".cfast.json", ".result.dot")),
        );
        const controlFlowBuilder = new ControlFlowGraphBuilder(
          40000,
          vscode.DiagnosticSeverity.Warning,
        );

        const start = new Date().getTime();
        const result = controlFlowBuilder.build(forest);
        const end = new Date().getTime();

        console.info(`Test duration, duration: ${end - start} mills`);
        expect(end - start).toBeLessThan(50000);

        expect(result.enters.length).toBe(1);
        const diagnostics = Array.from(result.diagnostics.values()).flatMap(
          (a) => a,
        );

        const resultDots = result.enters.map((graph) =>
          converter.convert(graph),
        );

        expect(resultDots.length).toBe(1);
        compareDots(resultDots[0], expectedDot.toString());

        // Check diagnostics
        const diagnosticsFile = path.join(
          testsPath,
          fname.replace(".cfast.json", ".diagnostics.json"),
        );
        if (diagnostics.length > 0) {
          const diagnosticsStr = JSON.stringify(diagnostics, null, 2);

          const expectedDiagnostics = fs.readFileSync(diagnosticsFile);
          expect(diagnosticsStr).toBe(expectedDiagnostics.toString());
        } else {
          expect(fs.existsSync(diagnosticsFile)).toBeFalsy();
        }
      });
    });
});
