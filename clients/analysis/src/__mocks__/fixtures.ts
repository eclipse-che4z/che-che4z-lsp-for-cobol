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
  Paragraph,
  Perform,
  Program,
  Section,
  Stop,
} from "../model/cfast";

export function createProgram(): Program {
  return {
    id: 0,
    name: "program",
    type: "program",
    location: generateLocation(),
    children: [],
  };
}

export function createPerform(id: number): Perform {
  return {
    id: id,
    type: "perform",
    location: generateLocation(),
    targetName: "target",
  };
}

export function createGoto(id: number): Goto {
  return {
    id: id,
    type: "goto",
    targetName: ["name"],
    location: generateLocation(),
  };
}

export function createParagraph(id: number): Paragraph {
  const paragrah: Paragraph = {
    id: id,
    type: "paragraph",
    name: `paragraph${id}`,
    snippet: "",
    location: generateLocation(),
    children: [],
  };
  return paragrah;
}

export function createSection(id: number): Section {
  const section: Section = {
    id: id,
    type: "section",
    name: `section${id}`,
    snippet: "",
    location: generateLocation(),
    children: [],
  };
  return section;
}

export function createStopRun(id: number): Stop {
  const stop: Stop = {
    id: id,
    type: "stop",
    children: [],
    location: generateLocation(),
  };
  return stop;
}

export function createIf(id: number): CFASTNode {
  const condition: CFASTNode = {
    id: id,
    type: "if",
    location: generateLocation(),
  };
  return condition;
}

export function createElse(id: number): CFASTNode {
  const condition: CFASTNode = {
    id: id,
    type: "else",
    location: generateLocation(),
  };
  return condition;
}

export function createEndIf(id: number): CFASTNode {
  const condition: CFASTNode = {
    id: id,
    type: "endif",
    location: generateLocation(),
  };
  return condition;
}

export function generateLocation(uri?: string) {
  return {
    uri: uri ?? "uri",
    start: {
      line: 0,
      character: 1,
    },
    end: {
      line: 0,
      character: 10,
    },
  };
}
