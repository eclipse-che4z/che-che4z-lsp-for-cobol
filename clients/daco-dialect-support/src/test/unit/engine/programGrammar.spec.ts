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

import * as antlr from "antlr4ng";
import { ProgramLexer } from "../../../generated/ProgramLexer";
import { ProgramParser } from "../../../generated/ProgramParser";
import { createMessageService } from "./utils";

class ErrorCollector extends antlr.BaseErrorListener {
  public readonly messages: string[] = [];

  override syntaxError(
    _recognizer: antlr.Recognizer<antlr.ATNSimulator>,
    _offendingSymbol: unknown,
    line: number,
    column: number,
    msg: string,
  ): void {
    this.messages.push(`${line}:${column} ${msg}`);
  }
}

function parse(text: string) {
  const lexer = new ProgramLexer(antlr.CharStream.fromString(text));
  const parser = new ProgramParser(new antlr.CommonTokenStream(lexer));
  parser.setMessageService(createMessageService());

  const errors = new ErrorCollector();
  lexer.removeErrorListeners();
  parser.removeErrorListeners();
  lexer.addErrorListener(errors);
  parser.addErrorListener(errors);

  const tree = parser.startRule();
  return { tree, errors: errors.messages };
}

describe("program grammar: data division sections", () => {
  it("accepts a foreign dialect SCHEMA SECTION after FILE SECTION", () => {
    const { errors } = parse(
      [
        "       IDENTIFICATION DIVISION.",
        "       PROGRAM-ID.    EMPRPT.",
        "       ENVIRONMENT DIVISION.",
        "       INPUT-OUTPUT SECTION.",
        "       FILE-CONTROL.",
        "           SELECT ABCD ASSIGN TO SOME_FIELD.",
        "       IDMS-CONTROL SECTION.",
        "       PROTOCOL.      MODE IS BATCH DEBUG",
        "                      IDMS-RECORDS MANUAL.",
        "       DATA DIVISION.",
        "       FILE SECTION.",
        "       FD  ABCD",
        "           RECORDING MODE IS F",
        "           LABEL RECORDS ARE OMITTED",
        "           BLOCK CONTAINS 0 RECORDS",
        "           DATA RECORD IS SOME_VAR.",
        "       01  SOME_VAR              PIC X(132).",
        "       SCHEMA SECTION.",
        "       DB DTO  WITHIN DTOSCH  VERSION 100.",
        "",
      ].join("\n"),
    );
    expect(errors).toEqual([]);
  });

  it("accepts arbitrary named sections between and after known ones", () => {
    const { tree, errors } = parse(
      [
        "       DATA DIVISION.",
        "       SCHEMA SECTION.",
        "       DB DTO  WITHIN DTOSCH  VERSION 100.",
        "       WORKING-STORAGE SECTION.",
        "       01  WS-VAR                PIC X(10).",
        "       MAP SECTION.",
        "       MAX FIELD LIST IS 10.",
        "       MAP DTOMAP.",
        "       LINKAGE SECTION.",
        "       01  LK-VAR                PIC X(10).",
        "       SOME-OTHER-SECTION SECTION.",
        "       ANYTHING GOES HERE 1 2 3.",
        "       PROCEDURE DIVISION.",
        "       MAIN-SECTION SECTION.",
        "           STOP RUN.",
        "",
      ].join("\n"),
    );
    expect(errors).toEqual([]);

    const sections = tree.dataDivision()!.dataSection();
    expect(sections).toHaveLength(5);
    expect(tree.procedureDivision()).not.toBeNull();
  });

  it("still parses variables of known sections that follow a foreign section", () => {
    const { tree, errors } = parse(
      [
        "       DATA DIVISION.",
        "       SCHEMA SECTION.",
        "       DB DTO  WITHIN DTOSCH  VERSION 100.",
        "       WORKING-STORAGE SECTION.",
        "       01  WS-VAR                PIC X(10).",
        "       01  WS-VAR2               PIC 9(4).",
        "",
      ].join("\n"),
    );
    expect(errors).toEqual([]);

    const knownSection = tree
      .dataDivision()!
      .dataSection()
      .find((s) => s.WORKING_STORAGE() !== null);
    expect(knownSection).toBeDefined();
    expect(knownSection!.dataDescriptionEntry()).toHaveLength(2);
  });

  it("stops EXEC blocks at END-EXEC even without a period", () => {
    const { tree, errors } = parse(
      [
        "       DATA DIVISION.",
        "       WORKING-STORAGE SECTION.",
        "           EXEC SQL",
        "               INCLUDE PRODUCTS",
        "               INCLUDE PARTS",
        "           END-EXEC",
        "           COPY COPY1.",
        "       PROCEDURE DIVISION.",
        "           STOP RUN.",
      ].join("\n"),
    );

    expect(errors).toEqual([]);
    const entries = tree
      .dataDivision()!
      .dataSection()[0]
      .dataDescriptionEntry();
    expect(entries).toHaveLength(2);
    expect(entries[0].skipExecBlock()).not.toBeNull();
    expect(entries[1].otherDialectCopy()).not.toBeNull();
    expect(tree.procedureDivision()).not.toBeNull();
  });

  it("recognizes PROCEDURE DIVISION immediately after END-EXEC without a period", () => {
    const { tree, errors } = parse(
      [
        "       DATA DIVISION.",
        "       WORKING-STORAGE SECTION.",
        "           EXEC SQL INCLUDE PRODUCTS END-EXEC",
        "       PROCEDURE DIVISION.",
        "           STOP RUN.",
      ].join("\n"),
    );

    expect(errors).toEqual([]);
    expect(
      tree.dataDivision()!.dataSection()[0].dataDescriptionEntry(),
    ).toHaveLength(1);
    expect(tree.procedureDivision()).not.toBeNull();
  });
});
