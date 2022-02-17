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

import { COBOLLS, Theia, VSCODE } from '@eclipse/che-che4z/tests/dist/selectors';

const env = Cypress.env('ide');
const IDE = env === 'theia' ? Theia : VSCODE;

//F116242 LSP for COBOL:
context('This is F116242 Spec', () => {
  beforeEach(() => {
    cy.updateConfigs('basic');
  });
  describe('TC335744 Toggle Enable Commenting out whole section', () => {
    it(['smoke'], 'Checks Enabling and disabling comment for single line', () => {
      cy.openFile('ABCD.cbl');
      cy.getLineByNumber(21).type('{ctrl}/');
      cy.getLineByNumber(21).contains('*');
      cy.getLineByNumber(21).type('{ctrl}/');
      cy.getLineByNumber(21).contains('*').should('not.exist');
    });
  });
  describe('TC335744 Toggle Enable Commenting out whole section', () => {
    it(['smoke'], 'Checks Enabling and disabling comment for group of lines', () => {
      cy.openFile('ABCD.cbl');
      cy.getLineByNumber(18).type('{selectAll}{ctrl}/');
      for (let i = 14; i < 18; i++) {
        cy.getLineByNumber(i).contains('*');
      }
      cy.getLineByNumber(18).type('{selectAll}{ctrl}/');
      for (let i = 14; i < 18; i++) {
        cy.getLineByNumber(i).contains('*').should('not.exist');
      }
    });
  });
  describe('TC335744  Enable Comment Command using d, / and -', () => {
    it(['smoke'], 'replace d with * for debug lines', () => {
      cy.openFile('ABCD.cbl');
      cy.getLineByNumber(15).type('{home}{leftArrow}{leftArrow}d');
      cy.getLineByNumber(15).type('{ctrl}/');
      //d replaced with asterisk
      cy.getLineByNumber(15).contains('*');
      cy.getLineByNumber(15).contains('d').should('not.exist');
      cy.getLineByNumber(15).contains('*');
      cy.getLineByNumber(15).type('{ctrl}/');
      cy.getLineByNumber(15).contains('*').should('not.exist');
      cy.getLineByNumber(15).type('{home}{backspace}');
      //- replaced with asterisk
      cy.getLineByNumber(15).type('{home}{leftArrow}{leftArrow}-');
      cy.getLineByNumber(15).type('{ctrl}/');
      cy.getLineByNumber(15).contains('*');
      cy.getLineByNumber(15).contains(' -').should('not.exist');
      cy.getLineByNumber(15).type('{ctrl}/');
      cy.getLineByNumber(15).contains('*').should('not.exist');
      cy.getLineByNumber(15).type('{home}{backspace}');
      //'/' treated as existing comment and removed with toggle command
      cy.getLineByNumber(15).type('{home}{leftArrow}{leftArrow}/');
      cy.getLineByNumber(15).type('{ctrl}/');
      cy.getLineByNumber(15).contains('*').should('not.exist');
      cy.getLineByNumber(15).type('{ctrl}/');
      cy.getLineByNumber(15).contains('*');
      cy.getLineByNumber(15).type('{home}{backspace}');
    });
  });
  describe('TC335744 Enable Commenting out whole section', () => {
    it(['smoke'], 'Add,Remove and Toggle Comment Command', () => {
      cy.openFile('ABCD.cbl');
      cy.getLineByNumber(15);
      //TODO Add it as commands in flow.ts
      cy.F1();
      cy.get(Theia.inputF1).as('quickOpen').type('Add Cobol Line Comment').type('{enter}').wait(500);
      cy.getLineByNumber(15).contains('*');
      cy.F1();
      cy.get(Theia.inputF1).as('quickOpen').type('Remove Cobol Line Comment').type('{enter}').wait(500);
      cy.getLineByNumber(15).contains('*').should('not.exist');
      cy.F1();
      cy.get(Theia.inputF1).as('quickOpen').type('Toggle Cobol Line Comment').type('{enter}').wait(500);
      cy.getLineByNumber(15).contains('*');
      cy.F1();
      cy.get(Theia.inputF1).as('quickOpen').type('Toggle Cobol Line Comment').type('{enter}').wait(500);
      cy.getLineByNumber(15).contains('*').should('not.exist');
    });
  });
});
