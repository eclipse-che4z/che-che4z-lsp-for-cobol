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

//F97476 - Support for "REPLACING" statement

context('This is a F97476 spec', () => {
  describe('TC248045 Replacing Basic Scenario', () => {
    beforeEach(() => {
      cy.updateConfigs('testing');
    });
    afterEach(() => {
      cy.closeCurrentTab();
    });
    it(['smoke', 'investigation'], 'Checks basic REPLACING feature', () => {
      cy.openFile('REPLACING.CBL');
      cy.goToLine(22);
      cy.getCurrentLineErrors({ expectedLine: 22 }).getHoverErrorMessage().contains('Variable ABC-ID is not defined');
      cy.getLineByNumber(19).contains('COPY REPL.').type('{end}{backspace} REPLACING LEADING ==TAG== BY ==ABC== .', {
        delay: 100,
      });

      cy.get(IDE.editorError).should('not.exist');
      cy.getLineByNumber(22).findText('ABC-ID').goToDefinition();
      cy.getCurrentTab().should('have.text', 'REPL');
      cy.getCurrentLineNumber().should('eq', 1);
      cy.getCurrentLine().contains('05 TAG-ID PIC 9.');
    });
  });

  describe('TC248087 Replacing twice for one variable', () => {
    beforeEach(() => {
      cy.updateConfigs('testing');
    });
    it('Checks REPLACING feature twice for one variable', () => {
      cy.openFile('REPLACING.CBL');
      cy.goToLine(22);
      cy.get(IDE.editorError)
        .should('have.length', 1)
        .getElementLineNumber()
        .then((lineNumber) => {
          expect(lineNumber).to.be.equal(22);
          cy.getLineByNumber(lineNumber).contains('ABC-ID');
        });
      cy.getLineByNumber(19)
        .contains('COPY REPL.')
        .type('{end}{backspace} REPLACING LEADING ==TAG== BY ==ABC== {enter}       LEADING ==ABC== by ==XYZ==.', {
          delay: 100,
        });
      cy.getLineByNumber(23)
        .contains('ABC-ID')
        .type('{end}{backspace}{backspace}{backspace}{backspace}{backspace}{backspace}{backspace} XYZ-ID.', {
          delay: 100,
        });

      cy.get(IDE.editorError).should('not.exist');
      cy.getLineByNumber(23).findText('XYZ-ID').goToDefinition();
      cy.getCurrentTab().should('have.text', 'REPL');
      cy.getCurrentLineNumber().should('eq', 1);
      cy.getCurrentLine().contains('05 TAG-ID PIC 9.').closeCurrentTab();
      cy.closeCurrentTab();
      cy.get(IDE.theiaButtonDontSave).contains("Don't save").click();
    });
  });

  describe('TC248130 Several REPLACING patterns in one COPY statement', () => {
    beforeEach(() => {
      cy.updateConfigs('testing');
    });
    afterEach(() => {
      cy.writeFile('test_files/project/testing/REPL', '       05 TAG-ID PIC 9.');
    });
    it('Checks REPLACING feature in one COPY statement', () => {
      cy.openFolder('testing').openFile('REPL');
      cy.getLineByNumber(1).type('{end}{enter}       05 TAR-ID PIC 9. {ctrl}{c}').closeCurrentTab();
      cy.get(IDE.theiaButtonOK).click();

      cy.openFile('REPLACING.CBL');
      cy.goToLine(22);
      cy.get(IDE.editorError)
        .should('have.length', 1)
        .getElementLineNumber()
        .then((lineNumber) => {
          expect(lineNumber).to.be.equal(22);
          cy.getLineByNumber(lineNumber).contains('ABC-ID');
        });
      cy.getLineByNumber(19)
        .contains('COPY REPL.')
        .type('{end}{backspace}  REPLACING LEADING ==TAG== BY ==ABC== {enter} LEADING ==TAR== by ==XYZ==.', {
          delay: 100,
        });
      cy.getLineByNumber(23).contains('MOVE 0 TO ABC-ID.').type('{end}{enter} MOVE 0 TO XYZ-ID.');
      cy.get(IDE.editorError).should('not.exist');

      cy.getLineByNumber(23).findText('ABC-ID').goToDefinition();
      cy.getCurrentTab().should('have.text', 'REPL');
      cy.get(IDE.symbolHighlight);
      cy.getCurrentLineNumber().should('eq', 1);
      cy.getCurrentLine().contains('05 TAG-ID PIC 9.').closeCurrentTab();

      cy.getLineByNumber(24).findText('XYZ-ID').goToDefinition();
      cy.getCurrentTab().should('have.text', 'REPL');
      cy.get(IDE.symbolHighlight);
      cy.getCurrentLineNumber().should('eq', 2);
      cy.getCurrentLine().contains('05 TAR-ID PIC 9.').closeCurrentTab();
      cy.closeCurrentTab();
      cy.get(IDE.theiaButtonDontSave).contains("Don't save").click();
    });
  });

  describe('TC248131 Several COPY statements with replacing', () => {
    beforeEach(() => {
      cy.updateConfigs('testing');
      cy.writeFile('test_files/project/testing/REPL', '       05 TAG-ID PIC 9.');
    });
    it('Checks REPLACING feature in several COPY statetment', () => {
      cy.openFolder('testing').openFile('REPL');
      cy.getLineByNumber(1).type('{end}{enter}       05 TAR-ID PIC 9. {ctrl}{c}').closeCurrentTab();
      cy.get(IDE.theiaButtonOK).click();

      cy.openFile('REPLACING.CBL');
      cy.getLineByNumber(19)
        .contains('COPY REPL.')
        .type(
          '{end}{backspace}  REPLACING LEADING ==TAG== BY ==ABC== {enter} LEADING ==TAR== by ==XYZ==. {enter}COPY REPL REPLACING LEADING ==TAG== BY ==DEF==.',
          { delay: 100 },
        );
      cy.getLineByNumber(24)
        .contains('MOVE 0 TO ABC-ID.')
        .type('{end}{enter} MOVE 0 TO XYZ-ID.{enter} MOVE 0 TO DEF-ID.');

      cy.getLineByNumber(24).findText('ABC-ID').goToDefinition();
      cy.getCurrentTab().should('have.text', 'REPL');
      cy.getCurrentLineNumber().should('eq', 1);
      cy.getCurrentLine().contains('05 TAG-ID PIC 9.').closeCurrentTab();

      cy.getLineByNumber(25).findText('XYZ-ID').goToDefinition();
      cy.getCurrentTab().should('have.text', 'REPL');
      cy.getCurrentLineNumber().should('eq', 2);
      cy.getCurrentLine().contains('05 TAR-ID PIC 9.').closeCurrentTab();

      cy.getLineByNumber(26).findText('DEF-ID').goToDefinition();
      cy.getCurrentTab().should('have.text', 'REPL');
      cy.getCurrentLineNumber().should('eq', 1);
      cy.getCurrentLine().contains('05 TAG-ID PIC 9.').closeCurrentTab();

      cy.getLineByNumber(21)
        .contains('COPY REPL REPLACING LEADING ==TAG== BY ==DEF==.')
        .type('{end}{backspace}{backspace}{backspace}{backspace}{backspace}{backspace}{backspace}{backspace}==DEF==.');
      cy.getLineByNumber(26).findText('DEF-ID').goToDefinition();
      cy.getCurrentTab().should('have.text', 'REPL');
      cy.getCurrentLineNumber().should('eq', 1);
      cy.getCurrentLine().contains('05 TAG-ID PIC 9.').closeCurrentTab();
      cy.closeCurrentTab();
      cy.get(IDE.theiaButtonDontSave).contains("Don't save").click();
    });
  });

  describe('TC248135 REPLACING - check paragraph present', () => {
    beforeEach(() => {
      cy.updateConfigs('testing');
      cy.writeFile('test_files/project/testing/MORECOOL.CPY', '       IDENTIFICATION DIVISION.');
    });

    afterEach(() => {
      cy.task('deleteFile', 'test_files/project/testing/MORECOOL.CPY');
    });
    it('Check completion suggestions for variables(paragraphs) being replaced', () => {
      cy.openFile('REPLA.CBL').goToLine(21);
      cy.getCurrentLine().type('{end}{enter}');
      cy.getCurrentLine().type('{ctrl} ');
      cy.get(IDE.suggestWidget).contains('NAME3');
    });
  });

  describe('TC250747 [Mapping] Support building of the extended document - Basic Scenario', () => {
    beforeEach(() => {
      cy.updateConfigs('testing');
      cy.writeFile('test_files/project/testing/MORECOOL.CPY', '       IDENTIFICATION DIVISION.');
    });
    afterEach(() => {
      cy.task('deleteFile', 'test_files/project/testing/MORECOOL.CPY');
    });
    it('Check completion suggestions for variables(paragraphs) being replaced', () => {
      cy.openFile('PAYLIB.CBL').goToLine(33);
      cy.getCurrentLine().type('{end}{backspace}{enter}ASTRO', { delay: 200 });
      cy.goToLine(36);
      cy.getCurrentLineErrors({ expectedLine: 36, errorType: 'error' })
        .getHoverErrorMessage()
        .contains('Variable ABC-ID is not defined');
      cy.goToLine(14);
      cy.getCurrentLine().type('{home}PROCESS NODYNAM{enter}');
      cy.goToLine(37);
      cy.getCurrentLineErrors({ expectedLine: 37, errorType: 'error' })
        .getHoverErrorMessage()
        .contains('Variable ABC-ID is not defined');
    });
  });

  describe('TC250946 [Mapping] Support building of the extended document - Replace by arithmetic operations', () => {
    beforeEach(() => {
      cy.updateConfigs('testing');
    });
    it(['bug'], 'Checks replace by arithmetic operations', () => {
      cy.openFile('PAYLIB.CBL').goToLine(37);
      cy.getLineByNumber(37)
        .type('{end}{backspace}{backspace}{backspace}{backspace}{backspace}*3== .', { delay: 300 })
        .wait(1000);
      cy.getCurrentLineErrors({ expectedLine: 37 })
        .getHoverErrorMessage()
        .contains("Syntax error on '*' expected SECTION");
    });
  });

  describe('TC250950 [Mapping] Parser Does React on CPY Exit Tag', () => {
    beforeEach(() => {
      cy.updateConfigs('testing');
      cy.writeFile('test_files/project/testing/MORECOOL.CPY', '       IDENTIFICATION DIVISION.');
    });

    afterEach(() => {
      cy.task('deleteFile', 'test_files/project/testing/MORECOOL.CPY');
    });

    it('Checks replace by arithmetic operations', () => {
      cy.openFile('PAYLIB.CBL');
      cy.openFolder('testing').openFile('MORECOOL.CPY');
      cy.getLineByNumber(1).first().type('{end}{backspace}{backspace}{backspace}{ctrl}s', { delay: 200 });
      cy.closeCurrentTab();

      cy.openFilePermanent('PAYLIB.CBL').goToLine(14);
      cy.getCurrentLineErrors({ expectedLine: 14 })
        .getHoverErrorMessage()
        .contains("Syntax error on 'DIVISI' expected DIVISION");
      cy.openFolder('testing').openFile('MORECOOL.CPY');
      cy.goToLine(1).wait(500);
      cy.getCurrentLineErrors({ expectedLine: 1 })
        .getHoverErrorMessage()
        .contains("Syntax error on 'DIVISI' expected DIVISION");
    });
  });

  describe('TC250951 [Mapping] Show Syntax and Semantic Errors from Copybooks', () => {
    beforeEach(() => {
      cy.updateConfigs('testing');
      cy.writeFile('test_files/project/testing/REPL.cpy', 'MOVE.');
    });

    it(['flaky_theia'], 'Checks Syntax and Semantic Errors from Copybooks', () => {
      cy.openFolder('testing').openFile('REPL.cpy');
      cy.goToLine(1).wait(500);
      cy.getCurrentLineErrors({ expectedLine: 1 })
        .getHoverErrorMessage()
        .contains("Syntax error on 'DIVISI' expected DIVISION");
    });
  });
});
