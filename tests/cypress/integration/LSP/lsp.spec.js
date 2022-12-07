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
import 'cypress-real-events/support';

/* eslint-disable cypress/no-unnecessary-waiting */

const env = Cypress.env('ide');
const IDE = env === 'theia' ? Theia : VSCODE;

context('This is a LSP spec', () => {
  const getCurrentLineSpanWidth = () => {
    return cy
      .getCurrentLine()
      .find('span')
      .then(($line) => {
        return $line[0].offsetWidth;
      });
  };

  const getRulerOffsetLeft = (index) => {
    return cy
      .get(Theia.viewRulers)
      .children()
      .eq(index)
      .then(($ruler) => {
        return $ruler[0].offsetLeft;
      });
  };

  /**
   * Get hover over the variable
   *
   * @example hoverOverVariable(35, 'REC-1-2-1.', '01 REC-1.  05 REC-1-2.    10 REC-1-2-1 PIC 9.');
   */
  const hoverOverVariable = (line, text, hierarchy) => {
    return cy
      .getLineByNumber(line)
      .findText(text)
      .click({ force: true })
      .realHover({ position: 'center' })
      .get(IDE.hoverOverContent)
      .contains(hierarchy);
  };

  /**
   * Get hover over the variable in autocomplete
   *
   * @example varDifinitionAutocomplete('ADSF', '01 SOMETHING. 03 ADFSF OCCURS 30 TIMES. 05 OL-NO PIC X(8).');;
   */
  const varDifinitionAutocomplete = (variable, documentation) => {
    return cy
      .getLineByNumber(48)
      .type('{end}{enter}')
      .getCurrentLine()
      .type('{ctrl} ')
      .wait(500)
      .type(`${variable}{ctrl} {ctrl} `)
      .get(VSCODE.documentation)
      .contains(documentation);
  };

  describe('TC314392 LOG level', () => {
    // Theia doesn't show settings.json correctly
    // Check for VSCode as well!
    beforeEach(() => {
      cy.updateConfigs('empty');
    });
    afterEach(() => {
      cy.closeFolder('.theia');
    });

    it(['flaky_theia'], 'Lets check structure in settings.json file ', () => {
      cy.openFolder('.theia').openFile('settings.json').goToLine(4);
      cy.getCurrentLine().type('{end}{enter}').wait(500);
      cy.getCurrentLine().type('"cobol-lsp.logging.level.root": "ERROR"');
      cy.getCurrentLine().should('not.have.class', IDE.editorInfo);
      cy.getCurrentLine().type('{end}{backspace}1"');
      cy.getMainEditor()
        .getCurrentLineOverlay()
        .find(Theia.editorInfo)
        .then(($error) => {
          cy.wrap($error).getElementLineNumber().should('eq', 4);
          cy.getCurrentLine().trigger('mousemove', $error[0].offsetLeft, $error[0].offsetTop);
        });
      cy.get(IDE.hoverOverContent).contains(
        'Value is not accepted. Valid values: "ERROR", "WARN", "INFO", "DEBUG", "TRACE", "ALL".',
      );
    });
  });

  describe('TC314614 paragraph is not defined', () => {
    beforeEach(() => {
      cy.writeFile(
        'test_files/project/CALC-DATA.cbl',
        `       IDENTIFICATION DIVISION. 
        PROGRAM-ID. VARS. 
        DATA DIVISION. 
        PROCEDURE DIVISION.
             PERFORM GET-DATA.
             PERFORM CALC_DATA.
            STOP RUN.
        GET-DATA SECTION.
            DISPLAY FIRST-VAR.
        CALC_DATA.
            DISPLAY FIRST-VAR.`,
      );
    });

    it('Checks Syntax and Semantic Errors from Copybooks', () => {
      cy.openFile('USERC1N2.cbl').wait(500).goToLine(32);
      cy.getCurrentLine().should('not.have.class', Theia.editorError);
      cy.goToLine(35);
      cy.getCurrentLine().type('{end}{backspace}{backspace}');
      cy.goToLine(32).wait(500);
      cy.getCurrentLineErrors({ expectedLine: 32 })
        .getHoverErrorMessage('100-Print-User')
        .contains('The following paragraph is not defined: 100-PRINT-USER');

      cy.openFile('CALC-DATA.cbl').goToLine(8);
      cy.getCurrentLine().type(
        '{end}{backspace}{backspace}{backspace}{backspace}{backspace}{backspace}{backspace}{backspace}{backspace}1 SECTION.',
        { delay: 200 },
      );
      cy.goToLine(5).wait(500);
      cy.getCurrentLineErrors({ expectedLine: 5 })
        .wait(500)
        .getHoverErrorMessage('GET-DATA')
        .contains('The following paragraph is not defined: GET-DATA');
      cy.goToLine(10);
      cy.getCurrentLine().type('{end}{backspace}{backspace}1.');
      cy.goToLine(6).wait(500);
      cy.getCurrentLineErrors({ expectedLine: 6 })
        .getHoverErrorMessage('CALC_DATA')
        .wait(500)
        .contains('The following paragraph is not defined: CALC_DATA');

      cy.closeCurrentTab();
    });
  });

  describe('TC314736 Semantic analysis for Sections', () => {
    beforeEach(() => {
      cy.writeFile(
        'test_files/project/CALC-DATA.cbl',
        `       IDENTIFICATION DIVISION. 
        PROGRAM-ID. VARS. 
        DATA DIVISION. 
        PROCEDURE DIVISION.
             PERFORM GET-DATA.
             PERFORM CALC_DATA.
            STOP RUN.
        GET-DATA SECTION.
            DISPLAY FIRST-VAR.
        CALC_DATA.
            DISPLAY FIRST-VAR.`,
      );
    });

    it(['smoke'], 'Checks Syntax and Semantic Errors from Copybooks', () => {
      cy.openFile('CALC-DATA.cbl').wait(500).goToLine(5);
      cy.getLineByNumber(5).findText('GET-DATA').goToDefinition().wait(500);
      cy.getCurrentLineNumber().should('eq', 8);
      cy.getCurrentLine().contains('GET-DATA SECTION.');
      cy.getLineByNumber(8).findText('GET-DATA').goToReferences();
      cy.wait(500).getCurrentLineNumber().should('eq', 5);
      cy.getCurrentLine().contains('PERFORM GET-DATA.');
    });
  });

  describe('TC250114 Implement syntax coloring', () => {
    it(['smoke'], 'Lets check the positions of rulers ', () => {
      cy.openFile('TEST.CBL').wait(500).goToLine(24);
      cy.getCurrentLine().type('{end}{enter}');
      [
        '{selectall}      >',
        '{selectall}          >',
        '{selectall}                                                                       >',
        '{selectall}                                                                               >',
      ].forEach((text, index) => {
        cy.getCurrentLine().type(text);
        getCurrentLineSpanWidth().then((width) => {
          getRulerOffsetLeft(index).then((rulerOffset) => {
            expect(width).to.be.closeTo(rulerOffset, 1);
          });
        });
      });
    });
  });

  describe('TC289633 Provide default COBOL code snippets  - basic scenario', () => {
    const fileName = 'CALC-DATA';

    beforeEach(() => {
      cy.writeFile(
        'test_files/project/CALC-DATA.cbl',
        `       IDENTIFICATION DIVISION. 
        PROGRAM-ID. CALC-DATA. 
        DATA DIVISION. 
        PROCEDURE DIVISION.
             PERFORM GET-DATA.
             PERFORM CALC_DATA.
            STOP RUN.
        GET-DATA SECTION.
            DISPLAY FIRST-VAR.
        CALC_DATA.
            DISPLAY FIRST-VAR.`,
      );
    });

    afterEach(() => {
      cy.deleteFile('CALC-DATA.cbl');
    });
    it(['smoke', 'CI'], 'Checks Syntax and Semantic Errors from Copybooks', () => {
      cy.openFile('CALC-DATA.cbl').wait(500).goToLine(1);
      cy.getLineByNumber(2).contains(`PROGRAM-ID. ${fileName}.`);
      cy.getLineByNumber(3).contains('DATA DIVISION.');
      cy.getLineByNumber(7).contains('STOP RUN.');
    });
  });

  describe('TC152049 Navigate through definitions', () => {
    it('Checks behavior of go to definition action', () => {
      cy.openFile('USER1.cbl').wait(500);
      cy.getLineByNumber(14).type('{home}{enter}');
      cy.goToLine(14).getCurrentLine().type('TITLE "something"');
      cy.getLineByNumber(14).should('not.have.class', Theia.editorError);
      cy.getLineByNumber(14).type('{home}{enter}');
      cy.goToLine(14).getCurrentLine().type('TITLE "something"');
    });
  });

  describe('TC315355 Server Rejects Outline Request for Unsupported Files', () => {
    it(['smoke'], 'Request should be rejected immediately', () => {
      cy.writeFile('test_files/project/some_text.txt', '');
      cy.openFile('some_text.txt');
      cy.changeLangMode('COBOL');
      if (IDE === VSCODE) {
        cy.get(VSCODE.outLine).contains('Outline').click();
        cy.get(VSCODE.outlineMsg).contains("No symbols found in document 'some_text.txt'");
        cy.wait(500).get(VSCODE.outLine).contains('Outline').click();
      } else {
        cy.get(Theia.linesContent).type('{ctrl}{shift}I');
        cy.get(Theia.treeContainer).contains('No outline information available.');
      }
    });
  });

  describe('TC315392 PROGRAM-ID Check Is Not Case Sensitive', () => {
    it('Checks Syntax and Semantic Errors from Copybooks', () => {
      cy.openFile('USER1.cbl').wait(500);
      cy.getLineByNumber(49).type('{selectall}{backspace}        End program hello-world.');
      cy.getCurrentLineOverlay().children().should('not.have.class', IDE.editorWarn).goToLine(41);
      cy.getLineByNumber(41).type('{end}{backspace}{backspace}.');
      cy.getMainEditor().find(IDE.editorWarn);
      cy.getCurrentLineOverlay()
        .children()
        .then((children) => {
          return children.toArray().some((child) => child.classList.contains(IDE.editorWarn));
        })
        .should('be.true');
    });
  });

  describe('TC319689 Hover over variable shows its hierarchy definition', () => {
    it(
      ['smoke'],
      'Checks a variable definition with a snippet of its structure when user hovers over the variable.',
      () => {
        cy.openFile('HOVER.CBL');
        hoverOverVariable(48, 'REC-1-2-1.', '01 REC-1. 05 REC-1-2. 10 REC-1-2-1 PIC 9.');
        hoverOverVariable(18, 'TOP-OF-PAGE', 'C01 IS TOP-OF-PAGE.');
        hoverOverVariable(29, 'TERMS-RECORD.', '01 TERMS-RECORD. 05 TERMS-KEY PIC 9(3). 05 FILLER PIC X(68).');
        hoverOverVariable(30, 'TERMS-KEY', '01 TERMS-RECORD. 05 TERMS-KEY PIC 9(3).');
        hoverOverVariable(31, 'filler', '01 TERMS-RECORD. 05 FILLER PIC X(68).');
        hoverOverVariable(35, 'filler', '01 TERMS-RECORD. 05 FILLER PIC X(69).');
        hoverOverVariable(39, 'REC-1.', '01 REC-1. 05 REC-1-1 PIC 9(6). 05 REC-1-2.');
        hoverOverVariable(44, 'SUPPLr', '01 REC-1. 05 REC-1-2. 10 REC-1-2-1 PIC 9. 88 SUPPLR VALUE 2 THROUGH 4.');
      },
    );
  });

  describe('TC319969 Provide the variables definition as documentation', () => {
    it(['smoke'], 'Checks variable definition into VSC autocomplete documentation.', () => {
      cy.openFile('HOVER.CBL');
      varDifinitionAutocomplete('ADFSF', '01 SOMETHING. 03 ADFSF OCCURS 30 TIMES. INDEXED BY INDX 05 OL-NO PIC X(8).');
      varDifinitionAutocomplete('FILE-RECORD', '01 FILE-RECORD PIC X(113).');
      varDifinitionAutocomplete('FILLER', '01 TERMS-RECORD. 05 FILLER PIC X(69).');
      varDifinitionAutocomplete('HEADER', '01 REC-1. 05 REC-1-2. 10 REC-1-2-1 PIC 9. 88 HEADER VALUE 1 THRU 4.');
      varDifinitionAutocomplete('REC-1', '01 REC-1. 05 REC-1-1 PIC 9(6). 05 REC-1-2.');
      varDifinitionAutocomplete('REC-1-1', '01 REC-1. 05 REC-1-1 PIC 9(6).');
      varDifinitionAutocomplete(
        'REC-1-2',
        '01 REC-1. 05 REC-1-2. 10 REC-1-2-1 PIC 9. 88 HEADER VALUE 1 THRU 4. 88 SUPPLR VALUE 2 THROUGH 4. 88 WREHOUSE VALUE 3.',
      );
      varDifinitionAutocomplete('TOP-OF-PAGE', 'C01 IS TOP-OF-PAGE.');
    });
  });

  describe('Show 88 Items On Hover', () => {
    it(['smoke'], 'Show 88 Items On Hover', () => {
      cy.openFile('TEST.CBL');
      cy.goToLine(19);
      cy.getLineByNumber(20).type('{home}{enter}');
      cy.getLineByNumber(20).type(
        '01 TOP.{enter} \
      05 MIDDLE-2.{enter} \
        10 LEAF-2 PIC 9.{enter} \
          88 COND-ITEM1 VALUE 0.{enter} \
          88 COND-ITEM2 VALUE 1.{enter}',
      );
      hoverOverVariable(
        21,
        'MIDDLE-2',
        '01 TOP. 05 MIDDLE-2. 10 LEAF-2 PIC 9. 88 COND-ITEM1 VALUE 0. 88 COND-ITEM2 VALUE 1.',
      );
      hoverOverVariable(23, 'COND-ITEM1', '01 TOP. 05 MIDDLE-2. 10 LEAF-2 PIC 9. 88 COND-ITEM1 VALUE 0.');
      hoverOverVariable(24, 'COND-ITEM2', '01 TOP. 05 MIDDLE-2. 10 LEAF-2 PIC 9. 88 COND-ITEM2 VALUE 1.');
    });
  });

  describe('TC327254 Semicolon as a Separators Not Produces Error', () => {
    it(['smoke', 'CI'], 'Semicolon as a Separators Not Produces Error', () => {
      cy.openFile('TEST.CBL');
      cy.goToLine(23).getLineByNumber(23).type('{end}{backspace};');
      cy.getLineByNumber(23).should('not.have.class', IDE.editorError);
    });
  });

  describe('TC328483 support floating comment indicators (*>)', () => {
    function checkForErrors(lineNumber) {
      return cy
        .goToLine(lineNumber)
        .getLineByNumber(lineNumber)
        .should('not.have.class', IDE.editorError)
        .getLineByNumber(lineNumber)
        .should('not.have.class', IDE.editorWarn);
    }

    function expectErrors(lineNumber) {
      return cy.goToLine(lineNumber).getCurrentLineErrors({ expectedLine: lineNumber });
    }

    function addComment(lineNumber, comment) {
      return cy.openFile('USER2.cbl').getLineByNumber(lineNumber).type(comment);
    }
    it(['smoke'], 'support floating comment indicators (*>) - with space', () => {
      addComment(26, "      *> ---- Let's have a comment with space");
      checkForErrors(26);
    });
    it(['smoke'], 'support floating comment indicators (*>) - without space', () => {
      addComment(26, "      *>---- Let's have a comment without space");
      checkForErrors(26);
    });

    it(['smoke'], 'support floating comment indicators (*>) - comment in non-empty string', () => {
      addComment(29, '{end} *> here');
      checkForErrors(29);
    });
    it(['smoke'], 'support floating comment indicators (*>) - comment in non-empty string with expected error', () => {
      addComment(29, '{end} *>');
      expectErrors(29);
    });
    it(['smoke'], 'support floating comment indicators (*>) - out of 80 characters', () => {
      addComment(29, '{end} *> ddddddddddddddddddddddddddddddddddddddddddd');
      expectErrors(29);
    });
  });

  describe('TC331303 Define the constants as variables', () => {
    function goToDefinitionExtended(line1, text, line2) {
      return cy
        .getLineByNumber(line1)
        .findText(text)
        .wait(500)
        .goToDefinition()
        .wait(500)
        .getCurrentLineNumber()
        .should('eq', line2);
    }
    beforeEach(() => {
      cy.writeFile(
        'test_files/project/1VSAMTEST.cbl',
        `       IDENTIFICATION DIVISION.
        PROGRAM-ID. VSAMTEST.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 RECORD-FILE-STATUS   PIC X(2).
        
        PROCEDURE DIVISION.
            DISPLAY RECORD-FILE-STATUS.
            DISPLAY EIBCALEN.
            GOBACK. `,
      );
    });
    it('Define the constants as variables - check the linkage section enabled', () => {
      cy.openFile('1VSAMTEST.cbl');
      cy.goToLine(9)
        .getCurrentLineErrors({ expectedLine: 9 })
        .getHoverErrorMessage('EIBCALEN')
        .contains('Variable EIBCALEN is not defined');
      cy.getLineByNumber(6).type('LINKAGE SECTION.');
      cy.getLineByNumber(10).should('not.have.class', '.squiggly-error');
    });
    it('Define the constants as variables - check the go to definition', () => {
      cy.openFile('1VSAMTEST.cbl');
      cy.getLineByNumber(6).type('LINKAGE SECTION.');
      goToDefinitionExtended(5, 'RECORD-FILE-STATUS', 8);
      goToDefinitionExtended(8, 'RECORD-FILE-STATUS', 5);
    });
    it('Define the constants as variables - autocomplete', () => {
      cy.openFile('1VSAMTEST.cbl');
      cy.getLineByNumber(6).type('LINKAGE SECTION.');
      cy.getLineByNumber(9)
        // We should send twice the ctrl+space in order to check the var/constant documentation
        .findText('EIBCALEN')
        .type('{ctrl} {ctrl} ', { release: false })
        .get('.monaco-scrollable-element .docs')
        .contains('01 DFHEIBLK. 02 EIBCALEN PIC S9(4) USAGE COMP.');
    });
  });
});
