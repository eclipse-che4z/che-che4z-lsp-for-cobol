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
import selectorsCobolLSTheia from '../../support/selectorsCobolLSTheia';
import selectorsDefaultTheia from '../../support/selectorsDefaultTheia';

//F114770 - Cobol LS: Support for IDMS and DAF Trucks specific items [#2]

context('This is F114770 spec', () => {
  describe('TC330911 Enable/disable analysis features', () => {
    it('Basic check (SQL and CICS are enabled', () => {
      cy.openFile('USER1.cbl').getLineByNumber(10).type('{ctrl},');
      cy.get(selectorsDefaultTheia.searchSettings).type('cobol-lsp');
      cy.get(selectorsCobolLSTheia.langFeatures);
      cy.get(selectorsDefaultTheia.addValueSettings).contains('SQL');
      cy.get(selectorsDefaultTheia.addValueSettings).contains('CICS');
    });
  });
});
