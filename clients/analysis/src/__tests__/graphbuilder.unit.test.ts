import { CFASTNode, NodeId } from "../model/cfast";
import { DeadCodeCollector } from "../graphbuilder";
import { generateLocation } from "../__mocks__/fixtures";
import { CobolInstruction, SimpleCobolInstruction } from "../vm/instructions";
import { VmContext } from "../vm/vm";
import { DiagnosticDto, DiagnosticSeverityDto } from "../model/external";

describe("Test dead code diagnostic", () => {
  it("should not show diagnostic for empty list", () => {
    const list: CobolInstruction[] = [];
    const diagnostics = new Map<string, DiagnosticDto[]>();

    new DeadCodeCollector(
      DiagnosticSeverityDto.Warning,
    ).collectDeadCodeDiagnostics(list, diagnostics);
    expect(diagnostics.size).toBe(0);
  });

  it("should not show diagnostic if every node was processed", () => {
    const list: CobolInstruction[] = [];
    list.push(createNode(1, "uri", true));
    list.push(createNode(2, "uri", true));
    list.push(createNode(3, "uri", true));
    list.push(createNode(4, "uri", true));
    list.push(createNode(5, "uri", true));
    list.push(createNode(6, "uri", true));

    const diagnostics = new Map<string, DiagnosticDto[]>();

    new DeadCodeCollector(
      DiagnosticSeverityDto.Warning,
    ).collectDeadCodeDiagnostics(list, diagnostics);
    expect(diagnostics.size).toBe(0);
  });

  it("should show 1 diagnostic if first node was not proceseed", () => {
    const list: CobolInstruction[] = [];
    list.push(createNode(1, "uri", false));
    list.push(createNode(2, "uri", true));
    list.push(createNode(3, "uri", true));
    list.push(createNode(4, "uri", true));
    list.push(createNode(5, "uri", true));
    list.push(createNode(6, "uri", true));

    const diagnostics = new Map<string, DiagnosticDto[]>();

    new DeadCodeCollector(
      DiagnosticSeverityDto.Warning,
    ).collectDeadCodeDiagnostics(list, diagnostics);
    expect(diagnostics.get("uri")?.length).toBe(1);
  });

  it("should show 1 diagnostic if the last node was not processed", () => {
    const list: CobolInstruction[] = [];
    list.push(createNode(1, "uri", true));
    list.push(createNode(2, "uri", true));
    list.push(createNode(3, "uri", true));
    list.push(createNode(4, "uri", true));
    list.push(createNode(5, "uri", true));
    list.push(createNode(6, "uri", false));

    const diagnostics = new Map<string, DiagnosticDto[]>();

    new DeadCodeCollector(
      DiagnosticSeverityDto.Warning,
    ).collectDeadCodeDiagnostics(list, diagnostics);
    expect(diagnostics.get("uri")?.length).toBe(1);
  });

  it("should show 2 diagnostic for 2 blocks", () => {
    const list: CobolInstruction[] = [];
    list.push(createNode(1, "uri", true));
    list.push(createNode(2, "uri", false));
    list.push(createNode(3, "uri", false));
    list.push(createNode(4, "uri", true));
    list.push(createNode(5, "uri", false));
    list.push(createNode(6, "uri", false));
    list.push(createNode(7, "uri", true));

    const diagnostics = new Map<string, DiagnosticDto[]>();

    new DeadCodeCollector(
      DiagnosticSeverityDto.Warning,
    ).collectDeadCodeDiagnostics(list, diagnostics);
    expect(diagnostics.get("uri")?.length).toBe(2);
  });

  it("should show 2 diagnostic for 2 uris (scenario 1)", () => {
    const list: CobolInstruction[] = [];
    list.push(createNode(1, "uri", true));
    list.push(createNode(2, "uri1", false));
    list.push(createNode(3, "uri2", false));
    list.push(createNode(4, "uri", true));

    const diagnostics = new Map<string, DiagnosticDto[]>();

    new DeadCodeCollector(
      DiagnosticSeverityDto.Warning,
    ).collectDeadCodeDiagnostics(list, diagnostics);
    expect(diagnostics.get("uri1")?.length).toBe(1);
    expect(diagnostics.get("uri2")?.length).toBe(1);
  });

  it("should show 2 diagnostic for 2 uris (scenario 2)", () => {
    const list: CobolInstruction[] = [];
    list.push(createNode(1, "uri", true));
    list.push(createNode(2, "uri1", false));
    list.push(createNode(3, "uri", true));
    list.push(createNode(4, "uri2", false));
    list.push(createNode(5, "uri", true));

    const diagnostics = new Map<string, DiagnosticDto[]>();

    new DeadCodeCollector(
      DiagnosticSeverityDto.Warning,
    ).collectDeadCodeDiagnostics(list, diagnostics);
    expect(diagnostics.get("uri1")?.length).toBe(1);
    expect(diagnostics.get("uri2")?.length).toBe(1);
  });

  it("should not show diagnostic for the section if paragraph was processed", () => {
    const list = [];

    const par: CFASTNode = {
      id: 2,
      children: [],
      type: "paragraph",
      location: generateLocation("uri"),
      parent: undefined,
    };
    const parInst = new SimpleCobolInstruction(par);
    parInst.execute({ ic: 0 } as VmContext);

    const sec: CFASTNode = {
      id: 1,
      children: [par],
      type: "section",
      location: generateLocation("uri"),
      parent: undefined,
    };
    par.parent = sec;
    const secInst = new SimpleCobolInstruction(sec);

    expect(secInst.getLocation()?.uri).toBeDefined();
    expect(parInst.getLocation()?.uri).toBeDefined();

    list.push(secInst);
    list.push(parInst);

    const diagnostics = new Map<string, DiagnosticDto[]>();

    new DeadCodeCollector(
      DiagnosticSeverityDto.Warning,
    ).collectDeadCodeDiagnostics(list, diagnostics);
    expect(diagnostics.size).toBe(0);
  });
});

function createNode(
  id: NodeId,
  uri: string,
  processed?: boolean,
): CobolInstruction {
  const node = {
    id: id,
    children: [],
    type: "paragraph",
    location: generateLocation(uri),
    parent: undefined,
  } as CFASTNode;
  const instruction = new SimpleCobolInstruction(node);
  if (processed) {
    instruction.isProcessed = () => true;
  }
  return instruction;
}
