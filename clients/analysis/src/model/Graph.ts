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
import { Location, Paragraph, Program, Section } from "./cfast";
import { Node } from "./Node";
import { GraphDTO } from "./GraphDTO";

export class Graph {
  private programName: string;
  private location: Location;
  private nodes: Map<number, Node>;
  private edges: Map<number, Set<number>>;

  constructor(private head: Program) {
    this.programName = head.name;
    this.location = head.location;
    this.nodes = new Map();
    this.edges = new Map();
  }

  public getProgramName(): string {
    return this.programName;
  }

  public addNode(node: Node): void {
    this.nodes.set(node.id, node);
  }

  public createNode(node: Paragraph | Section | Program): Node {
    return {
      id: node.id ?? 0,
      parentId: undefined,
      name: (node as Paragraph | Section | Program).name,
      type: node.type,
      details: node.snippet ?? "",
      location: node.location,
    };
  }

  public getNode(id: number | undefined): Node | undefined {
    if (id === undefined) {
      return undefined;
    }
    return this.nodes.get(id);
  }

  public getAllNodes(): Map<number, Node> {
    return this.nodes;
  }

  public addOrAppendEdge(parentId: number, childId: number) {
    const edge: Set<number> | undefined = this.edges.get(parentId);
    if (edge && edge.size > 0) {
      edge.add(childId);
      this.edges.set(parentId, edge);
    } else {
      this.edges.set(parentId, new Set([childId]));
    }
  }

  public getAllEdges(): Map<number, Set<number>> {
    return this.edges;
  }

  public normalize(): GraphDTO {
    return this.createGraphDTO();
  }

  private createGraphDTO(): GraphDTO {
    return {
      id: this.head.id ?? 0,
      programName: this.programName,
      location: this.location,
      nodes: Array.from(this.nodes?.entries()),
      edges: this.getEdges(),
    };
  }

  private getEdges(): [number, number[]][] {
    const edges: [number, Set<number>][] = Array.from(this.edges?.entries());
    const result: [number, number[]][] = [];
    edges.forEach((value: [number, Set<number>]) => {
      result.push([value[0], Array.from(value[1])]);
    });
    return result;
  }

  private programToNode(program: Program): Node {
    return {
      id: 0,
      parentId: undefined,
      name: program.name,
      type: "program",
      details: "",
      location: program.location,
    };
  }
}
