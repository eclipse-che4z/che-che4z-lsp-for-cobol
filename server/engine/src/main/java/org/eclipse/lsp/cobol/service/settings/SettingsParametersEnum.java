/*
 * Copyright (c) 2020 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */

package org.eclipse.lsp.cobol.service.settings;

/**
 * This enum contains the structure of the settings.json that contains the MF related settings to
 * search a copybook.
 */
public enum SettingsParametersEnum {
  COPYBOOK_RESOLVE("copybook-resolve"),
  COPYBOOK_DOWNLOAD("copybook-download"),
  QUIET("quiet"),
  VERBOSE("verbose"),
  DATASETS("cpy-manager.paths-dsn"),
  CPY_LOCAL_PATHS("cpy-manager.paths-local"),
  CPY_EXTENSIONS("cpy-manager.copybook-extensions"),
  SUBROUTINE_LOCAL_PATHS("subroutine-manager.paths-local"),
  LSP_PREFIX("cobol-lsp"),
  LOCALE("locale"),
  LOGGING_LEVEL("logging.level.root"),
  TARGET_SQL_BACKEND("target-sql-backend"),
  ANALYSIS_FEATURES("analysis.features"),
  DIALECTS("dialects"),
  CICS_TRANSLATOR_ENABLED("cics.translator"),
  COMPILER_OPTIONS("compiler.options"),
  DIALECT_REGISTRY("dialect.registry");

  public final String label;

  SettingsParametersEnum(String label) {
    this.label = label;
  }
}
