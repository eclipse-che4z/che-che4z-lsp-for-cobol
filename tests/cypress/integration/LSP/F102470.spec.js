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

import { Theia, VSCODE } from '@eclipse/che-che4z/tests/dist/selectors';

const env = Cypress.env('ide');
const IDE = env === 'theia' ? Theia : VSCODE;

//F102470 - LSP for COBOL: support Community requests and tech debt

context('This is F102470 spec', () => {
  beforeEach(() => {
    cy.updateConfigs('subroutines');
  });
  describe('US708186 Check work with subroutines', () => {
    it(['smoke'], 'Error check in subroutine resolution', () => {
      cy.openFile('CALL.cbl').goToLine(21);
      cy.getCurrentLine().should('not.have.class', IDE.editorError);
      cy.goToLine(23);
      cy.getCurrentLine().should('not.have.class', IDE.editorError);
      cy.goToLine(22);
      cy.getCurrentLineErrors({ expectedLine: 22, errorType: 'info' })
        .getHoverErrorMessage()
        .contains('SUB2: Subroutine not found');
    });

    it(['smoke', 'investigation'], 'Go to definition for subroutine', () => {
      cy.openFile('CALL.cbl').goToLine(21);
      cy.getLineByNumber(21).findText('SUB1').goToDefinition();
      cy.getCurrentTab().should('contain.text', 'SUB1.cob');
    });

    it(['smoke'], 'Autocomplete contains only locally available subroutines', () => {
      cy.updateConfigs('subroutines');
      cy.openFile('CALL.cbl');
      cy.goToLine(23);
      cy.getCurrentLine().type('{end}{enter}');
      cy.getCurrentLine().type('{ctrl} ').type('SUB'); // Ctrl+Space
      cy.get(IDE.suggestWidget).contains('SUB1');
      cy.get(IDE.suggestWidget).contains('SUB3');
      cy.get(IDE.suggestWidget).not().contains('SUB3');
    });
  });
});
