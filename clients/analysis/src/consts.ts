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
export const SOURCE = "COBOL Control Flow";

export const NOT_SUPPORTED_STATEMENT =
  "This COBOL statement is not supported by CCF. The graph might be incomplete or contain incorrect links or nodes";
export const DEAD_CODE = "Unreachable code detected";
export const MAX_VM_COUNT_REACHED =
  "Graph generation incomplete due to complexity of the program";
export const FALL_THRU_MESSAGE = "Implicit EXIT PROGRAM statement executed";
