/*
 * Copyright (c) 2019 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.service.delegates.validations;

public enum LanguageEngines {
  CBL("cbl", new CobolLanguageEngineFacade()),
  COB("cob", new CobolLanguageEngineFacade()),
  CPY("cpy", new CobolLanguageEngineFacade()),
  COBOL("COBOL", new CobolLanguageEngineFacade());

  private String languageId;
  private LanguageEngineFacade engine;

  LanguageEngines(String languageId, LanguageEngineFacade engine) {
    this.languageId = languageId;
    this.engine = engine;
  }

  public static LanguageEngineFacade getLanguageEngineById(String languageId) {

    for (LanguageEngines enumHandler : LanguageEngines.values()) {
      if (enumHandler.getLanguageId().equals(languageId)) {
        return enumHandler.getLanguageEngine();
      }
    }
    return null;
  }

  public LanguageEngineFacade getLanguageEngine() {
    return engine;
  }

  public String getLanguageId() {
    return languageId;
  }
}
