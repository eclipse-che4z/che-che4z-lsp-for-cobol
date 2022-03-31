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

context('This is a Zowe integration spec file', () => {
  /* Variables Panel */
  const basePath = 'test_files/project/.c4z/.copybooks/local/CLIST/';
  const TEST = basePath + 'TEST.cpy';
  const ASTRO = basePath + 'ASTRO.cpy';
  const FOO = basePath + 'FOO.cpy';
  const NOTFOUND = basePath + 'NOTFOUND.cpy';
  const NOTFOUND_NESTED = basePath + 'COPYNF.cpy';
  const ERR = basePath + 'ERR';

  /* Functions Panel */
  function getHoverMessage(line, message) {
    return cy.goToLine(line).getCurrentLineErrors({ expectedLine: line }).getHoverErrorMessage().contains(message);
  }

  function addCopybookAndGetHoverMessage(line, copybook, message) {
    return cy
      .getLineByNumber(48)
      .type(`{end}{enter}             COPY ${copybook}.`)
      .goToLine(line)
      .getCurrentLineErrors({ expectedLine: line })
      .getHoverErrorMessage()
      .contains(message);
  }

  function popupMsg(message) {
    return cy.get(IDE.popUpMsg).should('contain', message);
  }

  function resolveCopybook(line, text) {
    return cy.getLineByNumber(line).findText(text).click().type('{ctrl}.').get('.p-Menu-itemLabel').eq(0).click();
  }

  describe('TC219568 Copybook is (semi) automatically downloaded', () => {
    it(['zowe'], 'Checks that copybook was downloaded', () => {
      cy.openFile('HOVER.CBL');
      addCopybookAndGetHoverMessage(49, 'TEST', 'TEST: Copybook not found');
      cy.task('isFileExists', TEST).should('be.false');
      cy.updateConfigs('clist_local');
      getHoverMessage(49, 'TEST: Copybook not found');
      cy.task('isFileExists', TEST).should('be.true');
    });
  });

  describe('TC219569 Nested Copybook is (semi) automatically downloaded', () => {
    it(['zowe'], 'Checks that nested copybooks were downloaded', () => {
      cy.openFile('HOVER.CBL');
      addCopybookAndGetHoverMessage(49, 'ASTRO', 'ASTRO: Copybook not found');

      cy.updateConfigs('clist_local');

      resolveCopybook(49, 'ASTRO');
      popupMsg('Fetching copybooks');

      cy.task('isFileExists', ASTRO).should('be.true');
      // FOO member has a 5s delay
      cy.wait(6000).task('isFileExists', FOO).should('be.true');
    });
  });

  describe('TC219570 Nested Copybook is (semi) automatically downloaded', () => {
    it(['zowe'], 'Cobol file has a syntax error in case copybook is missing ', () => {
      cy.openFile('HOVER.CBL');
      addCopybookAndGetHoverMessage(49, 'NOTFOUND', 'NOTFOUND: Copybook not found');
      cy.updateConfigs('clist_local');
      resolveCopybook(49, 'NOTFOUND');
      popupMsg('Missing copybooks: NOTFOUND');
      cy.task('isFileExists', NOTFOUND).should('be.false');
    });
  });

  describe('TC219571 Cobol file has a syntax error in case nested copybook is missing ', () => {
    it(['zowe'], 'Checks nested copybook missing', () => {
      cy.openFile('HOVER.CBL');
      addCopybookAndGetHoverMessage(49, 'COPYNF', 'COPYNF: Copybook not found');

      cy.updateConfigs('clist_local');

      resolveCopybook(49, 'COPYNF');

      cy.task('isFileExists', NOTFOUND_NESTED).should('be.true');
      cy.task('isFileExists', NOTFOUND).should('be.false');
    });
  });

  describe('TC312870 Wrong profile credentials - one profile ', () => {
    beforeEach(() => {
      cy.updateConfigs('clist_wrongpass');
    });
    it(['zowe'], 'Wrong profile credentials - one profile', () => {
      cy.openFile('HOVER.CBL');

      addCopybookAndGetHoverMessage(49, 'NOTFOUND', 'NOTFOUND: Copybook not found');

      resolveCopybook(49, 'NOTFOUND');
      popupMsg('Missing copybooks: NOTFOUND');

      getHoverMessage(49, 'NOTFOUND: Copybook not found');
      resolveCopybook(49, 'NOTFOUND');

      popupMsg(
        'Invalid credentials for profile: wrongPass. Copybook retrieval is blocked. Ensure the profile contains correct credentials.',
      )
        .get(IDE.theiaButton)
        .contains('Unblock and retry')
        .click();

      popupMsg('Missing copybooks: NOTFOUND');

      cy.task('isFileExists', NOTFOUND).should('be.false');
    });
  });

  describe('TC312876 Wrong profile credentials - no password ', () => {
    beforeEach(() => {
      cy.updateConfigs('clist_nopass');
    });
    it(['zowe'], 'Verify that server detects a no Pass credential response.', () => {
      cy.openFile('HOVER.CBL');
      addCopybookAndGetHoverMessage(49, 'ASTRO', 'ASTRO: Copybook not found');
      resolveCopybook(49, 'ASTRO');
      popupMsg('No password in Zowe profile noPass.');

      cy.task('isFileExists', ASTRO).should('be.false');

      cy.updateConfigs('clist_local');
      resolveCopybook(49, 'ASTRO');
      cy.task('isFileExists', ASTRO).should('be.true');
    });
  });

  describe('TC312871 Wrong profile credentials - change to a valid profile', () => {
    beforeEach(() => {
      cy.updateConfigs('clist_wrongpass');
    });
    it(['zowe'], 'Wrong profile credentials - change to a valid profile', () => {
      cy.openFile('HOVER.CBL');
      addCopybookAndGetHoverMessage(49, 'ASTRO', 'ASTRO: Copybook not found').wait(500);
      resolveCopybook(49, 'ASTRO');
      popupMsg('Incorrect credentials in Zowe profile wrongPass.');

      cy.task('isFileExists', ASTRO).should('be.false');

      cy.updateConfigs('clist_local');
      resolveCopybook(49, 'ASTRO');
      cy.task('isFileExists', ASTRO).should('be.true');
    });
  });

  describe('TC312877 Wrong profile credentials - change from invalid  profile to noPass and vice versa', () => {
    beforeEach(() => {
      cy.updateConfigs('clist_wrongpass');
    });
    it(['zowe'], 'Wrong profile credentials - change from invalid  profile to noPass and vice versa', () => {
      cy.openFile('HOVER.CBL');
      addCopybookAndGetHoverMessage(49, 'ASTRO', 'ASTRO: Copybook not found').wait(500);
      resolveCopybook(49, 'ASTRO');
      popupMsg('Incorrect credentials in Zowe profile wrongPass.');
      cy.task('isFileExists', ASTRO).should('be.false');

      cy.updateConfigs('clist_nopass');
      getHoverMessage(49, 'ASTRO: Copybook not found');
      resolveCopybook(49, 'ASTRO');
      popupMsg('No password in Zowe profile noPass.');
      cy.task('isFileExists', ASTRO).should('be.false');
    });
  });

  describe('TC320158 Get 501 error', () => {
    beforeEach(() => {
      cy.updateConfigs('clist_local');
    });
    it(['zowe'], 'Get 501 error', () => {
      cy.openFile('HOVER.CBL');
      addCopybookAndGetHoverMessage(49, 'ERR', 'ERR: Copybook not found').wait(500);
      resolveCopybook(49, 'ERR');
      popupMsg('Error: Rest API failure with HTTP(S) status 501');
      cy.task('isFileExists', ERR).should('be.false');
    });
  });

  describe('TC219573 Nested Recursive Copybooks are downloaded and error is shown', () => {
    beforeEach(() => {
      cy.updateConfigs('clist_local');
    });
    it(['zowe'], 'Nested Recursive Copybooks are downloaded and error is shown', () => {
      cy.openFile('HOVER.CBL');
      addCopybookAndGetHoverMessage(49, 'RECUR1', 'RECUR1: Copybook not found').wait(500);
      resolveCopybook(49, 'RECUR1');
      resolveCopybook(49, 'RECUR1');
      getHoverMessage(49, 'Recursive copybook declaration for: RECUR2');
    });
  });
});
