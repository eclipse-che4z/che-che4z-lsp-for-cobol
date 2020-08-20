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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.service.delegates.completions;

import com.google.inject.Singleton;

import java.io.InputStream;

/** This class is a provider for Cobol Snippets */
@Singleton
public class Snippets extends CompletionStorage {
  private static final String SNIPPETS_FILE_PATH = "LanguageSnippets.txt";

  @Override
  protected InputStream getInputStream() {
    return Snippets.class.getResourceAsStream(SNIPPETS_FILE_PATH);
  }
}
