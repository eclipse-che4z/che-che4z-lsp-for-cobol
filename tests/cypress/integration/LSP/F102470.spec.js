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

//F102470 - LSP for COBOL: support Community requests and tech debt

context('This is F102470 spec', () => {
  beforeEach(() => {
    cy.writeFile('test_files/project/.theia/settings.json', {
      'broadcom-cobol-lsp.subroutine-manager.paths-local': ['subroutines'],
    });
    cy.writeFile('test_files/project/.vscode/settings.json', {
      'broadcom-cobol-lsp.subroutine-manager.paths-local': ['subroutines'],
    });
  });

  describe('US708186 Check work with subroutines', () => {
    it('Error check in subroutine resolution', () => {
      cy.openFile('CALL.cbl').goToLine(8);
      cy.getCurrentLine().should('not.have.class', '.squiggly-error');
      cy.goToLine(10);
      cy.getCurrentLine().should('not.have.class', '.squiggly-error');
      cy.goToLine(9);
      cy.getCurrentLineErrors({ expectedLine: 9, errorType: 'info' })
        .getHoverErrorMessage()
        .contains('SUB2: Subroutine not found');
    });

    it('Go to definition for subroutine', () => {
      cy.openFile('CALL.cbl').goToLine(8);
      cy.getLineByNumber(8).findText('SUB1').goToDefinition();
      cy.getCurrentTab().should('contain.text', 'SUB1.cob');
    });

    it.skip('Autocomplete contains only locally available subroutines', () => {
      cy.openFile('CALL.cbl');
      cy.goToLine(10);
      cy.getCurrentLine().type('{end}{enter}');
      cy.getCurrentLine().type('{ctrl} ').type('SUB'); // Ctrl+Space
      cy.get('[widgetid="editor.widget.suggestWidget"]').contains('SUB1');
      cy.get('[widgetid="editor.widget.suggestWidget"]').contains('SUB3');
      cy.get('[widgetid="editor.widget.suggestWidget"]').not().contains('SUB3');
    });
  });
});
