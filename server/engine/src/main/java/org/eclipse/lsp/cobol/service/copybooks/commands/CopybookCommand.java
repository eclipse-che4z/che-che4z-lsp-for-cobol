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
package org.eclipse.lsp.cobol.service.copybooks.commands;

import lombok.AllArgsConstructor;
import org.eclipse.lsp.cobol.core.model.CopybookName;
import org.eclipse.lsp.cobol.service.SettingsService;

/**
 * This interface describes endpoints for extended API
 */

@AllArgsConstructor
public class CopybookCommand {

  final SettingsService settingsService;
  final String cobolFilename;
  final CopybookName copybookName;

  void resolve() {

  }

  void download() {

  }

}
