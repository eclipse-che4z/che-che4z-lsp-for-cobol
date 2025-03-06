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
import { Location } from "./cfast";
import { Node } from "./Node";

export class GraphDTO {
  id: number;
  programName: string;
  location: Location;
  nodes: [number, Node][];
  edges: [number, number[]][];

  constructor(
    id: number,
    programName: string,
    location: Location,
    nodes: [number, Node][],
    edges: [number, number[]][],
  ) {
    this.id = id;
    this.programName = programName;
    this.location = location;
    this.nodes = nodes;
    this.edges = edges;
  }
}
