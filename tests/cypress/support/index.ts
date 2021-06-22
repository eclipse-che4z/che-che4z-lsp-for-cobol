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

// ***********************************************************
// This example support/index.js is processed and
// loaded automatically before your test files.
//
// This is a great place to put global configuration and
// behavior that modifies Cypress.
//
// You can change the location of this file or turn off
// automatically serving support files with the
// 'supportFile' configuration option.
//
// You can read more here:
// https://on.cypress.io/configuration
// ***********************************************************

import '@eclipse/che-che4z/tests';
import '@shelex/cypress-allure-plugin';

const baseUrl = Cypress.config('baseUrl');

const username = Cypress.env('username');
const password = Cypress.env('password');

beforeEach(() => {
  cy.task('deleteFile', 'test_files/project/.vscode/settings.json');
  cy.task('deleteFile', 'test_files/project/.theia/settings.json');
  cy.task('deleteFile', 'test_files/project/testing/BOOK3.cpy');
  cy.task('deleteFile', 'test_files/project/.vscode/launch.json');
  cy.task('deleteFile', 'test_files/project/.theia/launch.json');
  cy.task('deleteFile', 'test_files/project/.copybooks/zowe-profile-1/DATA.SET.PATH2/BOOK3.cpy');
  cy.task('deleteFile', 'test_files/project/s.cbl');
  cy.task('deleteFile', 'test_files/project/.c4z/.copybooks');
  cy.task('deleteFile', 'test_files/project/testing/UTF8');
  cy.visit('/', {
    onBeforeLoad: (win) => {
      win.sessionStorage.clear();
    },
  });
  cy.clearCookies();
  cy.clearLocalStorage();
  cy.waitForAppStart();
  cy.openFileExplorer();
});

Cypress.on('uncaught:exception', (err, runnable) => {
  // returning false here prevents Cypress from
  // failing the test
  return false;
});
