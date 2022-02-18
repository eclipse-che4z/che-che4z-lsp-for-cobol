/**
 * Copyright (c) 2022 Broadcom.
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
      toggleCommentCommand(21);
      checkCommented(21);
      toggleCommentCommand(21);
      checkNotCommented(21);
    });
  });
  describe('TC335744 Toggle Enable Commenting out whole section', () => {
    it(['smoke'], 'Checks Enabling and disabling comment for group of lines', () => {
      cy.openFile('ABCD.cbl');
      cy.getLineByNumber(18).type('{selectAll}{ctrl}/');
      for (let i = 14; i < 18; i++) {
        checkCommented(i);
      }
      cy.getLineByNumber(18).type('{selectAll}{ctrl}/');
      for (let i = 14; i < 18; i++) {
        checkNotCommented(i);
      }
    });
  });
  describe('TC335744  Enable Comment Command using d, / and -', () => {
    it(['smoke'], 'replace d with * for debug lines', () => {
      cy.openFile('ABCD.cbl');
      //d replaced with asterisk
      cy.getLineByNumber(15).type('{home}{leftArrow}{leftArrow}d');
      toggleCommentCommand(15);
      cy.getLineByNumber(15).contains('d').should('not.exist');
      checkCommented(15);
      toggleCommentCommand(15);
      checkNotCommented(15);
      cy.getLineByNumber(15).type('{home}{backspace}');

      //- replaced with asterisk
      cy.getLineByNumber(15).type('{home}{leftArrow}{leftArrow}-');
      toggleCommentCommand(15);
      checkCommented(15);
      cy.getLineByNumber(15).contains(' -').should('not.exist');
      toggleCommentCommand(15);
      checkNotCommented(15);
      cy.getLineByNumber(15).type('{home}{backspace}');

      //'/' treated as existing comment and removed with toggle command
      cy.getLineByNumber(15).type('{home}{leftArrow}{leftArrow}/');
      toggleCommentCommand(15);
      checkNotCommented(15);
      toggleCommentCommand(15);
      checkCommented(15);
      cy.getLineByNumber(15).type('{home}{backspace}');
    });
  });
  describe('TC335744 Enable Commenting out whole section', () => {
    it(['smoke'], 'Add,Remove and Toggle Comment Command', () => {
      cy.openFile('ABCD.cbl');
      cy.getLineByNumber(15);
      //TODO Add it as commands in flow.ts
      cy.F1();
      cy.get(IDE.inputF1).as('quickOpen').type('Add Cobol Line Comment').type('{enter}').wait(500);
      checkCommented(15);
      cy.F1();
      cy.get(IDE.inputF1).as('quickOpen').type('Remove Cobol Line Comment').type('{enter}').wait(500);
      checkNotCommented(15);
      cy.F1();
      cy.get(IDE.inputF1).as('quickOpen').type('Toggle Cobol Line Comment').type('{enter}').wait(500);
      checkCommented(15);
      cy.F1();
      cy.get(IDE.inputF1).as('quickOpen').type('Toggle Cobol Line Comment').type('{enter}').wait(500);
      checkNotCommented(15);
    });
  });
  function toggleCommentCommand(line) {
    return cy.getLineByNumber(line).type('{ctrl}/');
  }
  function checkCommented(line) {
    cy.getLineByNumber(line).contains(/^\*/).should('exist');
  }
  function checkNotCommented(line) {
    cy.getLineByNumber(line).contains(/^\*/).should('not.exist');
  }
});
