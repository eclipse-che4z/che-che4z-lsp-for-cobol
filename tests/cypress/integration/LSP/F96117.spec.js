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

//F96117 - Support for Copybooks in Git/bridge for Git

const backspace3times = '{backspace}'.repeat(3);

context('This is a F96117 spec', () => {
  describe('TC247497 - Local Copybooks - check .gitignore file and hidden folders under c4z', () => {
    it(['smoke', 'CI'], 'Finds .gitignore file under .c4z', () => {
      cy.openFolder('.c4z');
      cy.openFile('.gitignore');
      cy.get('.view-line').findText('/**');
    });
    it(['smoke', 'CI'], 'Delete .c4z folder and refresh', () => {
      cy.deleteFile('.c4z');
    });

    it(['smoke', 'CI'], 'Check .c4z/.gitignore', () => {
      cy.openFile('USER1.cbl');
      cy.openFolder('.c4z');
      cy.openFile('.gitignore');
      cy.get('.view-line').findText('/**');
      cy.closeCurrentTab();
      cy.closeFolder('.c4z');
    });
  });

  describe('TC247555 Check predefined structure in settings.json', () => {
    beforeEach(() => {
      cy.updateConfigs('empty');
    });
    afterEach(() => {
      cy.closeFolder('.theia');
    });

    it(['smoke'], 'Lets check structure in settings.json file ', () => {
      cy.openFolder('.theia').openFile('settings.json');
      cy.get('.view-line').then(($line) => {
        cy.wrap($line).eq(0).should('have.text', '{');
        cy.wrap($line).eq(1).contains('"cobol-lsp.cpy-manager.profiles": ""');
        cy.wrap($line).eq(2).contains('"cobol-lsp.cpy-manager.paths-local": [],');
        cy.wrap($line).eq(3).contains('"cobol-lsp.cpy-manager.paths-dsn": []');
        cy.wrap($line).eq(4).should('have.text', '}');
      });
    });
  });

  beforeEach(() => {
    cy.updateConfigs('testing');
  });

  describe('TC248015 - Quick Fix" actions', () => {
    afterEach(() => {
      cy.closeCurrentTab();
    });
    it(
      ['smoke'],
      '"Quick Fix" allows the user either to trigger copybooks fetch or open the settings.json for editing',
      () => {
        //Find syntax error
        cy.openFile('USERC1F.cbl');
        cy.get('.squiggly-error')
          .getElementLineNumber()
          .then((lineNumber) => {
            expect(lineNumber).to.be.equal(19);
            cy.getLineByNumber(lineNumber).find('span').eq(-1).click().trigger('mousemove');
          });
        cy.get('div.monaco-editor-hover-content').contains('BOOK3: Copybook not found');

        //Navigate to missed copybook and click on 'Resolve copybook'
        cy.getLineByNumber(19).findText('BOOK3').click().type('{ctrl}{.}');
        cy.get('.p-Widget.p-Menu')
          .contains('Resolve copybook')
          .click()
          .get('div.monaco-editor-hover-content')
          .contains('BOOK3: Copybook not found');

        //Navigate to missed copybook and click on 'open settings'
        cy.getLineByNumber(19).findText('BOOK3').click().type('{ctrl}{.}');
        cy.get('.p-Widget.p-Menu').contains('Open settings').click();

        //Open 'Preferences', filter with cobol-lsp, and find in 'User' tab 3 fields (Dsn, Local and Profiles)
        cy.get('input.settings-search-input.theia-input').type('cobol-lsp');
        cy.get('.p-TabBar-tab.preferences-scope-tab').contains('User').click();
        cy.get('#cobol-lsp\\.cpy-manager\\.paths-dsn-editor').find('.preference-array-input');
        cy.get('#cobol-lsp\\.cpy-manager\\.profiles-editor').find('.pref-input .theia-input');
        cy.get('#cobol-lsp\\.cpy-manager\\.paths-local-editor .preference-array-input');
      },
    );
  });

  describe('TC247968 - Check "Change settings" button with local copybooks', () => {
    afterEach(() => {
      cy.closeFolder('testing');
    });
    it('Let test "Change settings" button with local copybooks ', () => {
      //Open file and click on 'Change settings'
      cy.openFile('USERC1F.cbl');

      cy.getLineByNumber(19).findText('BOOK3').click().type('{ctrl}{.}');
      cy.get('.p-Widget.p-Menu').contains('Open settings').click();

      //Open 'Preferences', filter with cobol-lsp, and find in 'User' tab 'Local' and
      // add 'testing' folder to local copybooks
      cy.get('input.settings-search-input.theia-input').type('cobol-lsp');
      cy.get('.p-TabBar-tab.preferences-scope-tab').contains('Workspace').click();
      cy.addCopybookLocal('testing');
      cy.closeCurrentTab();

      // Check that BOOK3 is not has "syntax error" anymore
      cy.createNewFile('testing', 'BOOK3.cpy');
      cy.closeCurrentTab();
      cy.openFile('USERC1F.cbl');
      cy.getLineByNumber(19).get('.squiggly-error').should('not.have.class');
    });
  });

  describe('TC247908 Local copybooks - Delete watched folders', () => {
    afterEach(() => {
      cy.closeCurrentTab();
      cy.closeFolder('testing');
    });
    it('Watch a folder and then delete', () => {
      //Create in folder 'testing' copybook 'BOOK3.cpy'
      cy.createNewFile('testing', 'BOOK3.cpy');
      cy.closeCurrentTab();

      //Check that syntax error is not present
      cy.openFile('USERC1F.cbl').get('.squiggly-error').should('not.exist');

      //Delete settings.json file
      cy.task('deleteFile', 'test_files/project/.theia/settings.json');
      cy.task('deleteFile', 'test_files/project/.vscode/settings.json');

      //Open the same file and check syntax error (BOOK3 cannot be found)
      cy.openFile('USERC1F.cbl')
        .wait(500)
        .get('.squiggly-error')
        .getElementLineNumber()
        .then((lineNumber) => {
          expect(lineNumber).to.be.equal(19);
          cy.getLineByNumber(lineNumber).find('span').eq(-1).click().trigger('mousemove');
        });
      cy.get('div.monaco-editor-hover-content').contains('BOOK3: Copybook not found');
    });
  });
  describe('TC247996 - Nested copybooks with "no extension" are supported', () => {
    beforeEach(() => {
      cy.openFolder('testing').openFile('A.cpy').goToLine(1);
      cy.getMainEditor()
        .type('{selectall}{backspace}')
        .type('COPY B. ', { delay: 100 })
        .type('{ctrl}{c}')
        .closeCurrentTab();
      cy.get('.theia-button.main').click();
      cy.closeCurrentTab();
      cy.closeFolder('testing');
    });
    it(['smoke'], 'Nested copybooks with "no extension" are supported', () => {
      cy.openFile('TEST.CBL');

      // Check that variable is available
      cy.goToLine(21);
      cy.getMainEditor().type('{ctrl} ').type('       PROGRAM');
      cy.get('[widgetid="editor.widget.suggestWidget"]').contains('PROGRAM-STATUS');
      cy.closeCurrentTab();
      cy.get('.fa.fa-times.closeButton').click();

      //change in A.cpy to 'COPY CA.'
      cy.openFolder('testing').openFile('A.cpy').wait(500).goToLine(1);
      cy.getMainEditor().type(backspace3times).type('CA. ', { delay: 100 }).type('{ctrl}{c}').closeCurrentTab();
      cy.get('.theia-button.main').click();

      // Open file and check that variable is not available
      cy.openFile('TEST.CBL').getLineByNumber(21).type('{end}{enter}');
      cy.getMainEditor().type('{ctrl} ');
      cy.get('[widgetid="editor.widget.suggestWidget"]').should('not.have.text', 'PROGRAM-STATUS');
    });
  });
});
