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

//F97476 - Support for "REPLACING" statement

context('This is a F97476 spec', () => {
  describe.skip('TC248045 Replacing Basic Scenario', () => {
    beforeEach(() => {
      cy.writeFile('test_files/project/.theia/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });

      cy.writeFile('test_files/project/.vscode/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });
    });
    afterEach(() => {
      cy.closeCurrentTab();
    });
    it('Checks basic REPLACING feature', () => {
      cy.openFile('REPLACING.CBL');
      cy.goToLine(9);
      cy.get('.squiggly-error')
        .should('have.length', 1)
        .getElementLineNumber()
        .then((lineNumber) => {
          expect(lineNumber).to.be.equal(9);
          cy.getLineByNumber(lineNumber).contains('ABC-ID');
        });
      cy.getLineByNumber(6).contains('COPY REPL.').type('{end}{backspace} REPLACING ==TAG== BY ==ABC== .', {
        delay: 100,
      });

      cy.get('.squiggly-error').should('not.exist');
      cy.getLineByNumber(9).findText('ABC-ID').goToDefinition();
      cy.get('.view-overlays .symbolHighlight');
      cy.getCurrentTab().should('have.text', 'REPL');
      cy.getCurrentLineNumber().should('eq', 1);
      cy.getCurrentLine().contains('05 TAG-ID PIC 9.');
    });
  });

  describe('TC248087 Replacing twice for one variable', () => {
    beforeEach(() => {
      cy.writeFile('test_files/project/.theia/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });

      cy.writeFile('test_files/project/.vscode/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });
    });
    it('Checks REPLACING feature twice for one variable', () => {
      cy.openFile('REPLACING.CBL');
      cy.goToLine(22);
      cy.get('.squiggly-error')
        .should('have.length', 1)
        .getElementLineNumber()
        .then((lineNumber) => {
          expect(lineNumber).to.be.equal(22);
          cy.getLineByNumber(lineNumber).contains('ABC-ID');
        });
      cy.getLineByNumber(19)
        .contains('COPY REPL.')
        .type('{end}{backspace} REPLACING ==TAG== BY ==ABC== {enter}       ==ABC== by ==XYZ==.', { delay: 100 });
      cy.getLineByNumber(23)
        .contains('ABC-ID')
        .type('{end}{backspace}{backspace}{backspace}{backspace}{backspace}{backspace}{backspace} XYZ-ID.', {
          delay: 100,
        });

      cy.get('.squiggly-error').should('not.exist');
      cy.getLineByNumber(23).findText('XYZ-ID').goToDefinition();
      cy.getCurrentTab().should('have.text', 'REPL');
      // cy.get('.view-overlays .symbolHighlight');
      cy.getCurrentLineNumber().should('eq', 1);
      cy.getCurrentLine().contains('05 TAG-ID PIC 9.').closeCurrentTab();
      cy.closeCurrentTab();
      cy.get('.theia-button.secondary').contains("Don't save").click();
    });
  });

  describe('TC248130 Several REPLACING patterns in one COPY statement', () => {
    beforeEach(() => {
      cy.writeFile('test_files/project/.theia/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });

      cy.writeFile('test_files/project/.vscode/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });
    });
    afterEach(() => {
      cy.writeFile('test_files/project/testing/REPL', '       05 TAG-ID PIC 9.');
    });
    it('Checks REPLACING feature in one COPY statement', () => {
      cy.openFolder('testing').openFile('REPL');
      cy.getLineByNumber(1).type('{end}{enter}       05 TAR-ID PIC 9. {ctrl}{c}').closeCurrentTab();
      cy.get('.theia-button.main').click();

      cy.openFile('REPLACING.CBL');
      cy.goToLine(22);
      cy.get('.squiggly-error')
        .should('have.length', 1)
        .getElementLineNumber()
        .then((lineNumber) => {
          expect(lineNumber).to.be.equal(22);
          cy.getLineByNumber(lineNumber).contains('ABC-ID');
        });
      cy.getLineByNumber(19)
        .contains('COPY REPL.')
        .type('{end}{backspace}  REPLACING ==TAG== BY ==ABC== {enter} ==TAR== by ==XYZ==.', { delay: 100 });
      cy.getLineByNumber(23).contains('MOVE 0 TO ABC-ID.').type('{end}{enter} MOVE 0 TO XYZ-ID.');
      cy.get('.squiggly-error').should('not.exist');

      cy.getLineByNumber(23).findText('ABC-ID').goToDefinition();
      cy.getCurrentTab().should('have.text', 'REPL');
      cy.get('.view-overlays .symbolHighlight');
      cy.getCurrentLineNumber().should('eq', 1);
      cy.getCurrentLine().contains('05 TAG-ID PIC 9.').closeCurrentTab();

      cy.getLineByNumber(24).findText('XYZ-ID').goToDefinition();
      cy.getCurrentTab().should('have.text', 'REPL');
      cy.get('.view-overlays .symbolHighlight');
      cy.getCurrentLineNumber().should('eq', 2);
      cy.getCurrentLine().contains('05 TAR-ID PIC 9.').closeCurrentTab();
      cy.closeCurrentTab();
      cy.get('.theia-button.secondary').contains("Don't save").click();
    });
  });

  describe.skip('TC248131 Several COPY statements with replacing', () => {
    beforeEach(() => {
      cy.writeFile('test_files/project/.theia/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });

      cy.writeFile('test_files/project/.vscode/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });
    });
    afterEach(() => {
      cy.writeFile('test_files/project/testing/REPL', '       05 TAG-ID PIC 9.');
    });
    it('Checks REPLACING feature in several COPY statetment', () => {
      cy.openFolder('testing').openFile('REPL');
      cy.getLineByNumber(1).type('{end}{enter}       05 TAR-ID PIC 9. {ctrl}{c}').closeCurrentTab();
      cy.get('.theia-button.main').click();

      cy.openFile('REPLACING.CBL');
      cy.getLineByNumber(6)
        .contains('COPY REPL.')
        .type(
          '{end}{backspace}  REPLACING ==TAG== BY ==ABC== {enter}==TAR== by ==XYZ==. {enter}COPY REPL REPLACING ==TAG== BY ==DEF==.',
          { delay: 100 },
        );
      cy.getLineByNumber(11)
        .contains('MOVE 0 TO ABC-ID.')
        .type('{end}{enter} MOVE 0 TO XYZ-ID.{enter} MOVE 0 TO DEF-ID.');

      cy.get('.squiggly-error').should('not.exist');

      cy.getLineByNumber(11).findText('ABC-ID').goToDefinition();
      cy.getCurrentTab().should('have.text', 'REPL');
      cy.get('.view-overlays .symbolHighlight');
      cy.getCurrentLineNumber().should('eq', 1);
      cy.getCurrentLine().contains('05 TAG-ID PIC 9.').closeCurrentTab();

      cy.getLineByNumber(12).findText('XYZ-ID').goToDefinition();
      cy.getCurrentTab().should('have.text', 'REPL');
      cy.get('.view-overlays .symbolHighlight');
      cy.getCurrentLineNumber().should('eq', 2);
      cy.getCurrentLine().contains('05 TAR-ID PIC 9.').closeCurrentTab();

      cy.getLineByNumber(13).findText('DEF-ID').goToDefinition();
      cy.getCurrentTab().should('have.text', 'REPL');
      cy.get('.view-overlays .symbolHighlight');
      cy.getCurrentLineNumber().should('eq', 1);
      cy.getCurrentLine().contains('05 TAG-ID PIC 9.').closeCurrentTab();

      cy.getLineByNumber(8)
        .contains('COPY REPL REPLACING ==TAG== BY ==DEF==.')
        .type('{end}{backspace}{backspace}{backspace}{backspace}{backspace}{backspace}{backspace}{backspace}DEF.');
      cy.getLineByNumber(13).findText('DEF-ID').goToDefinition();
      cy.getCurrentTab().should('have.text', 'REPL');
      cy.get('.view-overlays .symbolHighlight');
      cy.getCurrentLineNumber().should('eq', 1);
      cy.getCurrentLine().contains('05 TAG-ID PIC 9.').closeCurrentTab();
      cy.closeCurrentTab();
      cy.get('.theia-button.secondary').contains("Don't save").click();
    });
  });

  describe.skip('TC248135 REPLACING - check paragraph present', () => {
    beforeEach(() => {
      cy.writeFile('test_files/project/.theia/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });

      cy.writeFile('test_files/project/.vscode/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });
    });
    afterEach(() => {
      cy.writeFile('test_files/project/testing/REPL', '       05 TAG-ID PIC 9.');
    });
    it('Checks REPLACING feature with paragraphs', () => {
      cy.openFolder('testing').openFile('REPL');
      cy.getLineByNumber(1).type('{end}{enter}       05 TAR-ID PIC 9. {ctrl}{c}').closeCurrentTab();
      cy.get('.theia-button.main').click();

      cy.openFile('REPLA.CBL');
      cy.getLineByNumber(8).contains('REPLACING').type('{end}{enter}{ctrl} ');
      cy.get('[widgetid="editor.widget.suggestWidget"]').contains('NAME3').closeCurrentTab();
    });
  });

  describe.skip('TC248135 REPLACING - check paragraph present', () => {
    beforeEach(() => {
      cy.writeFile('test_files/project/.theia/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });

      cy.writeFile('test_files/project/.vscode/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });
    });
    it('Check completion suggestions for variables(paragraphs) being replaced', () => {
      cy.openFile('REPLA.CBL').goToLine(8);
      cy.getCurrentLine().type('{end}{enter}');
      cy.getCurrentLine().type('{ctrl} ');
      cy.get('[widgetid="editor.widget.suggestWidget"]').contains('NAME3');
    });
  });

  describe.skip('TC250747 [Mapping] Support building of the extended document - Basic Scenario', () => {
    beforeEach(() => {
      cy.writeFile('test_files/project/.theia/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });

      cy.writeFile('test_files/project/.vscode/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });
    });
    it('Check completion suggestions for variables(paragraphs) being replaced', () => {
      cy.openFile('PAYLIB.CBL').goToLine(33);
      cy.getCurrentLine().type('{end}{backspace}{enter}', { delay: 200 });
      cy.getCurrentLine().type('ASTRO', { delay: 200 });
      cy.goToLine(36);
      cy.getCurrentLineErrors({ expectedLine: 36, errorType: 'error' })
        .getHoverErrorMessage()
        .contains('Invalid definition for: ABC-ID');
      cy.goToLine(14);
      cy.getCurrentLine().type('{home}PROCESS NODYNAM{enter}');
      cy.goToLine(37);
      cy.getCurrentLineErrors({ expectedLine: 37, errorType: 'error' })
        .getHoverErrorMessage()
        .contains('Invalid definition for: ABC-ID');
    });
  });

  describe('TC250946 [Mapping] Support building of the extended document - Replace by arithmetic operations', () => {
    beforeEach(() => {
      cy.writeFile('test_files/project/.theia/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });

      cy.writeFile('test_files/project/.vscode/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });
    });
    it('Checks replace by arithmetic operations', () => {
      cy.openFile('PAYLIB.CBL').goToLine(37);
      cy.getCurrentLine().type('{end}{backspace}{backspace}{backspace}{backspace}{backspace}*3== .', {delay: 300}).wait(1000);
      cy.getCurrentLineErrors({ expectedLine: 37 })
        .getHoverErrorMessage()
        .contains("Syntax error on '*' expected SECTION");
    });
  });

  describe('TC250950 [Mapping] Parser Does React on CPY Exit Tag', () => {
    beforeEach(() => {
      cy.writeFile('test_files/project/.theia/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });

      cy.writeFile('test_files/project/.vscode/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });
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

  describe.skip('TC250951 [Mapping] Show Syntax and Semantic Errors from Copybooks', () => {
    // manual scenario is now working
    beforeEach(() => {
      cy.writeFile('test_files/project/.theia/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });

      cy.writeFile('test_files/project/.vscode/settings.json', {
        'broadcom-cobol-lsp.cpy-manager.paths-local': ['testing'],
        'broadcom-cobol-lsp.cpy-manager.paths-dsn': [],
        'broadcom-cobol-lsp.cpy-manager.profiles': '',
      });
      cy.writeFile('test_files/project/testing/REPL.cpy', 'MOVE.');
    });

    it('Checks Syntax and Semantic Errors from Copybooks', () => {
      cy.openFolder('testing').openFile('REPL.cpy');
      cy.goToLine(1).wait(500);
      cy.getCurrentLineErrors({ expectedLine: 1 }).getHoverErrorMessage();
      // .contains("Syntax error on 'DIVISI' expected DIVISION");
      // cy.openFile("REPLACING.CBL").goToLine(6)
      // cy.getCurrentLine().type("{home}*")
      // cy.goToLine(8)
      // cy.getCurrentLine().type("{end}{enter}")
      // cy.getCurrentLine().type("COPY REPL.")
    });
  });
});
