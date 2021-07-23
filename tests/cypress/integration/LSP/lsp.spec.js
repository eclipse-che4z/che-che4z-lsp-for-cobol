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
      .get('.view-rulers')
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
      .click()
      .trigger('mousemove')
      .get('div.monaco-editor-hover-content')
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
      .type(`${variable}{ctrl} `)
      .get('.monaco-scrollable-element .docs')
      .contains(documentation);
  };

  describe('TC152046 Nominal - check syntax Ok message', () => {
    it(
      ['flaky_theia'],
      'Checks that when opening Cobol file with correct syntax there is an appropriate message is shown',
      () => {
        cy.openFileExplorer();
        cy.openFile('USER1.cbl');
        cy.getLSPOutput().contains('No syntax errors detected in USER1.cbl');
      },
    );
  });

  describe('TC152048 Cobol file is recognized by LSP', () => {
    beforeEach(() => {
      cy.updateConfigs('basic');
    });
    it(['smoke', 'CI'], 'Cobol file is recognized by LSP - Cobol type is shown in status bar', () => {
      cy.openFile('USER1.cbl');
      cy.get('.right.area .hasCommand[title="Select Language Mode"]').should('contain.text', 'COBOL');
    });
  });

  describe('TC152049 Navigate through definitions', () => {
    beforeEach(() => {
      cy.updateConfigs('basic');
    });
    it(['smoke', 'CI'], 'Checks behavior of go to definition action', () => {
      cy.openFile('USER1.cbl');
      cy.getLineByNumber(29).findText('100-Print-User.').wait(5000).goToDefinition().wait(10000);
      cy.getCurrentLineNumber().should('eq', 32);
    });
  });

  describe('TC152080 Find all references from the word begin', () => {
    it(['smoke'], 'Checks that LSP can find all references and navigate by them', () => {
      cy.openFile('USER1.cbl');
      cy.getLineByNumber(21).findText('User-Address.').type('{ctrl}{leftArrow}').goToDefinition();
      cy.get('.monaco-tl-contents')
        .should('have.length', 3)
        .each(($el) => {
          cy.wrap($el).click();
          cy.getPreviewCurrentLineNumber().then((lineNumber) => {
            expect(lineNumber).to.be.oneOf([21, 35, 43]);
          });
        });
    });
  });

  describe('TC152080 Find all references from the word middle', () => {
    it(['smoke'], 'Checks that LSP can find all references and navigate by them', () => {
      cy.openFile('USER1.cbl');
      cy.getLineByNumber(21).findText('User-Address.').goToDefinition();
      cy.get('.monaco-tl-contents')
        .should('have.length', 3)
        .each(($el) => {
          cy.wrap($el).click();
          cy.getPreviewCurrentLineNumber().then((lineNumber) => {
            expect(lineNumber).to.be.oneOf([21, 35, 43]);
          });
        });
    });
  });

  describe('TC152047 Error case - file has syntax errors', () => {
    it(
      ['flaky_theia'],
      'Checks that when opening Cobol file with correct syntax there is NO message about correct syntax',
      () => {
        cy.openFile('USER1.cbl').wait(4000);
        cy.openFile('USER2.cbl');
        cy.getLSPOutput().should('not.have.text', 'No syntax errors detected in USER2.cbl');
      },
    );
  });

  describe('TC152052 Syntax Errors are marked in file', () => {
    it(['smoke'], 'Checks that error lines are marked in a file', () => {
      cy.openFile('USER2.cbl');
      cy.get('.squiggly-error')
        .should('have.length', 1)
        .getElementLineNumber()
        .then((lineNumber) => {
          expect(lineNumber).to.be.equal(15);
          cy.getLineByNumber(lineNumber).contains('Program1-id');
        });
    });
  });

  describe('TC152051 Syntax Errors have more detailed hints', () => {
    it(['smoke', 'CI'], 'Syntax Errors have more detailed hints', () => {
      cy.openFile('USER2.cbl');
      cy.get('.squiggly-error')
        .getElementLineNumber()
        .then((lineNumber) => {
          expect(lineNumber).to.be.equal(15);
          cy.getLineByNumber(lineNumber).children('span').click().trigger('mousemove');
        });
      cy.get('div.monaco-editor-hover-content').contains("Syntax error on 'Program1-id' expected PROGRAM-ID");
    });
  });

  describe('TC152050 Semantic Errors also marked in file', () => {
    it(['smoke', 'CI'], 'Checks that Semantic Errors also marked in file', () => {
      cy.openFile('USER2.cbl');
      cy.goToLine(40);
      cy.get('.squiggly-error')
        .should('have.length', 1)
        .getElementLineNumber()
        .then((lineNumber) => {
          expect(lineNumber).to.be.equal(40);
          cy.getLineByNumber(lineNumber).contains('User-City1');
        });
    });
  });

  describe('TC152053 Semantic Errors also have hints', () => {
    it(['smoke', 'CI'], 'Checks that semantic errors have detailed hints', () => {
      cy.openFile('USER2.cbl');
      cy.goToLine(40);
      cy.get('.squiggly-error')
        .getElementLineNumber()
        .then((lineNumber) => {
          expect(lineNumber).to.be.equal(40);
          cy.getLineByNumber(lineNumber).find('span').eq(-1).click().trigger('mousemove');
        });
      cy.get('div.monaco-editor-hover-content').contains('Variable USER-CITY1 is not defined');
    });
  });

  describe('TC152054 Auto format of right trailing spaces', () => {
    it(['smoke'], 'Checks that auto format removed sight trailing spaces', () => {
      cy.openFile('USER2.cbl');
      cy.getLineByNumber(35)
        .as('currentLine')
        .invoke('text')
        .then((originalText) => {
          cy.get('@currentLine').type('{end}        ', { delay: 100 });
          cy.formatDocument();
          cy.getLineByNumber(35).should('have.text', originalText);
        });
    });
  });

  describe('TC152058 Autocomplete functionality with snippets navigation', () => {
    it(['smoke'], 'Checks auto complete functionality, also with navigation by snippets', () => {
      cy.openFile('USER2.cbl');
      cy.goToLine(40);
      cy.getCurrentLine().type('{end}{enter}');
      cy.getCurrentLine().type('{ctrl} ').type('A'); // Ctrl+Space
      cy.get('[widgetid="editor.widget.suggestWidget"]').contains('ADD id TO id').click();
      cy.focused()
        .as('input')
        .then(() => {
          cy.get('@input').type('1').trigger('keydown', { key: 'Tab', code: 'Tab' });
          cy.get('@input').type('Str');
        });
      cy.getCurrentLine().contains('ADD 1 TO Str');
      cy.closeCurrentTab();
    });
  });

  describe('TC288736 error message for 80chars limit', () => {
    it(['smoke'], 'Source text can not go past column 80.  ', () => {
      cy.openFile('TEST.CBL');
      cy.goToLine(22);
      cy.getCurrentLine()
        .type('{end}')
        .type('{enter}oi3Bd5kC1f3nMFp0IWg62ZZgWMxHPJnuLWm4DqplZDzMIX69C6vjeL24YbobdQnoQsDenL35omljznHd0l1fP')
        .wait(500);
      cy.getMainEditor()
        .getCurrentLineOverlay()
        .find('.squiggly-error')
        .then(($error) => {
          cy.wrap($error).getElementLineNumber().should('eq', 23);
          cy.getCurrentLine().trigger('mousemove', $error[0].offsetLeft, $error[0].offsetTop);
        });
      cy.get('div.monaco-editor-hover-content').contains('Source text cannot go past column 80');
    });
  });

  describe('TC314392 LOG level', () => {
    // Theia doesn't show settings.json correctly
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
      cy.getCurrentLine().should('not.have.class', '.squiggly-info');
      cy.getCurrentLine().type('{end}{backspace}1"');
      cy.getMainEditor()
        .getCurrentLineOverlay()
        .find('.squiggly-info')
        .then(($error) => {
          cy.wrap($error).getElementLineNumber().should('eq', 4);
          cy.getCurrentLine().trigger('mousemove', $error[0].offsetLeft, $error[0].offsetTop);
        });
      cy.get('div.monaco-editor-hover-content').contains(
        'Value is not accepted. Valid values: "ERROR", "WARN", "INFO", "DEBUG", "TRACE", "ALL".',
      );
    });
  });

  describe('TC266094 Underline the entire incorrect variable structure', () => {
    it(['smoke'], 'This test checks that parser can find and underline an incorrect variable structure.', () => {
      cy.openFile('VAR.cbl').goToLine(23).wait(3000);
      cy.getMainEditor()
        .getCurrentLineOverlay()
        .find('.squiggly-error')
        .then(($info) => {
          cy.wrap($info).getElementLineNumber().should('eq', 23);
          cy.getCurrentLine().trigger('mousemove', $info[0].offsetLeft, $info[0].offsetTop);
        });
      cy.get('div.monaco-editor-hover-content').contains('Variable CHILD1 is not defined');
      cy.goToLine(24).wait(2000);
      cy.getMainEditor()
        .getCurrentLineOverlay()
        .find('.squiggly-error')
        .then(($info) => {
          cy.wrap($info).getElementLineNumber().should('eq', 24);
          cy.getCurrentLine().trigger('mousemove', $info[0].offsetLeft, $info[0].offsetTop);
        });
      cy.get('div.monaco-editor-hover-content').should(($content) => {
        ['Variable CHILD2 is not defined'].forEach((message) => {
          expect($content).to.contain.text(message);
        });
      });

      cy.getMainEditor()
        .getCurrentLineOverlay()
        .find('.squiggly-error')
        .then(($info) => {
          cy.wrap($info).getElementLineNumber().should('eq', 24);
          cy.getCurrentLine().type('{end}').trigger('mousemove', $info[0].offsetLeft, $info[0].offsetTop);
          cy.get('div.monaco-editor-hover-content').contains('Variable CHILD2 is not defined');
        });
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
      cy.openFile('USERC1N2.cbl').goToLine(32);
      cy.getCurrentLine().should('not.have.class', '.squiggly-error');
      cy.goToLine(35);
      cy.getCurrentLine().type('{end}{backspace}{backspace}');
      cy.goToLine(32).wait(500);
      cy.getCurrentLineErrors({ expectedLine: 32 })
        .getHoverErrorMessage()
        .contains('The following paragraph is not defined: 100-PRINT-USER');

      cy.openFile('CALC-DATA.cbl').goToLine(8);
      cy.getCurrentLine().type(
        '{end}{backspace}{backspace}{backspace}{backspace}{backspace}{backspace}{backspace}{backspace}{backspace}1 SECTION.',
        { delay: 200 },
      );
      cy.goToLine(5);
      cy.getCurrentLineErrors({ expectedLine: 5 })
        .getHoverErrorMessage()
        .contains('The following paragraph is not defined: GET-DATA');
      cy.goToLine(10);
      cy.getCurrentLine().type('{end}{backspace}{backspace}1.');
      cy.goToLine(6).wait(500);
      cy.getCurrentLineErrors({ expectedLine: 6 })
        .getHoverErrorMessage()
        .contains('The following paragraph is not defined: CALC_DATA');
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
      cy.openFile('CALC-DATA.cbl').goToLine(5);
      cy.getLineByNumber(5).findText('GET-DATA').goToDefinition();
      cy.getCurrentLineNumber().should('eq', 8);
      cy.getCurrentLine().contains('GET-DATA SECTION.');
      cy.getLineByNumber(8).findText('GET-DATA').goToReferences();
      cy.wait(500).getCurrentLineNumber().should('eq', 5);
      cy.getCurrentLine().contains('PERFORM GET-DATA.');
    });
  });

  describe('TC250114 Implement syntax coloring', () => {
    it(['smoke'], 'Lets check the positions of rulers ', () => {
      cy.openFile('TEST.CBL').goToLine(24);
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
      cy.writeFile(`test_files/project/${fileName}.cbl`, 's');
    });

    afterEach(() => {
      cy.deleteFile(`${fileName}.cbl`);
    });
    it(['smoke'], 'Checks Syntax and Semantic Errors from Copybooks', () => {
      cy.openFile('CALC-DATA.cbl').wait(500).goToLine(1);
      cy.getCurrentLine().type('{selectall}shell').wait(500);
      cy.get('[widgetid="editor.widget.suggestWidget"]').contains('shell').click();
      cy.getLineByNumber(2).contains(`PROGRAM-ID. ${fileName}.`);
      cy.getLineByNumber(8).contains('DATA DIVISION.');
      cy.getLineByNumber(16).contains('STOP RUN.');
    });
  });

  describe('TC289635 Provide default COBOL code snippets', () => {
    const fileName = 'CALC-DATA';

    beforeEach(() => {
      cy.writeFile(`test_files/project/${fileName}.cbl`, 's');
    });

    it('Checks Syntax and Semantic Errors from Copybooks', () => {
      cy.openFile('CALC-DATA.cbl').wait(500).goToLine(1);
      cy.getCurrentLine().type('{selectall}shell').wait(500);
      cy.get('[widgetid="editor.widget.suggestWidget"]').contains('shell').click();
      cy.goToLine(15).getCurrentLine().type('COPY ABC.');
      cy.getCurrentLineErrors({ expectedLine: 15 }).eq(0).getHoverErrorMessage().contains('ABC: Copybook not found');
      cy.getCurrentLine().type('{end}{enter}');
      cy.getCurrentLine().type('FUNCTION-CO');
      cy.get('[widgetid="editor.widget.suggestWidget"]').contains('FUNCTION-COS');
      //lower case
      cy.getCurrentLine().type('{selectall}function-co', { delay: 200 });
      cy.get('[widgetid="editor.widget.suggestWidget"]').contains('function-cos');
    });
  });

  describe('TC152049 Navigate through definitions', () => {
    it('Checks behavior of go to definition action', () => {
      cy.openFile('USER1.cbl');
      cy.getLineByNumber(14).type('{home}{enter}');
      cy.goToLine(14).getCurrentLine().type('TITLE "something"');
      cy.getLineByNumber(14).should('not.have.class', '.squiggly-error');
      cy.getLineByNumber(14).type('{home}{enter}');
      cy.goToLine(14).getCurrentLine().type('TITLE "something"');
    });
  });

  describe('TC315355 Server Rejects Outline Request for Unsupported Files', () => {
    it(['smoke'], 'Request should be rejected immediately', () => {
      cy.writeFile('test_files/project/some_text.txt', '');
      cy.openFile('some_text.txt');
      cy.changeLangMode('COBOL');
      cy.get('.view-lines').type('{ctrl}{shift}I');
      cy.get('.theia-TreeContainer').contains('No outline information available.');
    });
  });

  describe('TC315392 PROGRAM-ID Check Is Not Case Sensitive', () => {
    it('Checks Syntax and Semantic Errors from Copybooks', () => {
      cy.openFile('USER1.cbl');
      cy.getLineByNumber(49).type('{selectall}{backspace}        End program hello-world.');
      cy.getCurrentLineOverlay().children().should('not.have.class', '.squiggly-warning');
      cy.getLineByNumber(41).type('{end}{backspace}{backspace}.');
      cy.getMainEditor().find('.squiggly-warning');
      cy.getCurrentLineOverlay()
        .children()
        .then((children) => {
          return children.toArray().some((child) => child.classList.contains('squiggly-warning'));
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
        hoverOverVariable(44, 'SUPPLr', '01 REC-1. 05 REC-1-2. 10 REC-1-2-1 PIC 9. 88 SUPPLR VALUE 2 THRU 4.');
      },
    );
  });

  describe('TC319969 Provide the variables definition as documentation', () => {
    it(['smoke'], 'Checks variable definition into VSC autocomplete documentation.', () => {
      cy.openFile('HOVER.CBL');
      varDifinitionAutocomplete('ADSF', '01 SOMETHING. 03 ADFSF OCCURS 30 TIMES. 05 OL-NO PIC X(8).');
      varDifinitionAutocomplete('FILE-RECORD', '01 FILE-RECORD PIC X(113).');
      varDifinitionAutocomplete('FILLER', '01 TERMS-RECORD. 05 FILLER PIC X(69).');
      varDifinitionAutocomplete('HEADER', '01 REC-1. 05 REC-1-2. 10 REC-1-2-1 PIC 9. 88 HEADER VALUE 1 THRU 4.');
      varDifinitionAutocomplete('REC-1', '01 REC-1. 05 REC-1-1 PIC 9(6). 05 REC-1-2.');
      varDifinitionAutocomplete('REC-1-1', '01 REC-1. 05 REC-1-1 PIC 9(6).');
      varDifinitionAutocomplete(
        'REC-1-2',
        '01 REC-1. 05 REC-1-2. 10 REC-1-2-1 PIC 9. 88 HEADER VALUE 1 THRU 4. 88 SUPPLR VALUE 2 THRU 4. 88 WREHOUSE VALUE 3.',
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
    it(['smoke'], 'Semicolon as a Separators Not Produces Error', () => {
      cy.openFile('TEST.CBL');
      cy.goToLine(23).getLineByNumber(23).type('{end}{backspace};');
      cy.getLineByNumber(23).should('not.have.class', '.squiggly-error');
    });
  });
});
