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
import { NodeType } from "../model/cfast";
import { CobolInstruction } from "./instructions";

export class ConditionInfo {
  constructor(
    public starts: number[],
    public elses: number[],
    public end: number,
    public closed: boolean,
  ) {}
}

export class ListingUtils {
  public static buildIfConditionInfo(
    instructions: CobolInstruction[],
    position: number,
  ): ConditionInfo {
    const starts = [];
    const elses = [];
    let end: number = 0;

    let counter = 1;
    starts.push(position + 1);
    for (let i = position + 1; i < instructions.length; i++) {
      const node = instructions[i].getInitialNode();
      if (!node) {
        continue;
      }
      if (node.type === "if") {
        counter++;
        continue;
      }
      if (node.type === "else" && counter === 1) {
        starts.push(i + 1);
        elses.push(i);
        continue;
      }
      if (node.type === "endif") {
        counter--;
        if (counter === 0) {
          end = i;
          break;
        }
      }
    }
    return new ConditionInfo(starts, elses, end, elses.length > 0);
  }

  public static buildEvaluateConditionInfo(
    instructions: CobolInstruction[],
    position: number,
  ): ConditionInfo {
    const starts = [];
    const elses = [];
    let closed = false;
    let end: number = 0;

    let counter = 1;
    for (let i = position + 1; i < instructions.length; i++) {
      const node = instructions[i].getInitialNode();
      if (!node) {
        continue;
      }
      if (node.type === "evaluate") {
        counter++;
        continue;
      }
      if (node.type === "when" && counter === 1) {
        starts.push(i + 1);
        elses.push(i);
        continue;
      }
      if (node.type === "whenother" && counter === 1) {
        starts.push(i + 1);
        elses.push(i);
        closed = true;
        continue;
      }
      if (node.type === "endevaluate") {
        counter--;
        if (counter === 0) {
          end = i;
          break;
        }
      }
    }
    return new ConditionInfo(starts, elses, end, closed);
  }

  public static buildSimpleConditionInfo(
    instructions: CobolInstruction[],
    position: number,
    startType: NodeType,
    endType: NodeType,
  ): ConditionInfo {
    const starts = [];
    let end: number = 0;

    let counter = 1;
    starts.push(position + 1);
    for (let i = position + 1; i < instructions.length; i++) {
      const node = instructions[i].getInitialNode();
      if (!node) {
        continue;
      }
      if (node.type === startType) {
        counter++;
        continue;
      }
      if (node.type === endType) {
        counter--;
        if (counter === 0) {
          end = i;
          break;
        }
      }
    }
    return new ConditionInfo(starts, [], end, false);
  }
}
