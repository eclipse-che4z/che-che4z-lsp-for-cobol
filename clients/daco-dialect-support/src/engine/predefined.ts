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

import { IDocumentProcessingContext } from "@code4z/cobol-dialect-api";
import { SettingsService } from "./services/settings";
import { VariableDescriptor } from "./model";

export const IMPLICIT_DACO_SECTIONS = "implicit:///implicitDaCo/SECTIONS.cpy";
export const IMPLICIT_DACO_WORKING_STORAGE =
  "implicit:///implicitDaCo/WORKING_STORAGE.cpy";
export const IMPLICIT_DACO_LINKAGE = "implicit:///implicitDaCo/LINKAGE.cpy";

export function generatePredefinedSections(
  context: IDocumentProcessingContext,
  sections: string[],
  procedureDivisionLine?: number,
) {
  if (!procedureDivisionLine || procedureDivisionLine < 0) {
    return;
  }
  const predefinedSection = new Set<string>(
    SettingsService.getPredefinedSections(),
  );

  sections.forEach((existing) => predefinedSection.delete(existing));
  if (predefinedSection.size === 0) {
    return;
  }
  let text = "";
  for (const section of predefinedSection) {
    text += generatePredefinedSection(section);
  }
  context.insert(procedureDivisionLine, text, IMPLICIT_DACO_SECTIONS);
}

function generatePredefinedSection(section: string): string {
  return `       ${section} SECTION.\n           STOP RUN.\n`;
}

export function generatePredefinedVariables(
  context: IDocumentProcessingContext,
  variables: VariableDescriptor[],
  dataDivisionExists: boolean,
  linkageSectionLine?: number,
  workingStorageLine?: number,
  procedureDivisionLine?: number,
) {
  if (!procedureDivisionLine) {
    return;
  }

  let generatedText: string = "";
  if (!dataDivisionExists) {
    generatedText += "       DATA DIVISION.\n";
  }
  if (!workingStorageLine) {
    generatedText += "       WORKING-STORAGE SECTION.\n";
    workingStorageLine = procedureDivisionLine - 1;
  }
  generatedText += generateTables(variables);
  generatedText += generateStaticWorkingStorageVariables();

  if (!linkageSectionLine) {
    generatedText += "       LINKAGE SECTION.\n";
    generatedText += generateStaticLinkageVariables();
  }
  context.insert(
    workingStorageLine,
    generatedText,
    IMPLICIT_DACO_WORKING_STORAGE,
  );

  if (linkageSectionLine) {
    context.insert(
      linkageSectionLine,
      generateStaticLinkageVariables(),
      IMPLICIT_DACO_LINKAGE,
    );
  }
}

function generateTables(variables: VariableDescriptor[]): string {
  let result = "";
  const defined = new Set(
    variables
      .filter((v) => v.type === "DEFINITION")
      .map((v) => v.name.toUpperCase()),
  );

  for (const name of defined) {
    const table = getTableInfo(name);
    if (table) {
      result += generateTableVariables(table, defined);
    }
  }
  return result;
}

function getTableInfo(
  name: string,
): undefined | { name: string; suffix: string } {
  let result = undefined;
  if (
    name.length == 10 &&
    (name.startsWith("TBF") || name.startsWith("TBL")) &&
    name.indexOf("-X") == 6
  ) {
    result = {
      name: name.substring(3, 6).toUpperCase(),
      suffix: name.substring(8).toUpperCase(),
    };
  }

  return result;
}

function generateTableVariables(
  table: {
    name: string;
    suffix: string;
  },
  defined: Set<string>,
): string {
  let result = "";

  let newName = `RCU${table.name}-B${table.suffix}`;
  if (!defined.has(newName)) {
    defined.add(newName);
    result += `        01   ${newName}       PIC S9(8)  VALUE ZERO COMP.\n`;
  }

  newName = `TBO${table.name}-X${table.suffix}`;
  if (!defined.has(newName)) {
    defined.add(newName);
    result += `        01   ${newName}       PIC X      VALUE LOW-VALUE.\n`;
  }

  newName = `RMX${table.name}-B${table.suffix}`;
  if (!defined.has(newName)) {
    defined.add(newName);
    result += `        01   ${newName}       PIC S9(8)  VALUE 300  COMP.\n`;
  }

  newName = `RMP${table.name}-B${table.suffix}`;
  if (!defined.has(newName)) {
    defined.add(newName);
    result += `        01   ${newName}       PIC S9(4)  VALUE ZERO COMP.\n`;
  }

  newName = `RUS${table.name}-B${table.suffix}`;
  if (!defined.has(newName)) {
    defined.add(newName);
    result += `        01   ${newName}       PIC S9(8)  VALUE ZERO COMP.\n`;
  }

  return result;
}

function generateStaticWorkingStorageVariables(): string {
  return (
    "       01 LDDCII1M-XII.\n" +
    "         03 OPDATOINI-XII PIC X(3) VALUE SPACE.\n" +
    "         03 LAYADRINI-BII POINTER.\n" +
    "       01  USWzXSH.                                                             \n" +
    "           03 USIzXSH                  PIC X(16).                               \n" +
    "           03 USMzXSH                  PIC X(6).                                \n" +
    "           03 USLzBSH                  PIC S9(8)               COMP.            \n" +
    "           03 USB-BSH                  PIC S9(8)               COMP.            \n" +
    "           03 USE-BSH                  PIC S9(8)               COMP.            \n" +
    "           03 CSF-XSH                  PIC X.                                   \n" +
    "           03 CSV-XSH                  PIC X(64).                               \n" +
    "           03 CSV-NSH                  PIC 9(16).                               \n" +
    "           03 CSL-BSH                  PIC S9(8)               COMP.            \n" +
    "           03 NSVzXSH                  PIC X(64).                               \n" +
    "           03 NSL-BSH                  PIC S9(8)               COMP.            \n" +
    "           03 FILLER                   PIC X(325).   \n"
  );
}

function generateStaticLinkageVariables(): string {
  return (
    "       01 KMKIDMdXII.\n" +
    "          03 OPDATOdXII PIC X(3) VALUE SPACE.\n" +
    "          03 LAYADR-BII POINTER.\n" +
    "          03 OPDKOD-XII PIC X(4) VALUE SPACE.\n" +
    "          03 PMONAM-XII PIC X(8) VALUE SPACE.\n" +
    "          03 ENTNAM-XII PIC X(16) VALUE SPACE.\n" +
    "          03 PMT-XII    PIC X(6) VALUE SPACE.\n" +
    "          03 PMTBIN-BII PIC S9(9) VALUE ZERO COMP.\n" +
    "          03 RTTKOD-XII VALUE ZERO.\n" +
    "            05 RTTSTS-XII PIC X.\n" +
    "            05 RTTMESdNII PIC 9(3).\n"
  );
}
