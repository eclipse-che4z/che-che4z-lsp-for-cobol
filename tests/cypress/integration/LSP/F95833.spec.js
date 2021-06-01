/**
 * Copyright (c) 2021 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.

 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/

 * SPDX-License-Identifier: EPL-2.0

 * Contributors:
 *  Broadcom, Inc. - initial API and implementation
 */

/// <reference types="Cypress" />
//@ts-ignore
/// <reference types="../../support/" />

//F95833 - LSP for COBOL - support for CICS statements (basic intellisense)

context('This is F95833 spec', () => {
  describe('TC312735 Check EXEC CICS is in Procedure Division', () => {
    it(['smoke'], 'Checks that EXEC CICS could be run *only* under Procedure Division.', () => {
      cy.openFile('ADSORT.cbl').goToLine(59);
      cy.getCurrentLine().should('not.have.class', '.squiggly-error');
      cy.getCurrentLine().type('{selectall}{backspace}');
      cy.goToLine(35);
      cy.getCurrentLine().type('       EXEC CICS XCTL PROGRAM (XCTL1) END-EXEC.').wait(500);
      cy.getCurrentLineErrors({ expectedLine: 35 })
        .getHoverErrorMessage()
        .contains('Missing token EXEC or SQL at execSqlStatement');
    });
  });

  describe('TC312745 Error check', () => {
    it(['smoke'], 'Error check in CICS', () => {
      cy.openFile('ADSORT.cbl').goToLine(59);
      cy.getCurrentLine().should('not.have.class', '.squiggly-error');
      cy.getCurrentLine().type('{selectall}{backspace}');
      cy.getCurrentLine().type(
        `             EXEC CICS XCTL123 PROGRAM (XCTL1) END-EXEC.              
        GOBACK.`,
      );
      cy.goToLine(51);
      cy.getCurrentLineErrors({ expectedLine: 51 }).getHoverErrorMessage().contains("Syntax error on 'XCTL123'");

      cy.getLineByNumber(51).type('{home}{selectall}             EXEC CICS XCTL PROGRAM (XCTL1) END-EXEC.{enter}');
      cy.goToLine(51);
      cy.getCurrentLine().should('not.have.class', '.squiggly-error');
    });
  });

  // describe('TC312738 CICS variables and paragraphs support', () => {
  //   it(['investigation'], "Try 'Go to Definition' on variables and paragraphs", () => {
  //     cy.openFile('ADSORT.cbl').goToLine(59);
  //     cy.getLineByNumber(59).findText('XCTL1').goToDefinition();
  //     cy.getCurrentLineNumber().should('eq', 28);
  //     cy.getCurrentLine().contains('XCTL1');
  //     cy.getLineByNumber(59).type('{end}{enter}');
  //     cy.getLineByNumber(60).type('EXEC CICS XCTL RESP(XCTL1) PROGRAM (XCTL1) END-EXEC.');
  //     cy.pause();
  //     cy.getLineByNumber(60).findText('XCTL1').goToDefinition();
  //     cy.getCurrentLineNumber().should('eq', 28);

  //     cy.getCurrentLine().contains('XCTL1');
  //   });
  // });

  describe('TC312753 Check EXEC CICS allows free arguments order', () => {
    it("Try 'Go to Definition' on variables and paragraphs", () => {
      cy.openFile('ADSORT.cbl').goToLine(59);
      cy.getCurrentLine().type("{end}{enter}EXEC CICS SEND MAP('DETAIL') MAPSET(DETAIL-MAPS)    ERASE END-EXEC.");
      cy.getLineByNumber(60).should('not.have.class', '.squiggly-error');
      cy.getCurrentLine().type("{end}{enter}EXEC CICS SEND ERASE MAP('DETAIL') MAPSET(DETAIL-MAPS)    END-EXEC.");
      cy.getLineByNumber(61).should('not.have.class', '.squiggly-error');
      cy.getCurrentLine().type("{end}{enter}EXEC CICS SEND MAPSET(DETAIL-MAPS) MAP('DETAIL')   ERASE   END-EXEC.");
      cy.getLineByNumber(62).should('not.have.class', '.squiggly-error');
    });
  });

  describe('TC314992 CICS as a Variable Name', () => {
    it('CICS is a valid variable name and syntax analysis should not return an error in this case.', () => {
      cy.openFile('ADSORT.cbl').goToLine(26);
      cy.getCurrentLine().type("08 CICS VALUE 'CICS'").wait(500);
      cy.getLineByNumber(26).should('not.have.class', '.squiggly-error');
    });
  });
});
