/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
 */

import { processCopyFrom } from "../../../engine/copyfrom";
import {
  CopyFromVariableDescriptor,
  RedefinitionVariableDescriptor,
  RegularVariableDescriptor,
} from "../../../engine/parsing";
import { createMessageService } from "./utils";

describe("copy-from parsing test", () => {
  const context: any = {
    replace: jest.fn(),
    addDiagnostic: jest.fn(),
  };

  beforeEach(() => {
    jest.clearAllMocks();
  });

  it("should add diagnostic for when no source found", () => {
    const variables: VariableDescriptor[] = [
      {
        name: "NAME-XAA",
        suffix: "BB",
        copyFromRange: {},
        type: "COPY-FROM",
      } as CopyFromVariableDescriptor,
    ];
    processCopyFrom(context, variables, createMessageService());

    expect(context.replace).toHaveBeenCalledWith({}, " ");
    expect(context.addDiagnostic).toHaveBeenCalledWith(
      expect.objectContaining({
        message: "Source for NAME-XAA not found",
        range: {},
      }),
    );
  });

  it("should find descending variable", () => {
    const variables = [
      {
        name: "VAR-XAA",
        options: "OPTIONS",
        type: "DEFINITION",
      } as RegularVariableDescriptor,
      {
        copyFromRange: {},
        name: "VAR-XBB",
        suffix: "AA",
        type: "COPY-FROM",
      } as CopyFromVariableDescriptor,
    ];
    processCopyFrom(context, variables, createMessageService());

    expect(context.replace).toHaveBeenCalledWith({}, "OPTIONS");
    expect(context.addDiagnostic).not.toHaveBeenCalled();
  });

  it("should process redefinitions", () => {
    const variables = [
      {
        name: "NAME-XAA",
        level: 1,
        options: "",
        type: "DEFINITION",
      } as RegularVariableDescriptor,
      {
        name: "VAR-XCC",
        level: 3,
        options: "OPTIONS",
        type: "DEFINITION",
      } as RegularVariableDescriptor,
      {
        name: "VAR-XAA",
        type: "REDEFINITION",
      } as RedefinitionVariableDescriptor,
      {
        name: "NEXT-XCC",
        level: 1,
        type: "DEFINITION",
      } as RegularVariableDescriptor,
      {
        level: 1,
        copyFromRange: {},
        suffix: "AA",
        name: "NAME-XBB",
        type: "COPY-FROM",
      } as CopyFromVariableDescriptor,
    ];
    processCopyFrom(context, variables, createMessageService());

    expect(context.replace).toHaveBeenCalledWith(
      {},
      ".\n        03 VAR-XBB  REDEFINES VAR-XBB",
    );
    expect(context.addDiagnostic).not.toHaveBeenCalled();
  });
});
