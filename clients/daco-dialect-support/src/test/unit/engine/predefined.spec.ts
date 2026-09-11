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
import {
  generatePredefinedSections,
  generatePredefinedVariables,
  IMPLICIT_DACO_SECTIONS,
  IMPLICIT_DACO_WORKING_STORAGE,
} from "../../../engine/predefined";
import { SettingsService } from "../../../engine/services/settings";
import { Range, Uri } from "./__mocks__/vscode";

describe("Predefined sections test suite", () => {
  const context: any = {
    insert: jest.fn(),
  };

  beforeEach(() => {
    jest.clearAllMocks();
  });

  it("should not insert anything for empty predefined sections list", () => {
    jest
      .spyOn(SettingsService, "getPredefinedSections")
      .mockImplementation(() => []);

    generatePredefinedSections(context, [], 10);
    expect(context.insert).not.toHaveBeenCalled();
  });

  it("should not insert anything if procedure division was not found", () => {
    jest
      .spyOn(SettingsService, "getPredefinedSections")
      .mockImplementation(() => ["PREDEF0", "PREDEF1"]);

    generatePredefinedSections(context, [], undefined);
    expect(context.insert).not.toHaveBeenCalled();
  });

  it("should not insert anything when procedure division position is invalid", () => {
    jest
      .spyOn(SettingsService, "getPredefinedSections")
      .mockImplementation(() => ["PREDEF0", "PREDEF1"]);

    generatePredefinedSections(context, [], 0);
    expect(context.insert).not.toHaveBeenCalled();
  });

  it("should not insert anything if all sections are already defined", () => {
    jest
      .spyOn(SettingsService, "getPredefinedSections")
      .mockImplementation(() => ["PREDEF0", "PREDEF1"]);

    generatePredefinedSections(context, ["PREDEF0", "PREDEF1"], 10);
    expect(context.insert).not.toHaveBeenCalled();
  });

  it("should insert only missing section", () => {
    jest
      .spyOn(SettingsService, "getPredefinedSections")
      .mockImplementation(() => ["PREDEF0", "PREDEF1"]);

    generatePredefinedSections(context, ["PREDEF1"], 10);
    expect(context.insert).toHaveBeenCalledWith(
      10,
      "       PREDEF0 SECTION.\n           STOP RUN.\n",
      IMPLICIT_DACO_SECTIONS,
    );
  });
});

describe("Predefined variables test suite", () => {
  const range = new Range(0, 0, 1, 1) as any;
  const context: any = {
    insert: jest.fn(),
  };

  beforeEach(() => {
    jest.clearAllMocks();
  });

  it("should not insert anything for empty program", () => {
    generatePredefinedVariables(context, [], false);
    expect(context.insert).not.toHaveBeenCalled();
  });

  it("should insert DATA DIVISION if not exists", () => {
    generatePredefinedVariables(context, [], false, undefined, undefined, 20);
    expect(context.insert).toHaveBeenCalledWith(
      19,
      expect.stringContaining("DATA DIVISION."),
      IMPLICIT_DACO_WORKING_STORAGE,
    );
  });

  it("should insert WORKING-STORAGE if not exists", () => {
    generatePredefinedVariables(context, [], true, undefined, undefined, 20);
    expect(context.insert).not.toHaveBeenCalledWith(
      19,
      expect.stringContaining("DATA DIVISION."),
      IMPLICIT_DACO_WORKING_STORAGE,
    );
    expect(context.insert).toHaveBeenCalledWith(
      19,
      expect.stringContaining("WORKING-STORAGE SECTION."),
      IMPLICIT_DACO_WORKING_STORAGE,
    );
  });

  it("should not insert WORKING-STORAGE if it exists", () => {
    generatePredefinedVariables(context, [], true, undefined, 10, 20);
    expect(context.insert).not.toHaveBeenCalledWith(
      19,
      expect.stringContaining("DATA DIVISION."),
    );
    expect(context.insert).not.toHaveBeenCalledWith(
      19,
      expect.stringContaining("WORKING-STORAGE SECTION."),
      IMPLICIT_DACO_WORKING_STORAGE,
    );

    expect(context.insert).toHaveBeenCalledWith(
      10,
      expect.stringContaining("       01 "),
      IMPLICIT_DACO_WORKING_STORAGE,
    );
  });

  it("should insert LINKAGE SECTION if not exists", () => {
    generatePredefinedVariables(context, [], true, undefined, 10, 20);
    expect(context.insert).toHaveBeenCalledWith(
      10,
      expect.stringContaining("LINKAGE SECTION"),
      IMPLICIT_DACO_WORKING_STORAGE,
    );
  });

  it("should not insert LINKAGE SECTION if exists", () => {
    generatePredefinedVariables(context, [], true, 5, 10, 20);
    expect(context.insert).not.toHaveBeenCalledWith(
      10,
      expect.stringContaining("LINKAGE SECTION"),
      IMPLICIT_DACO_WORKING_STORAGE,
    );
    expect(context.insert).toHaveBeenCalledTimes(2);
  });

  it("should insert table variables for TBF", () => {
    generatePredefinedVariables(
      context,
      [
        {
          type: "DEFINITION",
          levelRange: range,
          level: 1,
          nameRange: range,
          name: "TBFmmm-Xnn",
          options: "",
          optionsRange: range,
          uri: Uri.parse("file:///test.cbl"),
        },
      ],
      true,
      undefined,
      10,
      20,
    );
    expect(context.insert).toHaveBeenCalledWith(
      10,
      expect.stringContaining("       01   RCUMMM-BNN "),
      IMPLICIT_DACO_WORKING_STORAGE,
    );
  });

  it("should insert table variables for TBL", () => {
    generatePredefinedVariables(
      context,
      [
        {
          type: "DEFINITION",
          levelRange: range,
          level: 1,
          nameRange: range,
          name: "TBLmmm-Xnn",
          options: "",
          optionsRange: range,
          uri: Uri.parse("file:///test.cbl"),
        },
      ],
      true,
      undefined,
      10,
      20,
    );
    expect(context.insert).toHaveBeenCalledWith(
      10,
      expect.stringContaining("       01   RCUMMM-BNN "),
      IMPLICIT_DACO_WORKING_STORAGE,
    );
  });

  it("should insert table variables for TBF and for TBL only once", () => {
    generatePredefinedVariables(
      context,
      [
        {
          type: "DEFINITION",
          levelRange: range,
          level: 1,
          nameRange: range,
          name: "TBLmmm-Xnn",
          options: "",
          optionsRange: range,
          uri: Uri.parse("file:///test.cbl"),
        },
        {
          type: "DEFINITION",
          levelRange: range,
          level: 1,
          nameRange: range,
          name: "TBLmmm-Xnn",
          options: "",
          optionsRange: range,
          uri: Uri.parse("file:///test.cbl"),
        },
      ],
      true,
      undefined,
      10,
      20,
    );
    const text = context.insert.mock.calls[0][1];
    const findings = text.match(/ {7}01 {3}RCUMMM-BNN /g) ?? [];
    expect(findings).toHaveLength(1);
  });
});
