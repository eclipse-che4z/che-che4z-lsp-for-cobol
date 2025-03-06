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
import { Program, Location, Paragraph, Section } from "../model/cfast";
import { CobolInstruction } from "./instructions";

/**
 * Virtual Processor Listener is used to obtain information during COBOL statements processing
 */
export interface VirtualProcessorListener {
  /**
   * Fires wnen Virtual Processor tryes to evaluate not supported COBOL statement
   * @param location the COBOL statement location
   */
  notSupported(location: Location): void;

  /**
   * Fires when control moves from previous node to the next node
   * @param node1 - previous node
   * @param node2 - next node
   */
  moveControl(
    node1: Paragraph | Section | Program,
    node2: Paragraph | Section | Program,
  ): void;

  /**
   * Fires when Virtual Processor reach the maximum VM count
   */
  maximumVMCountReached(): void;

  /**
   * Fires when latest statement of the program was executed and control falls down
   * @param path a VM path as a array of executed cobol instructions
   */
  reportFallThru(path: CobolInstruction[]): void;
}
