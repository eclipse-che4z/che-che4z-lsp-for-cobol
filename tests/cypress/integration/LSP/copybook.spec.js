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

  describe('TC174655 Copybook - Nominal', () => {
    it(
      ['flaky_theia'],
      'Checks that when opening Cobol file with correct reference to copybook, there is syntax ok message shown',
      () => {
        cy.openFile('USER1.cbl');
        cy.openFile('USERC1N1.cbl');
        cy.wait(2000).getLSPOutput().should('contain.text', 'No syntax errors detected in USERC1N1.cbl');
      },
    );
  });

  describe('Copybook - not exist: no syntax ok message', () => {
    it(
      ['flaky_theia'],
      'Checks that when opening Cobol file which refers to non-existent copybook, \
       syntax ok message does not appear and copybook is underlined',
      () => {
        cy.openFile('USERC1N1.cbl').wait(1000);
        cy.openFile('USERC1F.cbl');
        cy.getLSPOutput().should('not.have.text', 'No syntax errors detected in USERC1F.cbl');
      },
    );
  });

  describe('TC174956 Copybook - not exist: error underlined', () => {
    it(['smoke', 'CI'], 'Checks that error lines are marked in a file', () => {
      cy.openFile('USERC1F.cbl');
      cy.goToLine(19);
      cy.get(IDE.editorError)
        .should('have.length', 2)
        .getElementLineNumber()
        .then((lineNumber) => {
          expect(lineNumber).to.be.equal(19);
          cy.getLineByNumber(lineNumber).contains('BOOK3');
        });
    });
  });

  describe('TC174658 Copybook - not exist: detailed hint', () => {
    it(['smoke', 'investigation'], 'Checks that error lines for missing copybook have detailed hints', () => {
      cy.openFile('USERC1F.cbl');
      cy.get(IDE.editorError)
        .getElementLineNumber()
        .then((lineNumber) => {
          expect(lineNumber).to.be.equal(19);
          cy.getLineByNumber(lineNumber).find('span').eq(-1).click().realHover({ position: 'center' });
        });
      cy.get(IDE.hoverOverContent).contains('BOOK3: Copybook not foundCOBOL Language Support - E(MISSING_COPYBOOK)');
    });
  });

  describe('TC174916 Copybook - recursive error', () => {
    it(
      ['smoke', 'CI'],
      'Checks that when opening Cobol file which recursively refers to copybooks, copybook is underlined with an error',
      () => {
        cy.openFile('USERC1R.cbl');
        cy.get(IDE.editorError)
          .should('have.length', 2)
          .getElementLineNumber()
          .then((lineNumber) => {
            expect(lineNumber).to.be.equal(19);
            cy.getLineByNumber(lineNumber).contains('BOOK1R');
          });
      },
    );
  });

  describe('TC174917 Copybook - recursive detailed hint', () => {
    it(
      ['smoke', 'investigation'],
      'Checks that when opening Cobol file which recursively refers to copybooks, have detailed error hint',
      () => {
        cy.openFile('USERC1R.cbl');
        cy.get(IDE.editorError)
          .getElementLineNumber()
          .then((lineNumber) => {
            expect(lineNumber).to.be.equal(19);
            cy.getLineByNumber(lineNumber).find('span').eq(-1).click().realHover({ position: 'center' });
          });
        cy.get(IDE.hoverOverContent).contains('Recursive copybook declaration for: BOOK2R');
      },
    );
  });

  describe('TC174932 Copybook - invalid definition', () => {
    it(
      ['smoke', 'CI'],
      'Checks that when opening Cobol file which uses invalid definition from copybook, \
       this definition is underlined as a semantic error',
      () => {
        cy.openFile('USERC1N2.cbl');
        cy.goToLine(52);
        cy.get(IDE.editorError)
          .eq(1)
          .getElementLineNumber()
          .then((lineNumber) => {
            expect(lineNumber).to.be.equal(52);
            cy.getLineByNumber(lineNumber).contains('User-Phone-Mobile1');
          });
      },
    );
  });

  describe('TC174933 Copybook - invalid definition hint', () => {
    it(
      ['smoke', 'investigation'],
      'Checks that when opening Cobol file which uses invalid definition from copybook, has detailed hint on mouse hover',
      () => {
        cy.openFile('USERC1N2.cbl');
        cy.goToLine(52);
        cy.get(IDE.editorError)
          .eq(1)
          .getElementLineNumber()
          .then((lineNumber) => {
            expect(lineNumber).to.be.equal(52);
            cy.getLineByNumber(lineNumber).find('span').eq(-1).click().realHover({ position: 'center' });
          });
        cy.get(IDE.hoverOverContent).contains('Variable USER-PHONE-MOBILE1 is not defined');
      },
    );
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

  describe('TC174952 Copybook - not exist, but dynamically appears', () => {
    afterEach(() => {
      cy.closeFolder('.copybooks');
    });
    it(
      ['smoke', 'CI'],
      'Checks that LSP can dynamically detect appearance of copybook and rescan cobol file on the fly',
      () => {
        cy.readFile('test_files/project/.copybooks/zowe-profile-1/DATA.SET.PATH2/BOOK3T.cpy').then((text) => {
          cy.writeFile('test_files/project/.copybooks/zowe-profile-1/DATA.SET.PATH2/BOOK3.cpy', text);
        });
        cy.openFolder('.copybooks/zowe-profile-1/DATA.SET.PATH2');
        cy.openFile('USERC1F.cbl');
        cy.get(IDE.editorError).should('not.exist');
        cy.deleteFile('BOOK3.cpy');
        cy.closeCurrentTab();
        cy.openFile('USERC1F.cbl');
        cy.get(IDE.editorError).should('have.length', 2).getElementLineNumber().should('eq', 19);
      },
    );
  });

  describe('TC174953 Copybook - definition not exist, but dynamically appears', () => {
    afterEach(() => {
      cy.closeFolder('.copybooks');
    });

    it(
      ['smoke', 'CI'],
      'Checks that LSP can dynamically detect definitions from an appeared copybook and rescan cobol file on the fly',
      () => {
        cy.openFile('USERC1F.cbl').goToLine(42);
        cy.get(IDE.editorError).should('have.length', 1).getElementLineNumber().should('eq', 42);
        cy.goToLine(19);
        cy.getCurrentLine().type('{end}{backspace}T.').wait(500);
        cy.goToLine(42);
        cy.get(IDE.editorInfo).should('not.have.length', 1);
        cy.getCurrentLine().type('{end}{backspace}{backspace}');
        cy.get(IDE.editorInfo).should('have.length', 0);
      },
    );
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

  describe('TC266074 LSP analysis for extended sources - basic scenario', () => {
    it(['smoke', 'CI'], 'If extended sources are places under .c4z/.extsrcs, then ignore COPY instructions', () => {
      cy.readFile('test_files/project/USER1.cbl').then((context) => {
        cy.writeFile('test_files/project/.c4z/.extsrcs/USER1.cbl', context);
      });
      cy.openFolder('.c4z/.extsrcs').openFile('USER1.cbl');
      cy.goToLine(26);
      cy.getCurrentLine().type('           COPY ABC.');
      cy.getCurrentLineOverlay().children().should('not.have.class', IDE.editorError);
      cy.getCurrentLine().type('{end}{backspace}');
      cy.getCurrentLineErrors({ expectedLine: 26 })
        .eq(0)
        .getHoverErrorMessage()
        .contains("Syntax error on 'COPY' expected");
      cy.getCurrentLine().type('{end}{enter}Mov');
      cy.getCurrentLineOverlay().children().should('not.have.class', IDE.editorWarn);
    });

    it(['smoke', 'CI'], '.c4z', () => {
      cy.readFile('test_files/project/.c4z/.extsrcs/USER1.cbl').then((context) => {
        cy.writeFile('test_files/project/.c4z/USER1.cbl', context);
      });
      cy.openFolder('.c4z').openFile('USER1.cbl');
      // Replace typing by save in previous test?
      cy.goToLine(40);
      cy.getCurrentLine().type('           COPY ABC.');
      cy.getCurrentLineErrors({ expectedLine: 40 })
        .eq(0)
        .getHoverErrorMessage()
        .contains('ABC: Copybook not foundCOBOL Language Support - E(MISSING_COPYBOOK)');
      cy.getCurrentLine().type('{end}{enter}Mov');
      cy.getCurrentLineErrors({ expectedLine: 41, errorType: 'warning' })
        .eq(0)
        .getHoverErrorMessage()
        .contains('A misspelled word, maybe you want to put MOVE');
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

  describe("TC315293 program ID - 'COBOL Copybook'", () => {
    it(
      ['smoke', 'CI'],
      "New program ID - 'COBOL copybook' is used in the following development \
       for limited syntax awareness for the copybooks.",
      () => {
        cy.openFile('USERC1N1.cbl');
        cy.selectLangMode().should('contain.text', 'COBOL');
        cy.changeLangMode('COBOL Copybook');
      },
    );
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

  describe('Load resource file', () => {
    it(['smoke', 'CI'], 'Checks loading of resource file', () => {
      cy.openFile('RES.cbl');
      cy.goToLine(6);
      cy.getCurrentLineErrors({ expectedLine: 6 })
        .eq(0)
        .getHoverErrorMessage()
        .contains("Syntax error on 'FILE-CONTROsL'");
    });
  });

  describe('TC327253 Support COPY MAID statements', () => {
    beforeEach(() => {
      cy.updateConfigs('testing');
    });
    it(['smoke', 'ci'], 'Support COPY MAID statements', () => {
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
