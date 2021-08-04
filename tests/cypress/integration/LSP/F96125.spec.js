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

//F96125 -

context('This is F96125 spec', () => {
  beforeEach(() => {
    cy.updateConfigs('testing');
  });

  describe('TC250107 Test Area A', () => {
    it(['smoke', 'CI'], 'Check for DIVISION warning when not in Area A', () => {
      cy.openFile('USER1.cbl');
      cy.getLineByNumber(14)
        .as('currentLine')
        .invoke('text')
        .then((originalText) => {
          cy.get('@currentLine').type('{home}      ', { delay: 100 });
          cy.goToLine(14);
          cy.getCurrentLineErrors({ expectedLine: 14, errorType: 'warning' })
            .getHoverErrorMessage()
            .contains('The following token must start in Area A: Identification');
          cy.getLineByNumber(17)
            .as('currentLine')
            .invoke('text')
            .then((originalText) => {
              cy.get('@currentLine').type('{home}      ', { delay: 100 });
              cy.goToLine(17);
              cy.getCurrentLineErrors({ expectedLine: 17, errorType: 'warning' })
                .getHoverErrorMessage()
                .contains('The following token must start in Area A: Data');
            });
          cy.getLineByNumber(27)
            .as('currentLine')
            .invoke('text')
            .then((originalText) => {
              cy.get('@currentLine').type('{home}      ', { delay: 100 });
              cy.goToLine(27);
              cy.getLineByNumber(27)
                .as('currentLine')
                .invoke('text')
                .then((originalText) => {
                  cy.get('@currentLine').type('{home}      ', { delay: 100 });
                  cy.goToLine(27);
                  cy.getCurrentLineErrors({ expectedLine: 27, errorType: 'warning' })
                    .getHoverErrorMessage()
                    .contains('The following token must start in Area A: Procedure');
                });
            });
        });
    });
    it(['smoke'], 'Check paragraph name warning when not in Area A', () => {
      cy.openFile('USER1.cbl');
      cy.getLineByNumber(32)
        .as('currentLine')
        .invoke('text')
        .then((originalText) => {
          cy.get('@currentLine').type('{home}      ', { delay: 100 });
          cy.goToLine(32);
          cy.getCurrentLineErrors({ expectedLine: 32, errorType: 'warning' })
            .getHoverErrorMessage()
            .contains('The following token must start in Area A: 100-Print-User');
        });
    });
    it(['smoke', 'CI'], 'Check FD/SD level data', () => {
      cy.openFile('USER1.cbl');
      cy.getLineByNumber(17).type('{enter}FILE SECTION.{enter}{ctrl}z{enter}', {
        delay: 100,
      });
      cy.getLineByNumber(19).type('    FD  TRANS-FILE-IN IS EXTERNAL.', {
        delay: 100,
      });
      cy.goToLine(19);
      cy.getCurrentLineErrors({ expectedLine: 19, errorType: 'warning' })
        .getHoverErrorMessage()
        .contains('The following token must start in Area A: FD');
    });
  });

  describe('TC250109 Test Area B', () => {
    it(['smoke', 'CI'], 'Check statement warning when not in Area B', () => {
      cy.openFile('USER1.cbl');
      cy.getLineByNumber(33)
        .as('currentLine')
        .invoke('text')
        .then((originalText) => {
          cy.get('@currentLine').type('{home}{backspace}', { delay: 100 });
          cy.goToLine(33);
          cy.getCurrentLineErrors({ expectedLine: 33, errorType: 'warning' })
            .getHoverErrorMessage()
            .contains('The following token must start in Area B: Move');
        });
      cy.getLineByNumber(42)
        .as('currentLine')
        .invoke('text')
        .then((originalText) => {
          cy.get('@currentLine').type('{home}{backspace}', { delay: 100 });
          cy.goToLine(42);
          cy.getCurrentLineErrors({ expectedLine: 42, errorType: 'warning' })
            .getHoverErrorMessage()
            .contains('The following token must start in Area B: Display');
        });
    });
  });

  describe('TC250108 Test Program Name', () => {
    it('Check if program name is similar', () => {
      cy.openFile('USER1.cbl');
      cy.getLineByNumber(49)
        .as('currentLine')
        .invoke('text')
        .then((originalText) => {
          cy.get('@currentLine').type('{backspace}1.', { delay: 100 });
          cy.goToLine(49);
          cy.getCurrentLineErrors({ expectedLine: 49, errorType: 'warning' })
            .eq(0)
            .getHoverErrorMessage()
            .contains(
              'Program-name must be identical to the program-name of the corresponding PROGRAM-ID paragraph: HELLO-WORLD',
            );
        });
    });
  });
});
