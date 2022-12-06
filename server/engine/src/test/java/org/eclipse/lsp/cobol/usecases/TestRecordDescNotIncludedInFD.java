/*
 * Copyright (c) 2022 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import java.util.Collection;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** This test checks that the FS/SD entry locality doesn't include records entries. */
public class TestRecordDescNotIncludedInFD {
  public static final String PGM =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. PR1480.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       SOURCE-COMPUTER.    IBM-PC.\n"
          + "       OBJECT-COMPUTER.    IBM-PC.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "           SELECT {$ACCTFILE}\n"
          + "               ASSIGN        TO UT-ACCTFILE\n"
          + "               ORGANIZATION  IS INDEXED\n"
          + "               ACCESS MODE   IS DYNAMIC\n"
          + "               RECORD KEY    IS {$ACCOUNT-KEY}.\n"
          + "\n"
          + "       DATA DIVISION.\n"
          + "       FILE SECTION.\n"
          + "       FD  {$*ACCTFILE}                          IS EXTERNAL\n"
          + "           DATA RECORD IS {$ACCOUNT-RECORD}.\n"
          + "           COPY {~ACCFILE1}.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*WS-INPUT-FIELDS}.\n"
          + "           03  {$*WS-ACCOUNT-ID}                 PIC 9(04) VALUE ZERO.\n"
          + "           03  {$*WS-TELEPHONE-1}.\n"
          + "               05  {$*WS-TEL-1A}                 PIC 9(02) VALUE ZERO.\n"
          + "               05  {$*WS-TEL-1B}                 PIC 9(02) VALUE ZERO.\n"
          + "               05  {$*WS-TEL-1C}                 PIC 9(02) VALUE ZERO.\n"
          + "       LINKAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {#*000-START-PROCESSING}.\n"
          + "           PERFORM {#000-INITIALIZATION}.\n"
          + "           PERFORM {#000-VALIDATE-INPUT-FIELDS}.\n"
          + "           GOBACK.\n"
          + "       {#*000-INITIALIZATION}.\n"
          + "           MOVE 0 TO {$WS-ACCOUNT-ID}.\n"
          + "       {#*000-VALIDATE-INPUT-FIELDS}.\n"
          + "           MOVE 3                     TO {$WS-INPUT-FIELDS}.\n"
          + "           MOVE 0 to {$A-C-ACCOUNT-ID}.\n";
  public static final String COPYBOOK =
      "       01  {$*ACCOUNT-RECORD}.\n"
          + "           03  {$*ACCOUNT-KEY}.\n"
          + "               05  {$*ACCOUNT-ID}                 PIC 9(06)  VALUE ZERO.\n"
          + "               05  {$*ACCOUNT-RECORD-TYPE}        PIC 9(02)  VALUE ZERO.\n"
          + "                   88  {$*ACCOUNT-CONTROL}        VALUE 0.\n"
          + "                   88  {$*ACCOUNT-STATISTICS}     VALUE 1.\n"
          + "                   88  {$*ACCOUNT-MAINTENANCE}    VALUE 2.\n"
          + "                   88  {$*ACCOUNT-DELIVERIES}     VALUE 3.\n"
          + "                   88  {$*ACCOUNT-PAYMENTS}       VALUE 4.\n"
          + "               05  {$*ACCOUNT-RECORD-NUMBER}      PIC 9(04)  VALUE ZERO.\n"
          + "           03  {$*ACCOUNT-DATA}                   PIC X(500) VALUE SPACE.\n"
          + "      *\n"
          + "       01  {$*ACCOUNT-CONTROL-RECORD}.\n"
          + "           03  {$*A-C-KEY}.\n"
          + "               05  {$*A-C-ACCOUNT-ID}             PIC 9(06)  VALUE ZERO.\n"
          + "               05  {$*A-C-RECORD-TYPE}            PIC 9(02)  VALUE ZERO.\n"
          + "               05  {$*A-C-RECORD-NUMBER}          PIC 9(04)  VALUE ZERO.\n"
          + "           03  {$*A-C-DATA}                       PIC X(500) VALUE SPACE.\n"
          + "           03  FILLER                         REDEFINES {$A-C-DATA}.\n"
          + "               05  {$*A-C-MIN-ACCOUNT-ID}         PIC 9(04).\n"
          + "               05  {$*A-C-MAX-ACCOUNT-ID}         PIC 9(04).\n"
          + "      *\n"
          + "       01  {$*ACCOUNT-STATISTICS-RECORD}.\n"
          + "           03  {$*A-S-KEY}.\n"
          + "               05  {$*A-S-ACCOUNT-ID}             PIC 9(06)  VALUE ZERO.\n"
          + "               05  {$*A-S-RECORD-TYPE}            PIC 9(02)  VALUE 1.\n"
          + "               05  {$*A-S-RECORD-NUMBER}          PIC 9(04)  VALUE ZERO.\n"
          + "           03  {$*A-S-DATA}                       PIC X(500) VALUE SPACE.\n"
          + "           03  FILLER                         REDEFINES {$A-S-DATA}.\n"
          + "               05  {$*A-S-CUSTOMER-NAME}.\n"
          + "                   07  {$*A-S-NAME-LAST}          PIC X(16).\n"
          + "                   07  {$*A-S-NAME-FIRST}         PIC X(16).\n"
          + "                   07  {$*A-S-NAME-INITIAL}       PIC X(01).\n"
          + "               05  {$*A-S-ADDRESS}                PIC X(64).\n"
          + "               05  {$*A-S-CITY}                   PIC X(24).\n"
          + "               05  {$*A-S-STATE}                  PIC X(02).\n"
          + "               05  {$*A-S-ZIP-CODE}.\n"
          + "                   07  {$*A-S-ZIP}                PIC 9(05).\n"
          + "                   07  {$*A-S-ZIP-EX}             PIC 9(04).\n"
          + "               05  {$*A-S-TELEPHONE-1}.\n"
          + "                   07  {$*A-S-TEL-1A}             PIC 9(03).\n"
          + "                   07  {$*A-S-TEL-1B}             PIC 9(03).\n"
          + "                   07  {$*A-S-TEL-1C}             PIC 9(04).\n"
          + "               05  {$*A-S-TELEPHONE-2}.\n"
          + "                   07  {$*A-S-TEL-2A}             PIC 9(03).\n"
          + "                   07  {$*A-S-TEL-2B}             PIC 9(03).\n"
          + "                   07  {$*A-S-TEL-2C}             PIC 9(04).\n"
          + "               05  {$*A-S-START-OF-CONTRACT}      PIC 9(06).\n"
          + "               05  {$*A-S-END-OF-CONTRACT}        PIC 9(06).\n"
          + "               05  {$*A-S-SIZE-OF-HOME}       PIC 9(04).\n"
          + "               05  {$*A-S-SIZE-OF-TANK}       PIC 9(04).\n"
          + "               05  {$*A-S-UNIT-PRICE}       PIC 9(03).\n"
          + "               05  {$*A-S-ESTIMATED-USAGE}  PIC 9(04).\n"
          + "               05  {$*A-S-ESTIMATED-COST}  PIC 9(06).\n"
          + "               05  {$*A-S-BUDGET-AMOUNT}     PIC 9(06).\n"
          + "               05  {$*A-S-MAINTENANCE-ENTRIES}    PIC 9(04).\n"
          + "               05  {$*A-S-LAST-MAINTENANCE}       PIC 9(06).\n"
          + "               05  {$*A-S-DELIVERY-ENTRIES}   PIC 9(04).\n"
          + "               05  {$*A-S-LAST-DELIVERY}          PIC 9(06).\n"
          + "               05  {$*A-S-PAYMENT-ENTRIES}        PIC 9(04).\n"
          + "               05  {$*A-S-LAST-PAYMENT}           PIC 9(06).\n"
          + "               05  {$*A-S-BALANCE}                PIC S9(06).\n"
          + "               05  {$*A-S-PAYMENT-DUE}            PIC 9(06).\n"
          + "      *\n"
          + "       01  {$*ACCOUNT-MAINTENANCE-RECORD}.\n"
          + "           03  {$*A-M-KEY}.\n"
          + "               05  {$*A-M-ACCOUNT-ID}             PIC 9(06)  VALUE ZERO.\n"
          + "               05  {$*A-M-RECORD-TYPE}            PIC 9(02)  VALUE 2.\n"
          + "               05  {$*A-M-RECORD-NUMBER}          PIC 9(04)  VALUE ZERO.\n"
          + "           03  {$*A-M-DATA}                       PIC X(500) VALUE SPACE.\n"
          + "           03  FILLER                         REDEFINES {$A-M-DATA}.\n"
          + "               05  {$*A-M-ENTRY}                  OCCURS 10.\n"
          + "                   07  {$*A-M-DATE-OF-SERVICE}    PIC 9(06).\n"
          + "                   07  {$*A-M-TECHNICIAN}         PIC 9(04).\n"
          + "                   07  {$*A-M-PROBLEM-CODE}       PIC 9(04).\n"
          + "                   07  {$*A-M-RESOLUTION-CODE}    PIC 9(04).\n"
          + "                   07  {$*A-M-PARTS-REPLACED}     PIC 9(04).\n"
          + "                   07  {$*A-M-PART-LIST}.\n"
          + "                       09  {$*A-M-PART}           PIC 9(04) OCCURS 5.\n"
          + "                   07  {$*A-M-SERVICE-CHARGE}     PIC 9(06).\n"
          + "      *\n"
          + "       01  {$*ACCOUNT-DELIVERY-RECORD}.\n"
          + "           03  {$*A-D-KEY}.\n"
          + "               05  {$*A-D-ACCOUNT-ID}            PIC 9(06)  VALUE ZERO.\n"
          + "               05  {$*A-D-RECORD-TYPE}            PIC 9(02)  VALUE 3.\n"
          + "               05  {$*A-D-RECORD-NUMBER}          PIC 9(04)  VALUE ZERO.\n"
          + "           03  {$*A-D-DATA}                       PIC X(500) VALUE SPACE.\n"
          + "           03  FILLER                         REDEFINES {$A-D-DATA}.\n"
          + "               05  {$*A-D-ENTRY}                  OCCURS 20.\n"
          + "                   07  {$*A-D-DATE-OF-DELIVERY}   PIC 9(06).\n"
          + "                   07  {$*A-D-TECHNICIAN}         PIC 9(04).\n"
          + "                   07  {$*A-D-GALLONS}            PIC 9(04).\n"
          + "                   07  {$*A-D-UNIT-PRICE}         PIC 9(03).\n"
          + "      *\n"
          + "       01  {$*ACCOUNT-PAYMENT-RECORD}.\n"
          + "           03  {$*A-P-KEY}.\n"
          + "               05  {$*A-P-ACCOUNT-ID}             PIC 9(06)  VALUE ZERO.\n"
          + "               05  {$*A-P-RECORD-TYPE}            PIC 9(02)  VALUE 4.\n"
          + "               05  {$*A-P-RECORD-NUMBER}          PIC 9(04)  VALUE ZERO.\n"
          + "           03  {$*A-P-DATA}                       PIC X(500) VALUE SPACE.\n"
          + "           03  FILLER                         REDEFINES {$A-P-DATA}.\n"
          + "               05  {$*A-P-ENTRY}                  OCCURS 20.\n"
          + "                   07  {$*A-P-DATE-OF-PAYMENT}    PIC 9(06).\n"
          + "                   07  {$*A-P-AMOUNT}             PIC 9(06).\n"
          + "      *\n"
          + "       01 {$*ACCTFILE-LENGTH}                    PIC 9(04) COMP VALUE 512.\n"
          + "       01  {$*ACCTFILE-KEYLENGTH}                 PIC 9(04) COMP VALUE 12.\n"
          + "       01  {$*ACCTFILE-RESP}                      PIC 9(08) COMP VALUE ZERO.\n"
          + "       01  {$*ACCTFILE-RESP2}                     PIC 9(08) COMP VALUE ZERO.\n"
          + "      *\n";

  @Test
  void test() {
    AnalysisResult result =
        UseCaseEngine.runTest(
            PGM, ImmutableList.of(new CobolText("ACCFILE1", COPYBOOK)), ImmutableMap.of());

      SymbolsRepository repo = new SymbolsRepository(result.getSymbolTableMap());
    ProgramNode programNode =
        result
            .getRootNode()
            .getDepthFirstStream()
            .filter(node -> node.getNodeType() == NodeType.PROGRAM)
            .map(ProgramNode.class::cast)
            .collect(Collectors.toList())
            .get(0);
    Collection<VariableNode> acctfile = repo.getVariables(programNode).get("ACCTFILE");
    assertEquals(acctfile.size(), 1);
    acctfile.forEach(
        node -> {
          assertEquals(16, node.getLocality().getRange().getEnd().getLine());
          assertEquals(
              node.getLocality().getRange().getStart().getLine(),
              node.getLocality().getRange().getEnd().getLine());
        });
  }
}
