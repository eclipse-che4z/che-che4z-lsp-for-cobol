/*
 * Copyright (c) 2020 Broadcom.
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
package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.service.delegates.validations.AnalysisResult;
import com.ca.lsp.core.cobol.semantics.outline.NodeType;
import org.eclipse.lsp4j.DocumentSymbol;
import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.DOCUMENT_URI;
import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.analyze;
import static com.ca.lsp.core.cobol.semantics.outline.NodeType.*;
import static org.junit.Assert.assertEquals;

/** This test checks that Outline tree fot the program is constructed correctly */
public class TestOutlineTree {

  private static final String TEXT =
      "000010 COPY FOO.\n" +
          "000020 Identification Division.\n" +
          "000030 Program-id.  HELLO-WORLD       .\n" +
          "000040\n" +
          "000050 Data Division.\n" +
          "000060 Working-Storage Section.\n" +
          "000070     COPY BAR.\n" +
          "000080     01 User-Num1 PIC 9(9).\n" +
          "000090     01 User-Num2 PIC 9(9).\n" +
          "000100     01 User-Address.\n" +
          "000110     COPY BAZ.\n" +
          "000120     05 User-City PIC X(5).\n" +
          "000130     05 User-Country PIC X(5).\n" +
          "000140     05 User-Index PIC 9(6).\n" +
          "000150     05 User-Phone PIC 9(6).\n" +
          "000160     01 FILLER.\n" +
          "000170     03 FOO PIC X(5).\n" +
          "000180\n" +
          "000190 Procedure Division.\n" +
          "000200    000-Main-Logic  .\n" +
          "000210     Perform 100-Print-User.\n" +
          "000220     Stop Run.\n" +
          "000230\n" +
          "000240  100-Print-User.\n" +
          "000250     Move 123456789 To User-Num1.\n" +
          "000260     Move User-Num1 To User-Num2.\n" +
          "000270     Move 'Wenceslav Square 846/1' To User-Address.\n" +
          "000280     Move 'Prague' To User-City.\n" +
          "000290     Move 'CZ' To User-Country.\n" +
          "000300     Move 11000 To User-Index.\n" +
          "000310     Move 777123456 To User-Phone.\n" +
          "000320\n" +
          "000330     Display \"User-Num1     : \" User-Num1.\n" +
          "000340     Display \"User-Num2     : \" User-Num2.\n" +
          "000350     Display \"User-Address  : \" User-Address.\n" +
          "000360     Display \"User-City     : \" User-City.\n" +
          "000370     Display \"User-Country  : \" User-Country.\n" +
          "000380     Display \"User-Index    : \" User-Index.\n" +
          "000390     Display \"User-Phone    : \" User-Phone.\n" +
          "000400\n" +
          "000410 End program HELLO-WORLD.\n" +
          "000420\n" +
          "000430 IDENTIFICATION DIVISION.\n" +
          "000440 PROGRAM-ID.            OUTLINE.\n" +
          "000450 ENVIRONMENT DIVISION.\n" +
          "000460 CONFIGURATION SECTION.\n" +
          "000470 SPECIAL-NAMES.               C01 IS TOP-OF-PAGE.\n" +
          "000480 INPUT-OUTPUT SECTION.\n" +
          "000490 FILE-CONTROL.\n" +
          "000500     SELECT TRANS-FILE-IN\n" +
          "000510           ASSIGN TO SOMETHING-ELSE.\n" +
          "000520 DATA DIVISION.\n" +
          "000530 FILE SECTION.\n" +
          "000540 FD  TRANS-FILE-IN\n" +
          "000550     LABEL RECORDS ARE STANDARD\n" +
          "000560     RECORDING MODE IS F\n" +
          "000570     BLOCK CONTAINS 0 RECORDS\n" +
          "000580     RECORD CONTAINS 113 CHARACTERS\n" +
          "000590     DATA RECORD IS FILE-RECORD.\n" +
          "000600 01  FILE-RECORD                             PIC X(113).\n" +
          "000610 FD  TERMS-FILE\n" +
          "000620     LABEL RECORDS ARE STANDARD\n" +
          "000630     BLOCK CONTAINS 0 RECORDS\n" +
          "000640     RECORD CONTAINS 71 CHARACTERS\n" +
          "000650     DATA RECORD IS TERMS-RECORD.\n" +
          "000660 01  TERMS-RECORD.\n" +
          "000670     05  TERMS-KEY                           PIC 9(3).\n" +
          "000680     05  FILLER                              PIC X(68).\n" +
          "000690 WORKING-STORAGE SECTION.\n" +
          "000700 77  COLR-DISPLAY    PIC 9(7).\n" +
          "000710 01  CTLFILE-REC.\n" +
          "000720         05  CTLFILE-PRIME               PIC  99V999.\n" +
          "000730         05  CTLFILE-PAST-DUE-DIFF       PIC  99V999.\n" +
          "000740 01  CTLFILE-REC-12 REDEFINES CTLFILE-REC.\n" +
          "000750         05  CTLFILE-DB-DATE             PIC  9(6).\n" +
          "000760         05  CTLFILE-ATB-DATE            PIC  9(6).\n" +
          "000770         10  COST-RECORD-CODE                PIC 9.\n" +
          "000780             88  HEADER    VALUE 1.\n" +
          "000790             88  SUPPLR    VALUE 2.\n" +
          "000800             88  WREHOUSE  VALUE 3.\n" +
          "000810 LINKAGE SECTION.\n" +
          "000820 01  LINK-PRM0.\n" +
          "000830     05  PARM-LENGTH                        PIC S9(4) COMP.\n" +
          "000840     05  PARM                               PIC X(8).\n" +
          "000850 PROCEDURE DIVISION USING LINK-PRM0.\n" +
          "000860 000-PROGRAM-DRIVER SECTION.\n" +
          "000870     PERFORM 100-HOUSEKEEPING.\n" +
          "000880     EJECT\n" +
          "000890 100-HOUSEKEEPING SECTION.\n" +
          "000900 110-OPEN-FILES.\n" +
          "000910 112-READ-WAREHOUS-FILE.\n" +
          "000920 199-EXIT.\n" +
          "000930     EXIT.\n" +
          "000940     EJECT\n";

  @Test
  void test() {
    List<CobolText> copybooks = List.of(
        new CobolText("FOO", ""),
        new CobolText("BAR", "000100     01 HIDE-IT PIC 9(9)."),
        new CobolText("BAZ", "")
    );
    List<DocumentSymbol> expectedNodes = getExpectedOutlineNodes();
    AnalysisResult result = analyze(DOCUMENT_URI, TEXT, copybooks);
    assertNodeListEquals(expectedNodes, result.getOutlineTree(), "/");
  }

  private List<DocumentSymbol> getExpectedOutlineNodes() {
    return nested(
        node("COPY FOO", COPYBOOK),
        node("PROGRAM: HELLO-WORLD", PROGRAM, nested(
            node("IDENTIFICATION DIVISION", DIVISION, nested(
                node("PROGRAM-ID HELLO-WORLD", PROGRAM_ID)
            )),
            node("DATA DIVISION", DIVISION, nested(
                node("WORKING-STORAGE SECTION", SECTION, nested(
                    node("COPY BAR", COPYBOOK),
                    node("User-Num1", FIELD),
                    node("User-Num2", FIELD),
                    node("User-Address", STRUCT, nested(
                        node("COPY BAZ", COPYBOOK),
                        node("User-City", FIELD),
                        node("User-Country", FIELD),
                        node("User-Index", FIELD),
                        node("User-Phone", FIELD)
                    )),
                    node("FILLER", STRUCT, nested(
                        node("FOO", FIELD)
                    ))
                ))
            )),
            node("PROCEDURE DIVISION", DIVISION, nested(
                node("000-Main-Logic", PROCEDURE),
                node("100-Print-User", PROCEDURE)
            ))
        )),
        node("PROGRAM: OUTLINE", PROGRAM, nested(
            node("IDENTIFICATION DIVISION", DIVISION, nested(
                node("PROGRAM-ID OUTLINE", PROGRAM_ID)
            )),
            node("ENVIRONMENT DIVISION", DIVISION, nested(
                node("CONFIGURATION SECTION", SECTION),
                node("INPUT-OUTPUT SECTION", SECTION, nested(
                    node("TRANS-FILE-IN", FILE)
                ))
            )),
            node("DATA DIVISION", DIVISION, nested(
                node("FILE SECTION", SECTION, nested(
                    node("TRANS-FILE-IN", FILE, nested(
                        node("FILE-RECORD", FIELD)
                    )),
                    node("TERMS-FILE", FILE, nested(
                        node("TERMS-RECORD", STRUCT, nested(
                            node("TERMS-KEY", FIELD),
                            node("FILLER", FIELD)
                        ))
                    ))
                )),
                node("WORKING-STORAGE SECTION", SECTION, nested(
                    node("COLR-DISPLAY", FIELD),
                    node("CTLFILE-REC", STRUCT, nested(
                        node("CTLFILE-PRIME", FIELD),
                        node("CTLFILE-PAST-DUE-DIFF", FIELD)
                    )),
                    node("CTLFILE-REC-12", REDEFINES, nested(
                        node("CTLFILE-DB-DATE", FIELD),
                        node("CTLFILE-ATB-DATE", FIELD),
                        node("COST-RECORD-CODE", FIELD, nested(
                            node("HEADER", FIELD_88),
                            node("SUPPLR", FIELD_88),
                            node("WREHOUSE", FIELD_88)
                        ))
                    ))
                )),
                node("LINKAGE SECTION", SECTION, nested(
                    node("LINK-PRM0", STRUCT, nested(
                        node("PARM-LENGTH", FIELD),
                        node("PARM", FIELD)
                    ))
                ))
            )),
            node("PROCEDURE DIVISION", DIVISION, nested(
                node("000-PROGRAM-DRIVER", PROCEDURE_SECTION),
                node("100-HOUSEKEEPING", PROCEDURE_SECTION, nested(
                    node("110-OPEN-FILES", PROCEDURE),
                    node("112-READ-WAREHOUS-FILE", PROCEDURE),
                    node("199-EXIT", PROCEDURE)
                ))
            ))
        ))
    );
  }

  private void assertNodeListEquals(List<DocumentSymbol> expected, List<DocumentSymbol> actual, String level) {
    Map<String, DocumentSymbol> expectedMap = toMap(expected);
    Map<String, DocumentSymbol> actualMap = toMap(actual);
    assertEquals("Elements on level " + level, expectedMap.keySet(), actualMap.keySet());
    for (DocumentSymbol expectedNode: expectedMap.values()) {
      assertNodeEquals(expectedNode, actualMap.get(expectedNode.getName()), level);
    }
  }

  /**
   * The method compares only node types and nested nodes.
   * Two outline nodes with different ranges will be equal.
   */
  private void assertNodeEquals(DocumentSymbol expected, DocumentSymbol actual, String oldLevel) {
    String level = oldLevel + '/' + expected.getName();
    assertEquals("Node types for " + level, expected.getKind(), actual.getKind());
    assertNodeListEquals(expected.getChildren(), actual.getChildren(), level);
  }

  private Map<String, DocumentSymbol> toMap(List<DocumentSymbol> nodes) {
    return nodes.stream().collect(Collectors.toMap(DocumentSymbol::getName, Function.identity()));
  }

  private List<DocumentSymbol> nested(DocumentSymbol... nodes) {
    return Arrays.asList(nodes);
  }

  private DocumentSymbol node(String name, NodeType nodeType) {
    return node(name, nodeType, List.of());
  }

  private DocumentSymbol node(String name, NodeType nodeType, List<DocumentSymbol> nested) {
    return new DocumentSymbol(name, nodeType.getSymbolKind(), null, null, "", nested);
  }
}
