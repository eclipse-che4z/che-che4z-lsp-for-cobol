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

//F95834: LSP for COBOL - support for EXEC SQL statements (basic intellisense)

context('This is F95834 spec', () => {
  beforeEach(() => {
    cy.updateConfigs('basic');
  });
  describe('TC314771 Support INCLUDE in EXEC SQL to build extended document', () => {
    it('Checks EXEC SQL with copybooks', () => {
      cy.openFile('TEST.CBL').goToLine(21);
      cy.getCurrentLine().type('exec-sql-include');
      cy.get('[widgetid="editor.widget.suggestWidget"]').contains('exec-sql-include').click();
      cy.getLineByNumber(21).contains('exec sql include sqlstatement.cpy end-exec.');
      cy.getCurrentLine().type('{selectall}       exec sql include A end-exec.');
      cy.get('.squiggly-error')
        .getElementLineNumber()
        .then((lineNumber) => {
          expect(lineNumber).to.be.equal(21);
          cy.getLineByNumber(lineNumber).find('span').eq(-1).click().trigger('mousemove');
        });
      cy.get('div.monaco-editor-hover-content').should(($content) => {
        [
          "Syntax error on 'WORK-VARIABLES' expected SECTION",
          "Syntax error on 'PROGRAM-STATUS' expected SECTION",
          "Syntax error on 'PIC' expected SECTION",
          'The following token must start in Area A: PROGRAM-STATUS',
        ].forEach((message) => {
          expect($content).to.contain.text(message);
        });
      });
    });
  });
});
