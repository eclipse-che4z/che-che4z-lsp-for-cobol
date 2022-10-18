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

context('This is a Copybook spec', () => {
  beforeEach(() => {
    cy.updateConfigs('basic');
  });

  describe('TC174918 Copybook - peek definition', () => {
    afterEach(() => {
      cy.closeFolder('.copybooks');
    });
    it(
      ['smoke', 'investigation'],
      'Checks that Peek Definition functionality works in theia in cobol file via context menu',
      () => {
        cy.openFile('USERC1N1.cbl').wait(3000);
        cy.getLineByNumber(42).findText('User-Phone-Mobile.').goToDefinition();
        cy.getCurrentTab().should('contain.text', 'BOOK2N.cpy');
        cy.getCurrentLineNumber().should('eq', 19);
        cy.getCurrentLine().contains('05 User-Phone-Mobile PIC 9(6).');
      },
    );
  });

  describe('TC174930 Copybook - Ctrl+Click on definition', () => {
    afterEach(() => {
      cy.closeFolder('.copybooks');
    });
    it(['smoke'], 'Checks that Peek Definition functionality works in theia in cobol file via Ctrl+Click', () => {
      cy.openFile('USERC1N1.cbl');
      cy.getLineByNumber(42).findText('User-Phone-Mobile.').type('{ctrl}', { release: false, delay: 2500 }).click();
      cy.getCurrentTab().should('contain.text', 'BOOK2N.cpy');
      cy.getCurrentLineNumber().should('eq', 19);
      cy.getCurrentLine().contains('05 User-Phone-Mobile PIC 9(6).');
    });
  });

  describe('TC174931 Copybook - peek references', () => {
    //TODO - goToReferences is not working correctly in VSC 1.63
    it(['smoke'], 'Checks that LSP can find all references (also in copybooks) and navigate by them', () => {
      cy.openFile('USERC1N1.cbl');
      cy.getLineByNumber(42).findText('User-Phone-Mobile.').goToReferences();
      cy.get(Theia.zoneWidget)
        .as('referenceWidget')
        .then(($referenceWidget) => {
          cy.wrap($referenceWidget)
            .find('.reference-file')
            .should('have.length', 2)
            .then(($referenceFiles) => {
              cy.wrap($referenceFiles).contains('BOOK2N.cpy');
              cy.wrap($referenceFiles).contains('USERC1N1.cbl');
            });
          cy.wrap($referenceWidget).find('.monaco-tl-row .collapsed').as('collapsedReferences').click();
          cy.get('@referenceWidget')
            .find('.referenceMatch')
            .should('have.length', 3)
            .each(($referenceMatch) => {
              cy.wrap($referenceMatch).click();
              cy.getCurrentLineNumber().then((lineNumber) => {
                expect(lineNumber).to.be.oneOf([19, 42, 51]);
              });
            });
        });
    });
  });

  describe('TC288744 Underscore a copy statement if its copybook contains error: nested copybooks', () => {
    afterEach(() => {
      cy.closeFolder('.copybooks');
    });

    it(['smoke'], 'Underscore a copy statement if its copybook contains error with nested copybooks', () => {
      cy.openFile('TEST.CBL').goToLine(22);
      cy.getCurrentLine().type('{end}', { delay: 200 }).type('{enter}    COPY A.', { delay: 200 });
      cy.getCurrentLineErrors({ expectedLine: 23 })
        .eq(0)
        .getHoverErrorMessage()
        .should(($content) => {
          [
            "Syntax error on 'WORK-VARIABLES' expected SECTION",
            "Syntax error on 'PROGRAM-STATUS' expected SECTION",
            "Syntax error on 'PIC' expected SECTION",
            'The following token must start in Area A: PROGRAM-STATUS',
          ].forEach((message) => {
            expect($content).to.contain.text(message);
          });
        });
      cy.openFolder('testing').openFilePermanent('A.cpy').goToLine(14).wait(500);
      cy.getCurrentLineErrors({ expectedLine: 14 }).getHoverErrorMessage().eq(0);
      cy.get(IDE.hoverOverContent).should(($content) => {
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

  describe('TC312878 Edit missing copybook and resolve', () => {
    // TODO - add selectors for VSC
    it(['flaky_theia'], 'Edits missing copybook and resolves', () => {
      cy.openFile('USERC1F.cbl');
      cy.goToLine(19);
      cy.getCurrentLine().type('{end}{backspace}{backspace}123.');
      cy.getCurrentLineErrors({ expectedLine: 19 }).eq(0).getHoverErrorMessage().find(IDE.quickFix).click();
      cy.get(IDE.submenuItemLabel).contains('Resolve copybook').click();
      cy.get(IDE.notificationMessage).should('contain.text', 'Missing copybooks: BOOK123');
    });
  });

  describe('TC314393 Variable usage should be found in a CALL statement', () => {
    //TODO - goToReferences is not working correctly in VSC 1.63
    it(['smoke'], 'The variable used in a CALL statement should be found in the references list.', () => {
      cy.openFile('HELLO-WORLD.cbl');
      cy.getLineByNumber(23).findText('VARIABLE').goToReferences();
      cy.get(Theia.zoneWidget)
        .as('referenceWidget')
        .then(($referenceWidget) => {
          cy.get('@referenceWidget')
            .find('.referenceMatch')
            .should('have.length', 5)
            .each(($referenceMatch) => {
              cy.wrap($referenceMatch).click();
              cy.getCurrentLineNumber().then((lineNumber) => {
                expect(lineNumber).to.be.oneOf([19, 21, 22, 23, 24]);
              });
            });
        });
    });
  });

  describe('TC314935 Copybook with Name in Quotes is Recognized', () => {
    it(['flaky'], 'Copybook with Name in Quotes is Recognized', () => {
      cy.openFile('VAR.cbl');
      cy.goToLine(21);
      cy.getLineByNumber(21).type("{end}{enter}COPY 'BBB'.").wait(500);
      cy.getCurrentLineErrors({ expectedLine: 22 }).eq(0).getHoverErrorMessage().contains('BBB: Copybook not found');
      cy.getLineByNumber(22).type('{end}{enter}COPY "BBB".').wait(500);
      cy.getCurrentLineErrors({ expectedLine: 23 }).eq(0).getHoverErrorMessage().contains('BBB: Copybook not found');
      cy.getLineByNumber(23).type('{end}{enter}COPY "NEW".').wait(500);
      cy.getCurrentLine().should('not.have.class', IDE.editorError);
      cy.getLineByNumber(24).type("{end}{enter}COPY 'NEW'.").wait(500);
      cy.getCurrentLine().should('not.have.class', IDE.editorError);
    });
  });

  describe('TC318696 Load copybooks outside the workspace', () => {
    const copyBookNotFound = () => {
      return cy
        .openFile('USERC1F.cbl')
        .goToLine(19)
        .getCurrentLineErrors({ expectedLine: 19 })
        .eq(0)
        .getHoverErrorMessage()
        .contains('BOOK3: Copybook not found');
    };

    const setPathsLocalSetting = (folder) => {
      return cy.writeFile('test_files/project/.theia/settings.json', {
        'cobol-lsp.cpy-manager.paths-local': [`${folder}`],
        'cobol-lsp .cpy-manager.paths-dsn': [],
        'cobol-lsp.cpy-manager.profiles': '',
      });
    };
    const notHaveSyntaxError = () => {
      return cy.openFile('USERC1F.cbl').getLineByNumber(19).should('not.have.class', IDE.editorError);
    };
    it(['smoke'], 'specify copybooks outside the current workspace ../test', () => {
      copyBookNotFound();
      setPathsLocalSetting('../test');
      cy.closeCurrentTab();
      notHaveSyntaxError();
    });
    it(['smoke'], 'specify copybooks outside the current workspace /home/test', () => {
      setPathsLocalSetting('/home/test');
      notHaveSyntaxError();
    });
    it(['smoke'], 'specify copybooks outside the current workspace ../test/files', () => {
      setPathsLocalSetting('../test/files');
      notHaveSyntaxError();
    });
    it(['smoke'], 'specify copybooks outside the current workspace /test', () => {
      setPathsLocalSetting('/test');
      copyBookNotFound();
    });
    it(['smoke'], 'specify copybooks outside the current workspace ./test', () => {
      setPathsLocalSetting('./test');
      copyBookNotFound();
    });
    it(['smoke'], 'specify copybooks outside the current workspace ./test/files', () => {
      setPathsLocalSetting('./test/files');
      copyBookNotFound();
    });
  });

  describe('Fix loading copybooks with any encoding', () => {
    const copyBookNotFound = (copybook) => {
      // eslint-disable-next-line cypress/no-unnecessary-waiting
      return cy
        .openFile('TEST.CBL')
        .getLineByNumber(21)
        .type(`           COPY ${copybook}.`)
        .wait(500)
        .getCurrentLineErrors({ expectedLine: 21 })
        .eq(0)
        .getHoverErrorMessage()
        .contains(`${copybook}: Copybook not found`);
    };
    afterEach(() => {
      cy.closeFolder('.copybooks');
    });

    [
      {
        test: 'Fix loading copybooks with any encoding - EN',
        input: 'TEST ME',
      },
      {
        test: 'Fix loading copybooks with any encoding - UA',
        input: 'Перевір мене',
      },
      {
        test: 'Fix loading copybooks with any encoding - AM',
        input: 'փորձիր ինձ',
      },
    ].forEach((parameters) => {
      it(['smoke'], parameters.test, () => {
        copyBookNotFound('UTF8');
        cy.writeFile('test_files/project/testing/UTF8', `            MOVE "${parameters.input}" TO ABC.`, {
          encoding: 'utf-8',
        });
        cy.getLineByNumber(21).findText('UTF8').click().type('{ctrl}{.}');
        cy.get('.p-Widget.p-Menu').contains('Resolve copybook').click();
        cy.goToLine(21);
        cy.getCurrentLineErrors({ expectedLine: 21 })
          .eq(0)
          .getHoverErrorMessage()
          .contains('Variable ABC is not defined');
      });
    });
  });

  //Refactor COPY MAID statements test
  describe('TC327253 Support COPY MAID statements', () => {
    beforeEach(() => {
      cy.updateConfigs('testing');
    });
    it.skip(['smoke', 'ci'], 'Support COPY MAID statements', () => {
      cy.openFile('TEST.CBL');
      cy.goToLine(20);
      cy.getLineByNumber(20).type('{end}{enter}    05 COPY MAID A.');
      cy.goToLine(21);
      cy.getCurrentLineErrors({ expectedLine: 21 })
        .eq(0)
        .getHoverErrorMessage()
        .contains("Syntax error on 'WORK-VARIABLES' expected SECTION");
      cy.getLineByNumber(21).type('{end}{enter}05 COPY MAID NEW.');
      cy.getLineByNumber(22).should('not.have.class', '.squiggly-error');
      cy.getLineByNumber(22).type('{end}{enter}05 COPY MAID REPL.');
      cy.goToLine(23);
      cy.getCurrentLineErrors({ expectedLine: 23 })
        .eq(0)
        .getHoverErrorMessage()
        .contains("Syntax error on 'TAG-ID' expected SECTION");
    });
  });
});
