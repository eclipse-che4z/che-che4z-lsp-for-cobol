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
    cy.writeFile('test_files/project/.theia/settings.json', {
      'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
      'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
      'broadcom-cobol-lsp.cpy-manager.profiles': '',
    });
  });

  describe('TC250107 Test Area A', () => {
    it('Check for DIVISION warning when not in Area A', () => {
      cy.openFile('USER1.cbl');
      cy.getLineByNumber(14)
        .as('currentLine')
        .invoke('text')
        .then((originalText) => {
          cy.get('@currentLine').type('{home}      ', { delay: 100 });
          cy.get('.squiggly-warning')
            .getElementLineNumber()
            .then((lineNumber) => {
              expect(lineNumber).to.be.equal(14);
              cy.getLineByNumber(lineNumber).find('.mtk4').click().trigger('mousemove');
            });
          cy.get('div.monaco-editor-hover-content').contains(
            'The following token must start in Area A: Identification',
          );
        });
      cy.getLineByNumber(17)
        .as('currentLine')
        .invoke('text')
        .then((originalText) => {
          cy.get('@currentLine').type('{home}      ', { delay: 100 });
          cy.get('.squiggly-warning')
            .getElementLineNumber()
            .then((lineNumber) => {
              expect(lineNumber).to.be.equal(17);
              cy.getLineByNumber(lineNumber).find('span').eq(-2).trigger('mousemove', 'left');
            });
          cy.get('div.monaco-editor-hover-content').contains('The following token must start in Area A: Data');
        });
      cy.getLineByNumber(27)
        .as('currentLine')
        .invoke('text')
        .then((originalText) => {
          cy.get('@currentLine').type('{home}      ', { delay: 100 });
          cy.get('.squiggly-warning')
            .getElementLineNumber()
            .then((lineNumber) => {
              expect(lineNumber).to.be.equal(27);
              cy.getLineByNumber(lineNumber).find('.mtk4').click().trigger('mousemove');
            });
          cy.get('div.monaco-editor-hover-content').contains('The following token must start in Area A: Procedure');
        });
    });

    it('Check paragraph name warning when not in Area A', () => {
      cy.openFile('USER1.cbl');
      cy.getLineByNumber(32)
        .as('currentLine')
        .invoke('text')
        .then((originalText) => {
          cy.get('@currentLine').type('{home}      ', { delay: 100 });
          cy.get('.squiggly-warning')
            .getElementLineNumber()
            .then((lineNumber) => {
              expect(lineNumber).to.be.equal(32);
              cy.getLineByNumber(lineNumber).find('.mtk1').click().trigger('mousemove');
            });
          cy.get('div.monaco-editor-hover-content').contains(
            'The following token must start in Area A: 100-Print-User',
          );
        });
    });
    it('Check FD/SD level data', () => {
      cy.openFile('USER1.cbl');
      cy.getLineByNumber(17).type('{enter}FILE SECTION.{enter}{ctrl}z{enter}', {
        delay: 100,
      });
      cy.getLineByNumber(19).type('    FD  TRANS-FILE-IN IS EXTERNAL.', {
        delay: 100,
      });
      cy.get('.squiggly-warning')
        .getElementLineNumber()
        .then((lineNumber) => {
          expect(lineNumber).to.be.equal(19);
          cy.getLineByNumber(lineNumber).find('.mtk4').contains('FD').click().trigger('mousemove');
        });
      cy.get('div.monaco-editor-hover-content').contains('The following token must start in Area A: FD');
    });
  });
});

describe('TC250109 Test Area B', () => {
  it('Check statement warning when not in Area B', () => {
    cy.openFile('USER1.cbl');
    cy.getLineByNumber(33)
      .as('currentLine')
      .invoke('text')
      .then((originalText) => {
        cy.get('@currentLine').type('{home}{backspace}', { delay: 100 });
        cy.get('.squiggly-warning')
          .getElementLineNumber()
          .then((lineNumber) => {
            expect(lineNumber).to.be.equal(33);
            cy.getLineByNumber(lineNumber).find('.mtk4').contains('Move').click().trigger('mousemove');
          });
        cy.get('div.monaco-editor-hover-content').contains('The following token must start in Area B: Move');
      });
    cy.getLineByNumber(42)
      .as('currentLine')
      .invoke('text')
      .then((originalText) => {
        cy.get('@currentLine').type('{home}{backspace}', { delay: 100 });
        cy.get('.squiggly-warning')
          .getElementLineNumber()
          .then((lineNumber) => {
            expect(lineNumber).to.be.equal(42);
            cy.getLineByNumber(lineNumber).find('.mtk4').contains('Display').click().trigger('mousemove');
          });
        cy.get('div.monaco-editor-hover-content').contains('The following token must start in Area B: Display');
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
        cy.get('.squiggly-warning')
          .getElementLineNumber()
          .then((lineNumber) => {
            expect(lineNumber).to.be.equal(49);
            cy.getLineByNumber(lineNumber).find('.mtk11').contains('HELLO').click().trigger('mousemove');
          });
        cy.get('div.monaco-editor-hover-content').contains(
          'Program-name must be identical to the program-name of the corresponding PROGRAM-ID paragraph: HELLO-WORLD',
        );
      });
  });
});
