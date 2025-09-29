/*
 * Copyright (c) 2025 Broadcom.
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
import {
  CFASTNode,
  Goto,
  Location,
  Paragraph,
  Perform,
  Program,
  Section,
} from "./model/cfast";
import { Graph } from "./model/Graph";
import { VirtualProcessor } from "./vm/vp";
import { IbmOptimizer } from "./vm/optimizer";
import { ProgramListing } from "./vm/listing";
import {
  DEAD_CODE,
  NOT_SUPPORTED_STATEMENT,
  MAX_VM_COUNT_REACHED,
  SOURCE,
  FALL_THRU_MESSAGE,
} from "./consts";
import { VirtualProcessorListener } from "./vm/listener";
import {
  CobolInstruction,
  GotoInstruction,
  PerformInstruction,
  ProgramUnit,
} from "./vm/instructions";
import { createRange } from "./utils";
import {
  DiagnosticDto,
  DiagnosticSeverityDto,
  DiagnosticTagDto,
  EventDto,
  LocationDto,
  RangeDto,
} from "./model/external";
import { Channel } from "./vm/logger";

export class EngineProcessingResult {
  enters: Graph[] = [];
  locations: string[] = [];
  diagnostics: Map<string, DiagnosticDto[]> = new Map<
    string,
    DiagnosticDto[]
  >();
  events: EventDto[] = [];
}

const TELEMETRY_ANALYSIS_LIMIT = "ccf.analysis.limit";

/**
 * Graph Builder
 */
export class GraphBuilder {
  private graph: Graph;

  public constructor(head: Program) {
    this.graph = new Graph(head);
  }

  public getGraph(): Graph {
    return this.graph;
  }

  /**
   * Add a link from node 1 to node 2
   * @param node1 node 1
   * @param node2 node 2
   */
  public addLink(
    node1: Paragraph | Section | Program,
    node2: Paragraph | Section | Program,
  ) {
    let existing1 = this.graph.getNode(node1.id);
    let existing2 = this.graph.getNode(node2.id);
    if (!existing1) {
      const _node1 = this.graph.createNode(node1);
      this.graph.addNode(_node1);
      existing1 = _node1;
    }
    if (!existing2) {
      const _node2 = this.graph.createNode(node2);
      _node2.parentId = existing1.id;
      this.graph.addNode(_node2);
      existing2 = _node2;
    }

    this.graph.addOrAppendEdge(existing1.id, existing2.id);
  }
}

/**
 * Controll Flow Graph builder.
 */
export class ControlFlowGraphBuilder {
  public constructor(
    private maxVMCount: number,
    private deadCodeSeverity: DiagnosticSeverityDto | undefined,
    private channel?: Channel,
  ) {}

  /**
   * Generates Control Flow Graph from CFAST.
   * @param programs roots of Control Flow Abstract Tree
   * @returns Entry nodes of Control Flow Graphs
   */
  public build(programs: Program[]): EngineProcessingResult {
    const diagnostics = new Map<string, DiagnosticDto[]>();
    const events: EventDto[] = [];
    const locationsSet = new Set<string>();

    const enters = programs.map((program) => {
      const listing = new ProgramListing(program);
      listing.getUris().forEach((uri) => locationsSet.add(uri));

      const listener = new BuildGraphListener(program, diagnostics, events);
      const optimizer = new IbmOptimizer();

      const processor = new VirtualProcessor(
        listing,
        listener,
        optimizer,
        this.maxVMCount,
        this.channel,
      );
      processor.run();

      if (this.deadCodeSeverity !== undefined) {
        const deadCodeCollector = new DeadCodeCollector(this.deadCodeSeverity);
        deadCodeCollector.collectDeadCodeDiagnostics(
          listing.getInstructions(),
          diagnostics,
        );
      }
      return listener.getGraph();
    });
    const locations = Array.from(locationsSet.values());

    return { enters, locations, diagnostics, events };
  }
}

class BuildGraphListener implements VirtualProcessorListener {
  private readonly builder: GraphBuilder;
  private readonly latestLocation: Location;

  public constructor(
    private program: Program,
    private diagnostics: Map<string, DiagnosticDto[]>,
    private events: EventDto[]
  ) {
    this.builder = new GraphBuilder(program);
    this.latestLocation = {
      uri: program.location.uri,
      start: { character: 1, line: program.location.end.line },
      end: program.location.end,
    };
  }

  public notSupported(location: Location): void {
    BuildGraphListener.report(
      this.diagnostics,
      NOT_SUPPORTED_STATEMENT,
      location,
      DiagnosticSeverityDto.Warning,
    );
  }

  public moveControl(
    node1: Paragraph | Section | Program,
    node2: Paragraph | Section | Program,
  ): void {
    this.builder.addLink(node1, node2);
  }

  public maximumVMCountReached(limit: number): void {
    const location = {
      uri: this.program.location.uri,
      start: { line: 1, character: 1 },
      end: { line: 1, character: 2 },
    };
    BuildGraphListener.report(
      this.diagnostics,
      MAX_VM_COUNT_REACHED,
      location,
      DiagnosticSeverityDto.Warning,
    );
    this.events.push({
      eventName: TELEMETRY_ANALYSIS_LIMIT,
      message: `Graph generation incomplete due to reaching VM limit: ${limit}`,
    });
  }

  public reportFallThru(path: CobolInstruction[]): void {
    BuildGraphListener.report(
      this.diagnostics,
      FALL_THRU_MESSAGE,
      this.latestLocation,
      DiagnosticSeverityDto.Warning,
      path,
    );
  }

  public getGraph(): Graph {
    return this.builder.getGraph();
  }

  protected static toVscodeLocation(location: Location): LocationDto {
    const range: RangeDto = {
      start: {
        line: location.start.line - 1,
        character: location.start.character - 1,
      },
      end: {
        line: location.end.line - 1,
        character: location.end.character - 1,
      },
    };
    return { uri: location.uri, range };
  }

  protected static report(
    diagnostics: Map<string, DiagnosticDto[]>,
    message: string,
    location: Location,
    severity?: DiagnosticSeverityDto,
    stack?: CobolInstruction[],
  ) {
    const arr = diagnostics.get(location.uri) || [];
    const range = BuildGraphListener.toVscodeLocation(location).range;

    const diagnostic: DiagnosticDto = {
      range,
      message,
      severity,
      tags: undefined,
      source: undefined,
      relatedInformation: undefined,
    };
    diagnostic.source = SOURCE;

    if (stack) {
      diagnostic.relatedInformation = [];
      for (let i = stack.length - 1; i >= 0; i--) {
        const initialNode = stack[i].getInitialNode();
        if (initialNode) {
          const vscodeLocation = BuildGraphListener.toVscodeLocation(
            initialNode.location,
          );
          const label = BuildGraphListener.getLabel(stack[i]);
          if (label) {
            diagnostic.relatedInformation.push({
              location: vscodeLocation,
              message: label,
            });
          }
        }
      }
    }

    let found = false;
    for (const existing of arr) {
      if (
        existing.message === diagnostic.message &&
        existing.range.start.line === diagnostic.range.start.line
      ) {
        found = true;
        break;
      }
    }
    if (!found) {
      arr.push(diagnostic);
    }
    diagnostics.set(location.uri, arr);
  }

  private static getLabel(instruction: CobolInstruction): string | undefined {
    const node = instruction.getInitialNode();

    if (instruction instanceof ProgramUnit) {
      if (node?.type === "paragraph") {
        return "PARAGRAPH " + (node as Paragraph).name;
      }
      if (node?.type === "section") {
        return "SECTION " + (node as Section).name;
      }
      return "PROGRAM " + (node as Program).name;
    }

    if (instruction instanceof PerformInstruction) {
      const perform = node as Perform;
      let label = "PERFORM " + perform.targetName;
      if (perform.targetSectionName) {
        label += " OF " + perform.targetSectionName;
      }
      if (perform.thruName) {
        label += " THRU " + perform.thruName;
      }
      if (perform.thruSectionName) {
        label += " OF " + perform.thruSectionName;
      }
      return label;
    }

    if (instruction instanceof GotoInstruction) {
      return "GO TO " + (node as Goto).targetName;
    }

    return undefined;
  }
}

/**
 * Collects diagnostics for a dead code
 */
export class DeadCodeCollector {
  public constructor(private severity: number) {}

  public collectDeadCodeDiagnostics(
    instructions: CobolInstruction[],
    diagnostics: Map<string, DiagnosticDto[]>,
  ) {
    if (instructions.length === 0) {
      return;
    }

    // Update processed flag for parents
    for (const instruction of instructions) {
      if (instruction.isProcessed() && instruction.getInitialNode()) {
        let parent = instruction.getInitialNode()?.parent;
        while (parent && !parent.processed) {
          parent.processed = true;
          parent = parent.parent;
        }
      }
    }

    let items: CFASTNode[] = [];

    for (const instruction of instructions) {
      const node = instruction.getInitialNode();
      if (!node) {
        continue;
      }
      const uri = instruction.getLocation()?.uri;

      if (
        uri &&
        !instruction.isProcessed() &&
        DeadCodeCollector.sameUri(items, uri)
      ) {
        items.push(node);
      } else {
        DeadCodeCollector.addDiagnostic(diagnostics, items, this.severity);
        items = [];
        if (!instruction.isProcessed()) {
          items.push(node);
        }
      }
    }
    DeadCodeCollector.addDiagnostic(diagnostics, items, this.severity);
  }

  private static sameUri(items: CFASTNode[], uri: string): boolean {
    if (items.length === 0) {
      return true;
    }
    return items[0].location?.uri === uri;
  }

  private static addDiagnostic(
    diagnostics: Map<string, DiagnosticDto[]>,
    items: CFASTNode[],
    severity: DiagnosticSeverityDto,
  ) {
    if (!DeadCodeCollector.isValidDiagnostic(items)) {
      return;
    }

    const uri = items[0].location?.uri;
    const docDiagnostics = diagnostics.get(uri) ?? [];
    const diagnostic: DiagnosticDto = {
      range: createRange(items),
      message: DEAD_CODE,
      severity,
      tags: undefined,
      source: undefined,
      relatedInformation: undefined,
    };
    diagnostic.tags = [DiagnosticTagDto.Unnecessary];
    diagnostic.source = SOURCE;

    docDiagnostics.push(diagnostic);
    diagnostics.set(uri, docDiagnostics);
  }

  private static isValidDiagnostic(items: CFASTNode[]): boolean {
    if (items.length > 0) {
      const uri = items[0].location?.uri;
      const result: boolean =
        uri !== undefined &&
        items[items.length - 1].location?.end !== undefined;
      return result;
    }
    return false;
  }
}
