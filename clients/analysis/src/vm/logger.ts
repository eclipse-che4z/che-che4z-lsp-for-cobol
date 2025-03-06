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
import { CFASTNode, Paragraph, Section, Perform, Goto } from "../model/cfast";

export interface Channel {
  debug(message: string): void;
  trace(message: string): void;
  info(message: string): void;
  warn(message: string): void;
  error(message: string): void;
}

/**
 * Provides logging to console functionality
 */
export class Logger {
  private static channel: Channel;

  public constructor() {}

  public static initialize(channel: Channel) {
    Logger.channel = channel;
  }

  /**
   * Log given message
   * @param message to log
   */
  public static error(message: string) {
    Logger.channel.error(message);
  }

  /**
   * Log given message
   * @param message to log
   */
  public static warn(message: string) {
    Logger.channel.warn(message);
  }

  /**
   * Log given message
   * @param message to log
   */
  public static info(message: string) {
    Logger.channel.info(message);
  }

  /**
   * Log given message
   * @param message to log
   */
  public static debug(message: string) {
    Logger.channel.debug(message);
  }

  /**
   * Log given message
   * @param message to log
   */
  public static trace(message: string) {
    Logger.channel.trace(message);
  }
}

/**
 * Generates label for CFAST node
 * @param treeNode is a CFAST node
 * @returns generated label
 */
function getLabel(treeNode: CFASTNode): string {
  if (treeNode !== undefined && treeNode !== null) {
    switch (treeNode.type) {
      case "section":
        return `SECTION ${(treeNode as Section).name}`;
      case "paragraph":
        return `PARAGRAPH ${(treeNode as Paragraph).name}`;
      case "perform":
        const perform = treeNode as Perform;
        let targetInfo = "";
        let thruInfo = "";
        if (perform.targetName) {
          targetInfo =
            perform.targetName +
            (perform.targetSectionName
              ? ` OF ${perform.targetSectionName}`
              : "");
        }
        if (perform.thruName) {
          thruInfo =
            " THRU " +
            perform.thruName +
            (perform.thruSectionName ? ` OF ${perform.thruSectionName}` : "");
        }
        return "PERFORM " + targetInfo + thruInfo;

      case "goto":
        return (
          "GO TO " +
          ((treeNode as Goto).targetName[0] ??
            `${(treeNode as Goto).targetName[0]}`)
        );
    }
  }
  return treeNode?.type ?? "";
}

/**
 * Generates CFAST node info
 * @param node CFAST node
 * @returns generated info
 */
export function cfastNodeInfo(node?: CFASTNode): string {
  if (!node) {
    return "N/A";
  }
  return `id: ${node.id}, type: ${node.type}, label: ${getLabel(node)}`;
}
